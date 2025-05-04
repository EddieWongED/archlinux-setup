#! /usr/bin/env bash

export DOTFILES_DIR="$HOME/dotfiles"

function sync_dotfiles() {
    if [ ! -d "$DOTFILES_DIR" ]; then
        echo "Cloning dotfiles repo into $DOTFILES_DIR..."
        git clone https://github.com/EddieWongED/dotfiles.git "$DOTFILES_DIR" || {
            echo "Failed to clone repository."
            return 1
        }
    else
        echo "Dotfiles directory exists. Syncing with remote..."
        cd "$DOTFILES_DIR" || {
            echo "Failed to enter $DOTFILES_DIR"
            return 1
        }
        git pull || {
            echo "Failed to pull latest changes."
            return 1
        }
    fi

    # Run stow to apply dotfiles
    echo "Applying dotfiles with stow..."
    cd "$DOTFILES_DIR" || return 1
    stow . || {
        echo "Stow failed."
        return 1
    }

    echo "Dotfiles synced and applied successfully."
}
