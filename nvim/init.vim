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
