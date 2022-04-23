" initialize {{{
if &compatible
  set nocompatible
endif
" }}}

" plugins {{{1
" if vim-plug is not yet, run: sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
call plug#begin()
" async {{{2
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/asyncomplete.vim'
" }}}
" lsp {{{2
Plug 'prabirshrestha/vim-lsp'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
" }}}
" visual {{{2
Plug 'nanotech/jellybeans.vim'
Plug 'vim-airline/vim-airline'
" }}}
" browse {{{2
Plug 'tyru/open-browser.vim'
" }}}
" vcs {{{
Plug 'tpope/vim-fugitive'
" }}}
" explorer {{{
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'lambdalisue/fern.vim'
Plug 'lambdalisue/fern-hijack.vim'
" }}}
" language {{{2
Plug 'neovimhaskell/haskell-vim', { 'for': 'haskell' }
" }}}
call plug#end()
" }}}

" style {{{
syntax enable
colorscheme jellybeans
filetype plugin indent on
" }}}

" basic {{{1
set hidden
set undofile
set encoding=UTF-8
set number
set ruler
set title
set showtabline=2
set scrolloff=5
set tabstop=2
set expandtab
set shiftwidth=2
set smartindent
set smarttab
set cmdheight=2
set showmatch
set whichwrap=b,s,h,l,<,>,[,]
set nowrap
set nobackup
set nowritebackup
set noswapfile
set history=1000
set incsearch
set ignorecase
set smartcase
set foldmethod=marker
set mouse=
set clipboard=unnamed
set splitbelow
set splitright
set updatetime=300
set shortmess+=c
set signcolumn=yes
set backspace=indent,eol,start
let mapleader = ','
nmap <ESC><ESC> :<C-u>nohlsearch<CR>
autocmd BufEnter * silent! lcd %:p:h
" }}}

" move {{{
nnoremap j gj
nnoremap k gk
vnoremap v $h
nnoremap <C-j> <C-w><C-j>
nnoremap <C-k> <C-w><C-k>
nnoremap <C-h> <C-w><C-h>
nnoremap <C-l> <C-w><C-l>
" }}}

" cleanup {{{
augroup AutoRemoveEdgeBlanks
  autocmd!
  autocmd BufWritePre * :%s/\s\+$//ge
augroup END
" }}}

" openbrowser {{{
let g:netrw_nogx = 1
nmap gx <Plug>(openbrowser-smart-search)
tmap gx <Plug>(openbrowser-smart-search)
vmap gx <Plug>(openbrowser-smart-search)
nmap gxs <Plug>(openbrowser-search)
" }}}

" terminal {{{
tnoremap <silent> <ESC> <C-\><C-n>
tnoremap <silent> <C-w>h <C-\><C-n><C-w>h
tnoremap <silent> <C-w>j <C-\><C-n><C-w>j
tnoremap <silent> <C-w>k <C-\><C-n><C-w>k
tnoremap <silent> <C-w>l <C-\><C-n><C-w>l
tnoremap <silent> <C-w>gt <C-\><C-n>gt
tnoremap <silent> <C-w>gT <C-\><C-n>gT
nnoremap <silent><leader>ssh :sp<CR>:terminal<CR>:set nonumber<CR>a
nnoremap <silent><leader>vsh :vsp<CR>:terminal<CR>:set nonumber<CR>a
nnoremap <silent><leader>tsh :tabe<CR>:terminal<CR>:set nonumber<CR>a
" }}}

" airline {{{
let g:airine_left_sep='>'
let g:airine_left_sep='<'
" }}}

" lsp {{{
let g:lsp_log_file = expand('~/vim-lsp.log')
function! s:on_lsp_buffer_enable() abort
  setlocal omnifunc=lsp#complete
  setlocal signcolumn=yes
  nmap <buffer><silent> gd <plug>(lsp-definition)
  nmap <buffer><silent> <f2> <plug>(lsp-rename)
  nmap <buffer><silent> en <plug>(lsp-next-error)
  nmap <buffer><silent> ep <plug>(lsp-previous-error)
  nmap <buffer><silent> gh <plug>(lsp-hover)
  nmap <buffer><silent> gr <plug>(lsp-references)
endfunction
let g:lsp_preview_keep_focus = 1
augroup lsp_install
  au!
  autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enable()
augroup END
" haskell {{{2
if executable('haskell-language-server')
  au User lsp_setup call lsp#register_server({
        \ 'name': 'haskell-language-server',
        \ 'cmd': {server_info->['haskell-language-server-wrapper', '--lsp']},
        \ 'allowlist': ['haskell'],
        \ })
endif
" }}}
" rust {{{2
if executable('rust-analyzer')
  au user lsp_setup call lsp#register_server({
        \ 'name': 'rust-language-server',
        \ 'cmd': { server_info->['rust-analyzer']},
        \ 'allowlist': ['rust'],
        \ 'initialization_options': {
        \    'cargo': { 'loadOutDirsFromCheck': v:true },
        \    'procMacro': { 'enable': v:true },
        \ }
        \ })
endif
" }}}
" }}}

" snippets {{{
augroup SnipPython
  autocmd!
  autocmd FileType python noremap <leader>pdb o<CR>import pdb;pdb.set_trace()<CR><ESC>
augroup END
" }}}

" fzf {{{
" }}}

" fern {{{
nmap <leader>n :Fern . -drawer<CR>
let g:fern#default_hidden=1
" }}}
