# Dot Files

The repository contains dotfiles and related files for my personalized setup.


#### [.vim/manifest.txt](./.vim/manifest.txt)
Currently I am installing vim plugins directly. For the moment, This serves as a record of the plugins I am currently using.

#### [.vimrc](./.vimrc)
Currently contains vim-template configs

#### [pyprompt.py](./pyprompt.py)
Python interpreter customizations. This is set in `.zprofile` 
```
# Customize prompt
export PYTHONSTARTUP="$HOME/pyprompt.py"
```

#### [.zshrc](./.zshrc)
Setups up zsh and contains some termainal customizations such as displaying git branch and terraform workspace

#### [.zprofile](./.zprofile)
Most sets up paths for the technologies I use frequently. Also contains some aliased commands
`bootprj <proj>` - Searches the directory set as `WORK_CODE_PATH` for backand and mobile projects, then launches tmux sessions for the project

#### [.tmux.conf](./.tmux.conf)
Customizes tmux