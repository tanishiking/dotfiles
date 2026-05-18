#!/bin/bash
# postinstall hook for mise
# Installs tools that cannot be managed by mise registry

set -e

if command -v brew &> /dev/null; then
    # Tools that need to stay in Homebrew (system libs, apps, not in mise registry)
    BREW_PACKAGES=(
        binaryen
        clang-format
        coreutils
        findutils
        git
        gnu-time
        gnupg
        btop
        pure
        tree
        wget
        zsh
        zsh-async
        docker
        polyml
    )

    for pkg in "${BREW_PACKAGES[@]}"; do
        if ! brew list "$pkg" &> /dev/null; then
            echo "Installing $pkg via Homebrew..."
            brew install "$pkg"
        fi
    done
fi
