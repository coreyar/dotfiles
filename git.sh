#!/usr/bin/env bash

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until `osxprep.sh` has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

echo "------------------------------"
echo "Installing git."

# brew install git

echo "------------------------------"
echo "Updating settings."
read -p "Set name in global git config: " USERNAME;
echo "";
git config --global user.name $USERNAME

read -p "Set email in global git config: " EMAIL;
echo "";
git config --global user.email $EMAIL

git config --global core.editor "code --wait"
git config --global fetch.prune true
git config --global status.short true
