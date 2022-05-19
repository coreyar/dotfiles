#!/usr/bin/env bash

# Install command-line tools using Homebrew.

brew install pyenv

echo "------------------------------"
echo "Installing poetry for managing python projects."
curl -sSL https://raw.githubusercontent.com/python-poetry/poetry/master/get-poetry.py | python3 -

echo -e '# Poetry \nexport PATH="$HOME/.poetry/bin:$PATH"' >> .zprofile
source .zprofile

# Enable autocomplete
mkdir -p ~/.zfunc
poetry completions zsh > ~/.zfunc/_poetry

# Remove outdated versions from the cellar.
brew cleanup
