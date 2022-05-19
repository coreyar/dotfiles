#!/usr/bin/env bash

# Install command-line tools using Homebrew.

echo "------------------------------"
echo "Installing zplug."
brew install zplug
echo -e "export ZPLUG_HOME=/opt/homebrew/opt/zplug\nsource \$ZPLUG_HOME/init.zsh\n$(cat .zshrc)" > .zshrc
source .zshrc

echo "------------------------------"
echo "Installing direnv."
brew install direnv

# Remove outdated versions from the cellar.
brew cleanup
