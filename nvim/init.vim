lua require("style")
lua require("basic")
lua require("move")
lua require("terminal")
lua require("plugins")

" cleanup {{{
augroup AutoRemoveEdgeBlanks
  autocmd!
  autocmd BufWritePre * :%s/\s\+$//ge
augroup END
nnoremap <silent> <C-l> :e! %<CR>
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

command! CopyRelativePath call setreg(v:register, expand("%:~:."))
" }}}

" lsp {{{
" lua require("lsp_setting")
let g:lsp_log_file = ''
function! s:enable_lsp_log() abort
  let g:lsp_log_file = expand('~/vim-lsp.log')
endfunction
function! s:disable_lsp_log() abort
  let g:lsp_log_file = ''
endfunction
command! EnableLspLog call <SID>enable_lsp_log()
command! DisableLspLog call <SID>disable_lsp_log()
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
  nmap <buffer><silent> gf <plug>(lsp-document-format)
endfunction
let g:lsp_preview_keep_focus = 1
let g:lsp_diagnostics_float_cursor = 1
augroup lsp_install
  au!
  autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enable()
  autocmd BufWritePre <buffer> LspDocumentFormatSync
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
" elm {{{
if executable('elm-language-server')
  au user lsp_setup call lsp#register_server({
        \ 'name': 'elm-language-server',
        \ 'cmd': {server_info->['elm-language-server']},
        \ 'root_uri': {server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_file_directory(lsp#utils#get_buffer_path(), ['elm.json']))},
        \ 'allowlist': ['elm'],
        \ })
endif
" }}}
" html {{{
if executable('html-languageserver')
  au User lsp_setup call lsp#register_server({
    	\ 'name': 'html-languageserver',
    	\ 'cmd': {server_info->[&shell, &shellcmdflag, 'html-languageserver --stdio']},
    	\ 'whitelist': ['html'],
  		\ })
endif
" }}}
" java {{{
if executable('java-language-server')
  au User lsp_setup call lsp#register_server({
        \ 'name': 'java-language-server',
        \ 'cmd': {server_info->['java-language-server']},
        \ 'whitelist': ['java'],
        \ })
endif
" }}}
" scala {{{
if executable('metals')
  au User lsp_setup call lsp#register_server({
        \ 'name': 'metals',
        \ 'cmd': {server_info->['metals']},
        \ 'whitelist': ['scala', 'sbt'],
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
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6 } }
function! s:fzf_grep_only_buffer_file() abort
  command! -bang -nargs=* Rg call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case ".shellescape(<q-args>), 1, {'options': '--delimiter : --nth 4..'}, <bang> 0)
endfunction
nnoremap <silent> <leader>o :Files<CR>
nnoremap <silent> <leader>b :Buffers<CR>
nnoremap <silent> <leader>f :Rg<CR>
nnoremap <silent> <leader>/ :BLines<CR>
nnoremap <silent> <leader>' :Marks<CR>
nnoremap <silent> <leader>g :Commits<CR>
nnoremap <silent> <c-p> :Commands<CR>
nnoremap <silent> <leader>hh :History<CR>
nnoremap <silent> <leader>h: :History:<CR>
nnoremap <silent> <leader>h/ :History/<CR>
" }}}
