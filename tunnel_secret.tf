# Generate a random string
resource "random_string" "tunnel_secret" {
  length  = 32
  special = false
}