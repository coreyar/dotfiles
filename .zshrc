source ~/.zplug/init.zsh

# NVM
zplug "lukechilds/zsh-nvm"

zplug load

# direnv
eval "$(direnv hook zsh)"

# Customize shell
autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git svn
precmd() {
    vcs_info
}


function tf_prompt_info() {
    # dont show 'default' workspace in home dir
    [[ "$PWD" == ~ ]] && return
    # check if in terraform dir
    if [ -d .terraform ]; then
      workspace=$(terraform workspace show 2> /dev/null) || return
      echo "{${workspace}}"
    fi
}

# Format the vcs_info_msg_0_ variable
zstyle ':vcs_info:git:*' formats "%{$fg[blue]%}[%b]%{$reset_color%}"
 
# Set up the prompt (with git branch name)
setopt PROMPT_SUBST
PROMPT='%{$fg[cyan]%}${PWD/#$HOME/~}%{$reset_color%} ${vcs_info_msg_0_} %{$fg[magenta]%}$(tf_prompt_info)%{$reset_color%} $ '
