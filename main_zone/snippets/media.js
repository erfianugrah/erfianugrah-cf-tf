/**
 * ESM Cloudflare Worker for cdn.erfi.dev
 *
 * Features:
 * - Configurable path transformations using command pattern
 * - Adds imwidth=1920 if not present
 * - Adjusts max-age by deducting Age from the response
 * - CORS support
 */

// --------------------------------
// CONFIGURATION
// --------------------------------

const CONFIG = {
  // Origin server
  targetDomain: "cdn.erfi.dev",
  pathPrefix: "",

  // Response headers
  responseHeaders: {
    "Access-Control-Allow-Origin": "*",
    "Access-Control-Allow-Methods": "GET, HEAD, OPTIONS",
    "Access-Control-Max-Age": "86400",
  },

  // Cache settings
  cacheTtl: 3600, // 1 hour

  // Default query parameters
  defaultParams: {
    "imwidth": "1920",
  },

  // Path transformation rules
  pathRules: [
    // Handle both pvid formats
    {
      type: "RegexReplace",
      pattern: /\/pvid-[^/]+/g,
      replacement: "",
    },
    {
      type: "RegexReplace",
      pattern: /\/pvid\//g,
      replacement: "/",
    },
  ],
};

// --------------------------------
// PATH TRANSFORMATION COMMANDS
// --------------------------------

/**
 * Base command interface
 */
class PathCommand {
  transform(path) {
    // To be implemented by subclasses
    return path;
  }
}

/**
 * Command that transforms paths using regex
 */
class RegexReplaceCommand extends PathCommand {
  constructor(pattern, replacement) {
    super();
    this.pattern = pattern;
    this.replacement = replacement;
  }

  transform(path) {
    // Quick check before applying regex - improves performance
    if (this.pattern.source.includes("pvid") && !path.includes("pvid")) {
      return path;
    }
    return path.replace(this.pattern, this.replacement);
  }
}

/**
 * Factory for creating path transformation commands
 */
class PathCommandFactory {
  static createCommand(rule) {
    switch (rule.type) {
      case "RegexReplace":
        return new RegexReplaceCommand(rule.pattern, rule.replacement);
      default:
        console.warn(`Unknown rule type: ${rule.type}`);
        return new PathCommand(); // Return no-op command as fallback
    }
  }
}

// --------------------------------
// REQUEST/RESPONSE PROCESSORS
// --------------------------------

/**
 * Process request URL
 */
class RequestProcessor {
  constructor(config) {
    this.config = config;
    this.commands = config.pathRules.map((rule) =>
      PathCommandFactory.createCommand(rule)
    );
  }

  /**
   * Apply path transformations
   */
  transformPath(pathname) {
    return this.commands.reduce((path, command) => {
      return command.transform(path);
    }, pathname);
  }

  /**
   * Process a request
   */
  process(request) {
    // Parse the original URL
    const url = new URL(request.url);

    // Apply path transformations
    const transformedPath = this.transformPath(url.pathname);

    // Log before and after transformation (for debugging)
    console.log(`Path transformation: ${url.pathname} -> ${transformedPath}`);

    // Create target URL
    const targetUrl = new URL(
      `https://${this.config.targetDomain}${this.config.pathPrefix}${transformedPath}`,
    );

    // Copy all existing parameters
    url.searchParams.forEach((value, key) => {
      targetUrl.searchParams.set(key, value);
    });

    // Add default parameters if not present
    for (const [key, value] of Object.entries(this.config.defaultParams)) {
      if (!url.searchParams.has(key)) {
        targetUrl.searchParams.set(key, value);
      }
    }

    return targetUrl.toString();
  }
}

/**
 * Process response headers
 */
class ResponseProcessor {
  constructor(config) {
    this.config = config;
  }

  /**
   * Adjust max-age in Cache-Control based on Age header
   */
  adjustCacheControl(response) {
    const headers = new Headers(response.headers);
    const cacheControl = response.headers.get("Cache-Control");
    const age = parseInt(response.headers.get("Age") || "0", 10);

    // If no Cache-Control exists, add a default one
    if (!cacheControl) {
      headers.set("Cache-Control", `public, max-age=${CONFIG.cacheTtl}`);
    } // Otherwise adjust max-age by subtracting Age
    else {
      const maxAgeMatch = cacheControl.match(/max-age=(\d+)/);
      if (maxAgeMatch && maxAgeMatch[1]) {
        const maxAge = parseInt(maxAgeMatch[1], 10);
        const remainingAge = Math.max(0, maxAge - age);

        const newCacheControl = cacheControl.replace(
          /max-age=\d+/,
          `max-age=${remainingAge}`,
        );

        headers.set("Cache-Control", newCacheControl);
      } else {
        // If max-age isn't in the Cache-Control header, add it
        headers.set(
          "Cache-Control",
          `${cacheControl}, max-age=${CONFIG.cacheTtl}`,
        );
      }
    }

    // Remove any no-store or no-cache directives that would prevent caching
    let updatedCacheControl = headers.get("Cache-Control");
    updatedCacheControl = updatedCacheControl
      .replace(/no-store,?\s*/g, "")
      .replace(/no-cache,?\s*/g, "")
      .replace(/private,?\s*/g, "public,");

    headers.set("Cache-Control", updatedCacheControl);

    // Add response headers from config, preserving all original headers
    Object.entries(this.config.responseHeaders).forEach(([name, value]) => {
      headers.set(name, value);
    });

    return new Response(response.body, {
      status: response.status,
      statusText: response.statusText,
      headers: headers,
    });
  }
}

// --------------------------------
// MAIN WORKER
// --------------------------------

/**
 * Handle CORS preflight requests
 */
function handleCorsRequest() {
  return new Response(null, {
    status: 204,
    headers: {
      "Access-Control-Allow-Origin":
        CONFIG.responseHeaders["Access-Control-Allow-Origin"],
      "Access-Control-Allow-Methods":
        CONFIG.responseHeaders["Access-Control-Allow-Methods"],
      "Access-Control-Allow-Headers": "Content-Type, Range",
      "Access-Control-Max-Age":
        CONFIG.responseHeaders["Access-Control-Max-Age"],
    },
  });
}

/**
 * Create headers for the proxy request by preserving original headers
 */
function createProxyHeaders(request) {
  const headers = new Headers(request.headers);

  // For byte range requests, ensure the Range header is properly preserved
  if (request.headers.has("Range")) {
    const rangeValue = request.headers.get("Range");
    console.log(`Forwarding Range header: ${rangeValue}`);
  }

  // Add or modify specific headers if needed
  if (!headers.has("User-Agent")) {
    headers.set("User-Agent", "Cloudflare Worker");
  }

  return headers;
}

// Export the worker
export default {
  async fetch(request, env, ctx) {
    try {
      // Check if the request method is allowed
      if (!["GET", "HEAD", "OPTIONS"].includes(request.method)) {
        return new Response("Method not allowed", { status: 405 });
      }

      // Handle CORS preflight requests
      if (request.method === "OPTIONS") {
        return handleCorsRequest();
      }

      // Process the request
      const requestProcessor = new RequestProcessor(CONFIG);
      const targetUrl = requestProcessor.process(request);

      // Create a completely new request to ensure original path isn't leaked
      const newRequest = new Request(targetUrl, {
        method: request.method,
        headers: createProxyHeaders(request),
        body: request.body,
      });

      // Fetch from origin with explicit caching settings
      const response = await fetch(newRequest, {
        cf: {
          // Force caching for this request
          cacheTtl: CONFIG.cacheTtl,
        },
      });

      // Process the response
      const responseProcessor = new ResponseProcessor(CONFIG);
      return responseProcessor.adjustCacheControl(response);
    } catch (error) {
      const errorInfo = {
        message: error.message,
        stack: error.stack,
        url: request.url,
        method: request.method,
        timestamp: new Date().toISOString(),
      };
      console.error("Worker error:", JSON.stringify(errorInfo));
      return new Response("Internal Server Error", { status: 500 });
    }
  },
};
