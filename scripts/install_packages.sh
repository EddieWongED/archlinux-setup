#! /usr/bin/env bash

SCRIPT_DIR=$(dirname -- "$(readlink -f -- "$BASH_SOURCE")")

source $SCRIPT_DIR/functions/utils/print.sh
source $SCRIPT_DIR/functions/pacman.sh
source $SCRIPT_DIR/functions/paru.sh

# Install system packages
print_highlighted "Installing system packages..."
source $SCRIPT_DIR/../packages/system.conf
install_packages "${SYSTEM_PACKAGES[@]}"

# Install multimedia packages
print_highlighted "Installing multimedia packages..."
source $SCRIPT_DIR/../packages/multimedia.conf
install_packages "${MULTIMEDIA_PACKAGES[@]}"

# Install daemon packages
print_highlighted "Installing daemon packages..."
source $SCRIPT_DIR/../packages/daemon.conf
install_packages "${DAEMON_PACKAGES[@]}"

# Install desktop packages
print_highlighted "Installing desktop packages..."
source $SCRIPT_DIR/../packages/desktop.conf
install_packages "${DESKTOP_PACKAGES[@]}"
install_packages_aur "${DESKTOP_PACKAGES_AUR[@]}"

# Install font packages
print_highlighted "Installing font packages..."
source $SCRIPT_DIR/../packages/font.conf
install_packages "${FONT_PACKAGES[@]}"
install_packages_aur "${FONT_PACKAGES_AUR[@]}"

# Install input method packages
print_highlighted "Installing input method packages..."
source $SCRIPT_DIR/../packages/input_method.conf
install_packages "${INPUT_METHOD_PACKAGES[@]}"

# Install input dev packages
print_highlighted "Installing dev packages..."
source $SCRIPT_DIR/../packages/dev.conf
install_packages "${DEV_PACKAGES[@]}"
install_packages_aur "${DEV_PACKAGES_AUR[@]}"

# Install input app packages
print_highlighted "Installing app packages..."
source $SCRIPT_DIR/../packages/app.conf
install_packages "${APP_PACKAGES[@]}"
install_packages_aur "${APP_PACKAGES_AUR[@]}"
