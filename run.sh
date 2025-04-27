#! /usr/bin/env bash

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

print_highlighted "Finished setting up. Please reboot your computer."
