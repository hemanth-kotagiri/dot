" Plugins
call plug#begin('~/.vim/plugged')

    Plug 'tpope/vim-repeat'
    Plug 'tpope/vim-surround'
    Plug 'morhetz/gruvbox'

call plug#end()





"General settings
set number
set relativenumber
syntax enable
set ruler
set mouse=a
set smarttab
set tabstop=4
set shiftwidth=4
set smarttab
set expandtab
set smartindent
set autoindent
set laststatus=4
set cursorline





" Theme related settings
let g:gruvbox_contrast_dark='hard'
set termguicolors
set t_Co=256
set background=dark
colorscheme gruvbox

" Plugin related settings 

