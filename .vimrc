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
Plug 'github/copilot.vim'
Plug 'lervag/vimtex'
Plug 'preservim/nerdtree'
Plug 'majutsushi/tagbar'
Plug 'vim-airline/vim-airline'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'Konfekt/FastFold'
Plug 'tmhedberg/SimpylFold'
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
nmap s<C-]> :cs find s <C-R>=expand("<cword>")<CR><CR>
map <F5> :!ctags -R src<CR>:!cscope -Rb<CR>:cs reset<CR><CR>

filetype plugin on
autocmd FileType tex let b:copilot_enabled = 0
