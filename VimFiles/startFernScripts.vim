function! s:init_fern() abort
  " Use 'select' instead of 'edit' for default 'open' action
  "nmap <buffer> <Plug>(fern-action-open) <Plug>(fern-action-open:select)
  set nonu
  nmap <buffer> o <Plug>(fern-action-open:vsplit)
  nmap <buffer> so <Plug>(fern-action-open:select)<C-w>p
endfunction

augroup fern-custom
    autocmd! *
    autocmd FileType fern call s:init_fern()
augroup END
