" Vundle
set nocompatible
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

" vim
set updatetime=100

" vim-template
Plugin 'git@github.com:aperezdc/vim-template.git'
let g:templates_directory = ['~/templates']
let g:templates_name_prefix = ''

" NERDTree
Plugin 'preservim/nerdtree'
let NERDTreeShowHidden=1
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | wincmd p | ene | exe 'NERDTree' argv()[0] | endif

" vim-airline
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1
" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'
" vim-airline theme
let g:airline_theme='angr'

" vim-polyglot
Plugin 'sheerun/vim-polyglot'
syntax on

" dockerfile-vim 
Plugin 'ekalinin/Dockerfile.vim'

" Typescript
Plugin 'git@github.com:leafgarland/typescript-vim.git'
Plugin 'quramy/tsuquyomi'

" Python
Plugin 'nvie/vim-flake8'

" end Vundle
call vundle#end()
filetype plugin indent on
