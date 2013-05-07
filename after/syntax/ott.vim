
" Insert a new line below the cursor that starts with the comment character, %,
" has a single space, then the - character until the end of the line.  Add a
" fold marker in at the end of the line, and place the cursor at colum 3, in
" replace mode to overwrite the dash characters.
nnoremap <localleader>l o% <Esc>74a-<Esc>A{{{1<Esc>^llR
