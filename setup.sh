#!/usr/bin/env bash
#
# bootstrap installs things.
# lifted  and modified from https://github.com/holman/dotfiles
 
DOTFILES_ROOT=$(pwd -P)

set -e

echo ''

info () {
  printf "\r  [ \033[00;34m..\033[0m ] $1\n"
}

user () {
  printf "\r  [ \033[0;33m??\033[0m ] $1\n"
}

success () {
  printf "\r\033[2K  [ \033[00;32mOK\033[0m ] $1\n"
}

fail () {
  printf "\r\033[2K  [\033[0;31mFAIL\033[0m] $1\n"
  echo ''
  exit
}

link_file () {
  local src=$1 dst=$2

  local overwrite= backup= skip=
  local action=

  if [ -f "$dst" -o -d "$dst" -o -L "$dst" ]
  then

    if [ "$overwrite_all" == "false" ] && [ "$backup_all" == "false" ] && [ "$skip_all" == "false" ]
    then

      local currentSrc="$(readlink $dst)"

      if [ "$currentSrc" == "$src" ]
      then

        skip=true;

      else

        user "File already exists: $dst ($(basename "$src")), what do you want to do?\n\
        [s]kip, [S]kip all, [o]verwrite, [O]verwrite all, [b]ackup, [B]ackup all?"
        read -n 1 action

        case "$action" in
          o )
            overwrite=true;;
          O )
            overwrite_all=true;;
          b )
            backup=true;;
          B )
            backup_all=true;;
          s )
            skip=true;;
          S )
            skip_all=true;;
          * )
            ;;
        esac

      fi

    fi

    overwrite=${overwrite:-$overwrite_all}
    backup=${backup:-$backup_all}
    skip=${skip:-$skip_all}

    if [ "$overwrite" == "true" ]
    then
      rm -rf "$dst"
      success "removed $dst"
    fi

    if [ "$backup" == "true" ]
    then
      mv "$dst" "${dst}.backup"
      success "moved $dst to ${dst}.backup"
    fi

    if [ "$skip" == "true" ]
    then
      success "skipped $src"
    fi
  fi

  if [ "$skip" != "true" ]  # "false" or empty
  then
    ln -s "$1" "$2"
    success "linked $1 to $2"
  fi
}

install_dotfiles () {
  info 'installing dotfiles'

  local overwrite_all=false backup_all=false skip_all=false

  for src in $(find -H "$DOTFILES_ROOT" -maxdepth 2 -name '.*' -not -path '*.git*' ! -name '.DS_Store')
  do
    dst="$HOME/$(basename "$src")"
    link_file "$src" "$dst"
  done
  echo '  Dot files all set!'
}

function runDots() {
  # https://github.com/donnemartin/dev-setup
  # Ask for the administrator password upfront
  sudo -v

  # Keep-alive: update existing `sudo` time stamp until the script has finished
  while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

  # Run the osxprep.sh Script
  echo ""
  echo "------------------------------"
  echo "Updating OSX and installing Xcode command line tools"
  echo "------------------------------"
  echo ""
  ./osxprep.sh

  # Run the brew.sh Script
  echo ""
  echo "------------------------------"
  echo "Installing Homebrew along with some common formulae and apps."
  echo "This might take a while to complete, as some formulae need to be installed from source."
  echo "------------------------------"
  echo ""
  ./brew.sh

  # Run the osx.sh Script
  echo ""
  echo "------------------------------"
  echo "Setting sensible OSX defaults."
  echo "------------------------------"
  echo ""
  ./osx.sh

  # Run the node.sh Script
  echo ""
  echo "------------------------------"
  echo "Setting up node environment."
  echo "------------------------------"
  echo ""
  ./node.sh

  # Run the python.sh Script
  echo ""
  echo "------------------------------"
  echo "Setting up python environment."
  echo "------------------------------"
  echo ""
  ./python.sh

  # Run the git.sh Script
  echo ""
  echo "------------------------------"
  echo "Setting up git."
  echo "------------------------------"
  echo ""
  ./git.sh

  # Run the zshell.sh Script
  echo ""
  echo "------------------------------"
  echo "Setting up zshell."
  echo "------------------------------"
  echo ""
  ./zshell.sh

  # Run the iterm.sh Script
  echo ""
  echo "------------------------------"
  echo "Setting up iterm."
  echo "------------------------------"
  echo ""
  ./iterm.sh

  install_dotfiles
  echo "------------------------------"
  echo "Completed running .dots, restart your computer to ensure all updates take effect"
  echo "------------------------------"
}

read -p "This script may overwrite existing files in your home directory. Are you sure? (y/n)" -n 1;
echo "";
if [[ $REPLY =~ ^[Yy]$ ]]; then
  runDots $@
  # Run the cleanup.sh Script
  echo ""
  echo "------------------------------"
  echo "Cleaning up"
  echo "------------------------------"
  echo ""
  ./cleanup.sh
fi;

unset runDots;
