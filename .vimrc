set nocompatible
set pastetoggle=<F2>
set tabstop=2
set shiftwidth=2
set expandtab
set hlsearch
set incsearch
set number

" vim-plug
call plug#begin()
Plug 'lervag/vimtex'
Plug 'preservim/nerdtree'
Plug 'majutsushi/tagbar'
Plug 'vim-airline/vim-airline'
call plug#end()

" [vimtex]
let g:tex_flavor = 'latex'
let g:vimtex_view_method = 'mupdf'

let g:tagbar_autofocus = 1
let g:tagbar_autoclose = 1

nmap <C-o> :NERDTreeToggle<CR>
nmap <C-l> :TagbarToggle<CR>
