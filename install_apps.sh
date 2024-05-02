#!/bin/bash

# Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Install applications from Brew
brew install \
    htop \
    kitty \
    jetbrains-toolbox \
    postman \
    spotify \
    rectangle \
    sublime-text \
    vlc \
    slack \
    firefox

# Open the App Store link for Xcode
open "https://apps.apple.com/us/app/xcode/id497799835?mt=12"

" TODO: Add .vimrc, .zshrc support for this, see GitHub issues further
