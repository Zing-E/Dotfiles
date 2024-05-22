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
Plug 'preservim/nerdtree'

call plug#end()

let g:airline_powerline_fonts = 1 " Install Hack patched powerline font

nnoremap <C-n> :NERDTreeToggle<CR>

color gruvbox

set bg=dark

set guioptions=Ace 

" For MacOS
"set guifont=HackNFM-Regular:h17
set guifont=Hack\ Nerd\ Font\ 14

autocmd BufEnter * lcd %:p:h
