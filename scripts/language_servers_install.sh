#!/bin/bash

# LSP packages to install
packages=(
    "python-lsp-server"
    "pyright"
    "gopls"
    "lua-language-server"
    "typescript-language-server"
    "rust-analyzer"
    "clang"
    "jedi-language-server"
    "ruff-lsp"
    "volar"
    "solargraph"
    "texlab"
    "taplo"
)

echo "${YELLOW}Installing LSP servers..."

for pkg in "${packages[@]}"; do
    echo "Installing $pkg..."
    yay -S --noconfirm "$pkg"
done

echo "All LSP servers installed!"
