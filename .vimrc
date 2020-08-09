" Vundle
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'preservim/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'tiagofumo/vim-nerdtree-syntax-highlight'
Plugin 'sheerun/vim-polyglot'
Plugin 'git@github.com:aperezdc/vim-template.git'
Plugin 'git@github.com:leafgarland/typescript-vim.git'
Plugin 'quramy/tsuquyomi'
Plugin 'nvie/vim-flake8'
Plugin 'airblade/vim-gitgutter'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'ryanoasis/vim-devicons'
call vundle#end()
filetype plugin indent on
filetype plugin on
filetype indent on


" vim
set updatetime=100
set encoding=UTF-8

" vim-template
let g:templates_directory = ['~/templates']
let g:templates_name_prefix = ''

" NERDTree
let NERDTreeShowHidden=1
let g:NERDTreeShowGitStatus = 1
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | wincmd p | ene | exe 'NERDTree' argv()[0] | endif
let g:NERDTreeGitStatusUseNerdFonts = 1
let g:NERDTreeShowGitStatus = 1
let g:NERDTreeUpdateOnWrite = 1
let g:NERDTreeDirArrowExpandable = ''
let g:NERDTreeDirArrowCollapsible = ''
let g:NERDTreeFileExtensionHighlightFullName = 1

" vim-airline
" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1
" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'
" vim-airline theme
let g:airline_theme='angr'
let g:airline_powerline_fonts = 1
" vim-polyglot
syntax on
