" .vimrc

nnoremap c "_c
set nocompatible
filetype plugin on
syntax on
set encoding=utf-8
set number relativenumber

call plug#begin()

Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'justinmk/vim-syntax-extra'
Plug 'bfrg/vim-cpp-modern'
Plug 'preservim/nerdtree'

call plug#end()

let g:airline_powerline_fonts = 1 " Install Hack patched powerline font

nnoremap <C-n> :NERDTreeToggle<CR>

color gruvbox

set bg=dark

highlight Normal ctermbg=None
