#! /usr/bin/env bash

node_version="22"
python_version="3.11.9"

SCRIPT_DIR=$(dirname -- "$(readlink -f -- "$BASH_SOURCE")")

echo $SCRIPT_DIR

source $SCRIPT_DIR/scripts/functions/utils/print.sh
source $SCRIPT_DIR/scripts/functions/pacman.sh
source $SCRIPT_DIR/scripts/functions/logo.sh
source $SCRIPT_DIR/scripts/functions/utils/file.sh

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
source $SCRIPT_DIR/scripts/functions/paru.sh
install_paru

# Install packages
bash $SCRIPT_DIR/scripts/install_packages.sh

# Install zinit
print_highlighted "Installing zinit..."
source $SCRIPT_DIR/scripts/functions/zsh.sh
install_zinit

# Install tpm
print_highlighted "Installing tpm..."
source $SCRIPT_DIR/scripts/functions/tmux.sh
install_tpm

# Install nvm
print_highlighted "Installing nvm..."
source $SCRIPT_DIR/scripts/functions/nodejs.sh
install_nvm
install_nvm_node_version "$node_version"
set_default_nvm_node_version "$node_version"

# Install pyenv
print_highlighted "Installing pyenv..."
source $SCRIPT_DIR/scripts/functions/python.sh
install_pyenv
install_pyenv_python_version "$python_version"
set_default_pyenv_python_version "$python_version"

# Input method
print_highlighted "Setting up input method..."
append_lines "$SCRIPT_DIR/configs/input_method.conf" "/etc/security/pam_env.conf"

# Dotfiles
print_highlighted "Setting up dotfiles..."
source $SCRIPT_DIR/scripts/functions/stow.sh
sync_dotfiles

print_highlighted "Finished setting up. Please reboot your computer to take effect."
