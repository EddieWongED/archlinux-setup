#! /usr/bin/env bash

export NVM_DIR="$HOME/.nvm"

install_nvm() {
    echo "Checking if nvm is already installed..."
    if [ ! -s "$NVM_DIR/nvm.sh" ]; then
        curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash
    else
        echo "nvm is already installed, skipping installation."
    fi
}

install_nvm_node_version() {
    if [ ! -s "$NVM_DIR/nvm.sh" ]; then
        echo "nvm not found."
        return 1
    fi
    \. "$NVM_DIR/nvm.sh"
    
    local version=$1
    echo "Installing Node.js version $version using nvm..."
    nvm install "$version"
}

set_default_nvm_node_version() {
    if [ ! -s "$NVM_DIR/nvm.sh" ]; then
        echo "nvm not found."
        return 1
    fi
    \. "$NVM_DIR/nvm.sh"
    
    local version=$1
    echo "Setting default Node.js version to $version using nvm..."
    nvm alias default "$version"
    nvm use "$version"
}

