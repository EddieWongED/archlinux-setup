#! /usr/bin/env bash

upgrade_packages() {
    sudo pacman -Syu
}

update_keyrings() {
    sudo pacman -Sy archlinux-keyring
}

install_packages() {
    local packages=("$@")
    sudo pacman -S "${packages[@]}"
}
