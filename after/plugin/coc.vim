
" Use `[c` and `]c` to navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)


" triggers completion when the character to the left is not space or the start
" of a column.
inoremap <silent><expr> <tab> <SID>check_back_space() ? "<TAB>" : coc#refresh()

" Returns true when the character to the left of the cursor is the start of the
" row, or whitespace.
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" selects a completion
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

command! -nargs=0 Format :call CocAction('format')

" Show all diagonistic messages
nnoremap <silent> <LocalLeader>d :<C-u>CocList diagnostics<cr>
