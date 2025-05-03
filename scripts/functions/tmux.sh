#! /usr/bin/env bash

export TPM_HOME="${HOME}/.tmux/plugins/tpm"

install_tpm() {
    echo "Checking if tpm is already installed..."
    if [ -x "$(command -v git)" ] && [ -x "$(command -v tmux)" ] && [ ! -d "$TPM_HOME" ]; then
        mkdir -p "$(dirname $TPM_HOME)"
        git clone https://github.com/tmux-plugins/tpm "$TPM_HOME"
    else
        echo "tpm is already installed, skipping installation."
    fi
}
