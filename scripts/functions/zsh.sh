#! /usr/bin/env bash

export ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

install_zinit() {
    echo "Checking if zinit is already installed..."
    if [ -x "$(command -v git)" ] && [ ! -d "$ZINIT_HOME" ]; then
        mkdir -p "$(dirname $ZINIT_HOME)"
        git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
    else
        echo "zinit is already installed, skipping installation."
    fi
}
