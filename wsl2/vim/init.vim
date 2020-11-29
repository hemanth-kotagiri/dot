" Plugins
call plug#begin('~/.vim/plugged')

    Plug 'tpope/vim-repeat'
    Plug 'tpope/vim-surround'
    "Themes
    Plug 'morhetz/gruvbox'
    Plug 'ntk148v/vim-horizon'
    " Utils
    Plug 'preservim/nerdcommenter'
    Plug 'neoclide/coc.nvim'


call plug#end()



"General settings
let mapleader=" "
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
set splitright
set encoding=utf-8
set noerrorbells
set nowritebackup
au! BufWritePost $MYVIMRC source %


vnoremap < <gv
vnoremap > >gv
inoremap <expr> <c-j> ("\<C-n>")
inoremap <expr> <c-k> ("\<C-p>")
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l



" Theme settings
let g:gruvbox_contrast_dark='hard'
set termguicolors
set t_Co=256
set background=dark
colorscheme gruvbox

" Pluginsettings "

" Nerd Commenter
nmap <C-_> <Plug>NERDCommenterToggle
vmap <C-_> <Plug>NERDCommenterToggle<CR>gv

"Coc
source ~/.config/nvim/coc.vim
