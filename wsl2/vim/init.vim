" Plugins
call plug#begin('~/.vim/plugged')

    "Utils
    Plug 'tpope/vim-repeat'
    Plug 'tpope/vim-surround'
    Plug 'preservim/nerdcommenter'
    Plug 'neoclide/coc.nvim'
    Plug 'airblade/vim-gitgutter'
    Plug 'sheerun/vim-polyglot'
    Plug 'christoomey/vim-tmux-navigator'
    Plug 'jiangmiao/auto-pairs'
    Plug 'junegunn/fzf', { 'do': { -> fzf#install()  }  }
    Plug 'junegunn/fzf.vim'
    Plug 'airblade/vim-rooter'
    "Themes
    Plug 'morhetz/gruvbox'
    Plug 'ntk148v/vim-horizon'
    Plug 'NLKNguyen/papercolor-theme'
    Plug 'christianchiarulli/nvcode-color-schemes.vim'
    Plug 'chriskempson/base16-vim'
    Plug 'flazz/vim-colorschemes'
    "Airline
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'


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
set laststatus=0
set cursorline
set splitright
set encoding=utf-8
set noerrorbells
set nowritebackup
set showtabline=2
set noshowmode
set nobackup
set clipboard=unnamedplus
au! BufWritePost $MYVIMRC source %


vnoremap < <gv
vnoremap > >gv
inoremap <expr> <c-j> ("\<C-n>")
inoremap <expr> <c-k> ("\<C-p>")
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
vnoremap J :m '>+1<CR>gv=gv 
vnoremap K :m '<-2<CR>gv=gv 



" Theme settings
let g:gruvbox_contrast_dark='hard'
set termguicolors
set t_Co=256
set background=dark
let base16colorspace=256
colorscheme snazzy

" Plugin settings "

" Nerd Commenter
nmap <C-_> <Plug>NERDCommenterToggle
vmap <C-_> <Plug>NERDCommenterToggle<CR>gv

"CoC
source ~/.config/nvim/coc.vim

"Airline
let g:airline_powerline_fonts = 1
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''
let g:airline#extensions#tabline#right_sep = ''
let g:airline#extensions#tabline#right_alt_sep = ''
let g:airline_theme = 'onedark'
