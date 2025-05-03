#! /usr/bin/env bash

upgrade_packages() {
    sudo pacman -Syu --noconfirm
}

update_keyrings() {
    sudo pacman -Sy --noconfirm archlinux-keyring
}

install_packages() {
    local packages=("$@")
    sudo pacman -S --noconfirm "${packages[@]}"
}
