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
Plug 'LumaKernel/fern-mapping-fzf.vim'
" }}}
" language {{{2
" haskell {{{3
Plug 'neovimhaskell/haskell-vim', { 'for': 'haskell' }
" }}}
" nix {{{
Plug 'LnL7/vim-nix', { 'for': 'nix' }
" }}}
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
set grepprg=rg\ --vimgrep\ --smart-case\ --follow
if executable('nvr')
  let $GIT_EDITOR='nvr -cc split --remote-wait'
  autocmd FileType git commit,gitrebase,gitconfig set bufhidden=delete
endif
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

" location {{{
nnoremap <silent> <leader>x :lcd %:p:h<CR>
let g:workspace_root_path = ""
if (g:workspace_root_path == "")
  let g:workspace_root_path = getcwd()
endif
function! s:back_to_workspace_root() abort
  execute 'cd' g:workspace_root_path
endfunction
nnoremap <silent> <leader>z :call <SID>back_to_workspace_root()<CR>
" }}}

" terminal {{{
tnoremap <silent> <ESC> <C-\><C-n>
tnoremap <silent> <C-w>h <C-\><C-n><C-w>h
tnoremap <silent> <C-w>j <C-\><C-n><C-w>j
tnoremap <silent> <C-w>k <C-\><C-n><C-w>k
tnoremap <silent> <C-w>l <C-\><C-n><C-w>l
tnoremap <silent> <C-w>gt <C-\><C-n>gt
tnoremap <silent> <C-w>gT <C-\><C-n>gT
nnoremap <silent><leader>ssh :sp<CR>:terminal<CR>a
nnoremap <silent><leader>vsh :vsp<CR>:terminal<CR>a
nnoremap <silent><leader>tsh :tabe<CR>:terminal<CR>a
augroup terminal_buffer
  au!
  autocmd TermEnter * set nonumber
augroup END
" }}}

" lsp {{{
" let g:lsp_log_file = expand('~/vim-lsp.log')
function! s:on_lsp_buffer_enable() abort
  setlocal omnifunc=lsp#complete
  setlocal signcolumn=yes
  nmap <buffer><silent> gd <plug>(lsp-definition)
  nmap <buffer><silent> <f2> <plug>(lsp-rename)
  nmap <buffer><silent> en <plug>(lsp-next-error)
  nmap <buffer><silent> ep <plug>(lsp-previous-error)
  nmap <buffer><silent> gh <plug>(lsp-hover)
  nmap <buffer><silent> gr <plug>(lsp-references)
  nmap <buffer><silent> gq <plug>(lsp-document-diagnostics)
endfunction
let g:lsp_preview_keep_focus = 1
let g:lsp_diagnostics_float_cursor = 1
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
" nix {{{
if executable('rnix-lsp')
  au user lsp_setup call lsp#register_server({
        \ 'name': 'rnix-lsp',
        \ 'cmd': {server_info->[&shell, &shellcmdflag, 'rnix-lsp']},
        \ 'allowlist': ['nix'],
        \ })
endif
" }}}
" javascript/typescript {{{
if executable('typescript-language-server')
  au User lsp_setup call lsp#register_server({
        \ 'name': 'typescript-language-server',
        \ 'cmd': {server_info->[&shell, &shellcmdflag, 'typescript-language-server --stdio']},
        \ 'root_uri':{server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_file_directory(lsp#utils#get_buffer_path(), ['tsconfig.json', 'package.json']))},
        \ 'allowlist': ['typescript', 'typescript.tsx', 'typescriptreact', 'javascript', 'javascriptreact'],
        \ })
endif
" }}}
" python {{{
if executable('pyls')
  au User lsp_setup call lsp#register_server({
        \ 'name': 'pyls',
        \ 'cmd': {server_info->['pyls']},
        \ 'allowlist': ['python'],
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
let g:fzf_layout = { 'down': '30%' }
function! s:fzf_grep_only_buffer_file() abort
  command! -bang -nargs=* Rg call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case ".shellescape(<q-args>), 1, {'options': '--delimiter : --nth 4..'}, <bang> 0)
endfunction
nnoremap <silent> <leader>o :Files<CR>
nnoremap <silent> <leader>b :Buffers<CR>
nnoremap <silent> <leader>f :Rg<CR>
nnoremap <silent> <leader>/ :BLines<CR>
nnoremap <silent> <leader>' :Marks<CR>
nnoremap <silent> <leader>g :Commits<CR>
nnoremap <silent> <leader>hh :History<CR>
nnoremap <silent> <leader>h: :History:<CR>
nnoremap <silent> <leader>h/ :History/<CR>
" }}}

" fern {{{
nmap <silent><leader>n :Fern . -drawer -toggle<CR>
nmap <silent><leader>m :Fern %:h -drawer -toggle<CR>
let g:fern#default_hidden=1
function! s:init_fern() abort
  nmap <buffer> v <Plug>(fern-action-open:side)
  nmap <buffer> x <Plug>(fern-action-lcd:cursor)
endfunction
augroup my-fern
  autocmd! *
  autocmd FileType fern call s:init_fern()
augroup END
function! Fern_mapping_fzf_customize_option(spec)
    let a:spec.options .= ' --multi'
    " Note that fzf#vim#with_preview comes from fzf.vim
    if exists('*fzf#vim#with_preview')
        return fzf#vim#with_preview(a:spec)
    else
        return a:spec
    endif
endfunction

function! Fern_mapping_fzf_before_all(dict)
    if !len(a:dict.lines)
        return
    endif
    return a:dict.fern_helper.async.update_marks([])
endfunction

function! s:reveal(dict)
    execute "FernReveal -wait" a:dict.relative_path
    execute "normal \<Plug>(fern-action-mark:set)"
endfunction

let g:Fern_mapping_fzf_file_sink = function('s:reveal')
let g:Fern_mapping_fzf_dir_sink = function('s:reveal')
" }}}

