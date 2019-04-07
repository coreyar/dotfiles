export ENV=dev

export PATH=/usr/local/bin:$PATH

# MySQL
export MYSQL_PATH=/usr/local/Cellar/mysql/5.6.27
export PATH=$PATH:$MYSQL_PATH/bin

# Python
## virtualenvwrapper
export WORKON_HOME=~/Envs
source /usr/local/bin/virtualenvwrapper.sh
export PATH=~/Library/Caches/pip/wheels:$PATH
## Python3
export PATH=/usr/local/Cellar/python/3.6.5_1/bin/python3bin:$PATH

# Android
export ANDROID_HOME=~/Library/Android/sdk
export PATH=${PATH}:${ANDROID_HOME}/emulator
export PATH=${PATH}:${ANDROID_HOME}/tools
export PATH="~/Library/Android/sdk/platform-tools:$PATH"

export PATH="~/gradle-2.11/bin:$PATH"

# Node
source ~/.bashrc
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# Colors
PS1='\w\[\033[0;32m\]$( git branch 2> /dev/null | cut -f2 -d\* -s | sed "s/^ / [/" | sed "s/$/]/" )\[\033[0m\] \$ '

# Tell grep to highlight matches
export GREP_OPTIONS='--color=auto'

# Tell ls to be colourful
export CLICOLOR=1
export LSCOLORS=Exfxcxdxbxegedabagacad


alias delete-merged='git branch --merged | egrep -v "(^\*|master|dev|qa|staging)" | xargs git branch -d'