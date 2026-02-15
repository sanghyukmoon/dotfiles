" Normally this if-block is not needed, because `:set nocp` is done
" automatically when .vimrc is found. However, this might be useful
" when you execute `vim -u .vimrc` from the command line.
if &compatible
  " `:set nocp` has many side effects. Therefore this should be done
  " only when 'compatible' is set.
  set nocompatible
endif
let mapleader = " "


" Basic configurations
" ----------------------------------------------------------------------------
syntax enable
filetype plugin indent on
set pastetoggle=<F2>
set tabstop=2
set shiftwidth=2
set expandtab
set hlsearch
set incsearch
set number


" Keymaps
" ----------------------------------------------------------------------------
" Leading | character separates the command from the comment.
" Type :help map-comments for more details.
nnoremap <leader>o :Explore<CR>  |" Open netrw file explorer
nnoremap <leader><leader> <C-^>  |" Go to the previous buffer


" Options
" ----------------------------------------------------------------------------
" Hide hidden files in netrw
let g:netrw_list_hide = '\(^\|\s\s\)\zs\.\S\+'
" let g:netrw_banner = 0  " Disable the banner at the top of netrw
" Disable document highlight, which is enabled by default in vim-lsp
let g:lsp_document_highlight_enabled = 0

" LSP
" ----------------------------------------------------------------------------
" prabirshrestha/vim-lsp settings

if executable('clangd')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'clangd',
        \ 'cmd': {server_info->['clangd']},
        \ 'allowlist': ['c', 'cpp', 'objc', 'objcpp'],
        \ })
endif

if executable('pyright')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'pyright',
        \ 'cmd': {server_info->['pyright-langserver', '--stdio']},
        \ 'allowlist': ['python'],
        \ })
endif

function! s:on_lsp_buffer_enabled() abort
    setlocal omnifunc=lsp#complete
    setlocal signcolumn=yes
    if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
    nmap <buffer> gd <plug>(lsp-definition)
    nmap <buffer> gs <plug>(lsp-document-symbol-search)
    nmap <buffer> gS <plug>(lsp-workspace-symbol-search)
    nmap <buffer> gr <plug>(lsp-references)
    nmap <buffer> gt <plug>(lsp-type-definition)
    nmap <buffer> <leader>rn <plug>(lsp-rename)
    nmap <buffer> [g <plug>(lsp-previous-diagnostic)
    nmap <buffer> ]g <plug>(lsp-next-diagnostic)
    nmap <buffer> K <plug>(lsp-hover)

    let g:lsp_format_sync_timeout = 1000
    autocmd! BufWritePre *.rs,*.go call execute('LspDocumentFormatSync')

    " refer to doc to add more commands
endfunction

augroup lsp_install
    au!
    " call s:on_lsp_buffer_enabled only for languages that has the server
    " registered.
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END
