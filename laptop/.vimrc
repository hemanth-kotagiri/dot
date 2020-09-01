syntax on
set number
set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4 
set expandtab
set smartindent
set smartcase
set noswapfile
set incsearch
set autoindent

set colorcolumn=80 
highlight ColorColumn ctermbg=0 guibg=lightgrey

set relativenumber

call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdcommenter'
Plug 'morhetz/gruvbox'
Plug 'chriskempson/base16-vim'

call plug#end()


colorscheme gruvbox
set background=dark

nmap <C-_> <Plug>NERDCommenterToggle
vmap <C-_> <Plug>NERDCommenterToggle<CR>gv




