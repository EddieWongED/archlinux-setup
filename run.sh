#! /usr/bin/env bash

node_version="22"
python_version="3.11.9"

source ./scripts/functions/print.sh
source ./scripts/functions/pacman.sh
source ./scripts/functions/logo.sh

clear
print_logo

# Exit on error
set -e

# Update keyring
print_highlighted "Updating keyring..."
update_keyrings

# Upgrading packages
print_highlighted "Upgrading packages..."
upgrade_packages

# Install paru
print_highlighted "Installing paru..."
source ./scripts/functions/paru.sh
install_paru

# Install packages
source ./scripts/install_packages.sh

# Install zinit
print_highlighted "Installing zinit..."
source ./scripts/functions/zsh.sh
install_zinit

# Install tpm
print_highlighted "Installing tpm..."
source ./scripts/functions/tmux.sh
install_tpm

# Install nvm
print_highlighted "Installing nvm..."
source ./scripts/functions/nodejs.sh
install_nvm
install_nvm_node_version "$node_version"
set_default_nvm_node_version "$node_version"

# Install pyenv
print_highlighted "Installing pyenv..."
source ./scripts/functions/python.sh
install_pyenv
install_pyenv_python_version "$python_version"
set_default_pyenv_python_version "$python_version"

print_highlighted "Finished setting up. Please reboot your computer to take effect."
