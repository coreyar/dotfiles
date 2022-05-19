#!/usr/bin/env bash

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until `osxprep.sh` has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

echo "------------------------------"
echo "Installing nvm to manage node versions."

brew install nvm
# You should create NVM's working directory if it doesn't exist:
mkdir -p ~/.nvm

# Add the following to ~/.zshrc or your desired shell
echo "# NVM - export configuration file, load nvm, load nvm bash_completion" >> .zprofile
echo -e 'export NVM_DIR="$HOME/.nvm"\n[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"\n[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"' >> .zprofile
source .zprofile

echo "------------------------------"
echo "Installing latest lts node."
LTS_NODE_VERSION=$(nvm ls-remote --lts --no-colors | sed -nre '$s/^[^0-9]*(([0-9]+\.)*[0-9]+).*/\1/p')
nvm install $LTS_NODE_VERSION

# Remove outdated versions from the cellar.
brew cleanup

echo "------------------------------"
echo "Installing yarn."
