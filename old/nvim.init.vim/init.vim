"================
"GENERAL SETTINGS
"================
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
"set cursorline
set splitright
set encoding=utf-8
set noerrorbells
set nowritebackup
set showtabline=2
set noshowmode
set nobackup
set clipboard=unnamedplus
au! BufWritePost $MYVIMRC source %
set scrolloff=10
"highlight Normal ctermbg=none
"highlight NonText ctermbg=none
" Spelling mistakes will be colored up red.
hi SpellBad cterm=underline ctermfg=203 guifg=#ff5f5f
hi SpellLocal cterm=underline ctermfg=203 guifg=#ff5f5f
hi SpellRare cterm=underline ctermfg=203 guifg=#ff5f5f
hi SpellCap cterm=underline ctermfg=203 guifg=#ff5f5f

"======
"REMAPS
"======

vnoremap < <gv
vnoremap > >gv
inoremap <expr> <c-j> ("\<C-n>")
inoremap <expr> <c-k> ("\<C-p>")
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <Tab> :bnext
nnoremap Y y$
nnoremap <S-Tab> :bprev
nnoremap // :noh
vnoremap J :m '>+1<CR>gv=gv 
vnoremap K :m '<-2<CR>gv=gv 
inoremap jk <ESC>
noremap j gj
noremap k gk
vmap y ygv<Esc>
nnoremap <leader>sp :normal! mz[s1z=`z<CR>
map <F5> :setlocal spell!<CR>

"=======
"PLUGINS
"=======

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
   Plug 'easymotion/vim-easymotion'
   "Plug 'luochen1990/rainbow'
   Plug 'p00f/nvim-ts-rainbow'
   Plug 'terryma/vim-multiple-cursors'
   Plug 'mattn/emmet-vim'
   Plug 'PotatoesMaster/i3-vim-syntax'
   Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
   Plug 'wakatime/vim-wakatime'
   Plug 'dart-lang/dart-vim-plugin'
   Plug 'thosakwe/vim-flutter'
   Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
   Plug 'junegunn/vim-easy-align'
   Plug 'tpope/vim-fugitive'
   "Themes
   Plug 'tiagovla/tokyodark.nvim'
   Plug 'hzchirs/vim-material'
   Plug 'dylanaraps/wal.vim'
   Plug 'folke/tokyonight.nvim'
   Plug 'morhetz/gruvbox'
   Plug 'ntk148v/vim-horizon'
   Plug 'NLKNguyen/papercolor-theme'
   Plug 'christianchiarulli/nvcode-color-schemes.vim'
   Plug 'chriskempson/base16-vim'
   Plug 'bluz71/vim-nightfly-guicolors'
   Plug 'flazz/vim-colorschemes'
   "Airline
   Plug 'vim-airline/vim-airline'
   Plug 'vim-airline/vim-airline-themes'


call plug#end()

" Theme settings
let g:gruvbox_contrast_dark        = 'hard'
"set termguicolors
set t_Co                           =256
set background                     =dark
let base16colorspace               = 256
au ColorScheme * hi Normal ctermbg = none guibg=none
highlight SignColumn guibg         = none
let g:tokyonight_style             = "night"
let g:material_style='oceanic'
let g:tokyonight_italic_functions  = 1
let g:tokyonight_sidebars          = [ "qf", "vista_kind", "terminal", "packer" ]
"colorscheme torte
"colorscheme nvcode
"colorscheme tokyonight
"colorscheme nightfly
"colorscheme PaperColor
colorscheme gruvbox
"colorscheme graywh
"colorscheme wal
"colorscheme vim-material

"================
"PLUGIN SETTINGS"
"================

"         Airline
let g:airline_powerline_fonts                  = 1
let g:airline_left_sep                         = ''
let g:airline_right_sep                        = ''
let g:airline#extensions#tabline#enabled       = 1
let g:airline#extensions#tabline#left_sep      = ''
let g:airline#extensions#tabline#left_alt_sep  = ''
let g:airline#extensions#tabline#right_sep     = ''
let g:airline#extensions#tabline#right_alt_sep = ''
let g:airline_theme                            = 'onedark'

"        Nerd Commenter
nmap <C-_> <Plug>NERDCommenterToggle
vmap <C-_> <Plug>NERDCommenterToggle<CR>gv

"             COC
source ~/.config/nvim/coc.vim

"             FzF
source ~/.config/nvim/fzf.vim

"            Rainbow
source ~/.config/nvim/rainbow.vim

"        Markdown-Preview
source ~/.config/nvim/markdown_preview.vim

"            Flutter
source ~/.config/nvim/flutter-conf.vim

"            Emmet
let g:user_emmet_leader_key=','

"          Tree Sitter
source ~/.config/nvim/treesitter-conf.vim

"          TS-Rainbow
source ~/.config/nvim/ts-rainbow-conf.vim

"          Git-Fugitive
source ~/.config/nvim/fugitive.vim

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)
