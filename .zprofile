source ~/.zshrc
# Work specific env vars and aliases
source "$HOME/.work"

export PATH=/usr/local/bin:$PATH

# MySQL
export MYSQL_PATH=/usr/local/Cellar/mysql/5.6.27
export PATH=$PATH:$MYSQL_PATH/bin

# Python
## Python3
export PATH="/usr/local/opt/python/libexec/bin:$PATH"


# Customize prompt
export PYTHONSTARTUP="$HOME/.pyprompt.py"

# Java
export PATH="/usr/local/opt/openjdk/bin:$PATH"
export CLASSPATH="$PATH:~/Library/Java/Extensions/activation-1.1.1"

# Android
export ANDROID_HOME=~/Library/Android/sdk
export PATH=${PATH}:${ANDROID_HOME}/emulator
export PATH=${PATH}:${ANDROID_HOME}/tools
export PATH="~/Library/Android/sdk/platform-tools:$PATH"

export PATH="~/gradle-2.11/bin:$PATH"

# Golang
GOPATH=~/code

# Colors
PS1='\w\[\033[0;32m\]$( git branch 2> /dev/null | cut -f2 -d\* -s | sed "s/^ / [/" | sed "s/$/]/" )\[\033[0m\] \$ '

# Tell grep to highlight matches
export GREP_OPTIONS='--color=auto'

# Tell ls to be colourful
export CLICOLOR=1
export LSCOLORS=Exfxcxdxbxegedabagacad


alias delete-branches='git branch | egrep -v "(^\*|master|dev|qa|staging)" | xargs git branch -D'
alias deeplink='xcrun simctl openurl booted'
alias bootprj='~/.start-tmux.sh'
alias kmux='tmux kill-server'
alias vundle="vim +PluginInstall +qall"
