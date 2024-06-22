" .vimrc

nnoremap c "_c
set nocompatible
filetype plugin on
syntax on
set encoding=utf-8
set number relativenumber
set tabstop=4
set shiftwidth=4

call plug#begin()

Plug 'morhetz/gruvbox'
Plug 'preservim/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'justinmk/vim-syntax-extra'

call plug#end()

let g:airline_powerline_fonts = 1 

nnoremap <C-n> :NERDTreeToggle<CR>

color gruvbox

set bg=dark

set guioptions=Ace 

" For MacOS
"set guifont=HackNFM-Regular:h17
set guifont=Hack\ Nerd\ Font\ 14

" To sync NERDTree when changing buffers

autocmd BufEnter * lcd %:p:h
