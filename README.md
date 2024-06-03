# Mozilla SOPS and Age Encryption
Install [Age](https://github.com/FiloSottile/age) and [Mozilla SOPS](https://github.com/getsops/sops)

# Generate Key
```sh
chmod +x /usr/local/bin/sops
age-keygen -o key.txt
```

# Use key to encrypt `.tf` and `.tfvars` files
Refer to my dotfiles [repo](https://github.com/erfianugrah/dotfiles/blob/windows/functions.zsh) for functions to automate this into a single call
