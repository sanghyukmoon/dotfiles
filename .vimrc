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
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
call plug#end()

" [vimtex]
let g:tex_flavor = 'latex'
let g:vimtex_view_method = 'skim'

" [nerdtree]
nmap <C-o> :NERDTreeToggle<CR>

" [tagbar]
let g:tagbar_autofocus = 1
let g:tagbar_autoclose = 1
nmap <C-l> :TagbarToggle<CR>

" [cscope]
cs add cscope.out
nmap c<C-]> :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap r<C-]> :cs find s <C-R>=expand("<cword>")<CR><CR>

filetype plugin on
