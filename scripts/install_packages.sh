#! /usr/bin/env bash

# Install system packages
print_highlighted "Installing system packages..."
source ./packages/system.conf
install_packages "${SYSTEM_PACKAGES[@]}"

# Install audio packages
print_highlighted "Installing audio packages..."
source ./packages/audio.conf
install_packages "${AUDIO_PACKAGES[@]}"

# Install network packages
print_highlighted "Installing network packages..."
source ./packages/network.conf
install_packages "${NETWORK_PACKAGES[@]}"

# Install desktop packages
print_highlighted "Installing desktop packages..."
source ./packages/desktop.conf
install_packages "${DESKTOP_PACKAGES[@]}"
install_packages_aur "${DESKTOP_PACKAGES_AUR[@]}"

# Install font packages
print_highlighted "Installing font packages..."
source ./packages/font.conf
install_packages "${FONT_PACKAGES[@]}"
install_packages_aur "${FONT_PACKAGES_AUR[@]}"

# Install input method packages
print_highlighted "Installing input method packages..."
source ./packages/input_method.conf
install_packages "${INPUT_METHOD_PACKAGES[@]}"

# Install input dev packages
print_highlighted "Installing dev packages..."
source ./packages/dev.conf
install_packages "${DEV_PACKAGES[@]}"
install_packages_aur "${DEV_PACKAGES_AUR[@]}"

# Install input app packages
print_highlighted "Installing app packages..."
source ./packages/app.conf
install_packages "${APP_PACKAGES[@]}"
install_packages_aur "${APP_PACKAGES_AUR[@]}"
