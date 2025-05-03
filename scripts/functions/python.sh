#! /usr/bin/env bash

export PYENV_ROOT="$HOME/.pyenv"

install_pyenv() {
    echo "Checking if pyenv is already installed..."
    if [ ! -d $PYENV_ROOT/bin ]; then
        curl -fsSL https://pyenv.run | bash
    else
        echo "pyenv is already installed, skipping installation."
    fi
}

is_pyenv_version_installed() {
    local version=$1
    if pyenv versions --bare | grep -qx "$version"; then
        return 0  # version found
    else
        return 1  # version not found
    fi
}

install_pyenv_python_version() {
    if [ ! -d $PYENV_ROOT/bin ]; then
        echo "pyenv not found."
        return 1
    fi
    
    local version=$1

    if is_pyenv_version_installed "$version"; then
        echo "python $version is already installed, skipping installation."
        return
    fi

    echo "Installing python version $version using pyenv..."
    pyenv install "$version"
}

set_default_pyenv_python_version() {
    if [ ! -d $PYENV_ROOT/bin ]; then
        echo "pyenv not found."
        return 1
    fi

    local version=$1
    echo "Setting default python version to $version using pyenv..."
    pyenv global "$version"
}

