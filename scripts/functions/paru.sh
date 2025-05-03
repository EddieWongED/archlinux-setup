#! /usr/bin/env bash

function install_paru() {
    echo "Checking if paru is already installed..."
    if which paru > /dev/null 2>&1; then
        echo "paru is already installed, skipping installation."
        return
    fi

    echo "paru not found, installing paru..."

    if [ -d "/tmp/paru" ]; then
        rm -rf /tmp/paru
    fi

    git clone https://aur.archlinux.org/paru.git /tmp/paru
    cd /tmp/paru && makepkg -si
}

install_packages_aur() {
    local packages=("$@")
    paru -S --noconfirm "${packages[@]}"
}
