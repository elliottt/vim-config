setlocal autoindent
setlocal nocindent
setlocal expandtab

setlocal include="^\s*import\s\+\(qualified\s\+\)\?\zs[^ \t]\+\ze"
setlocal includeexpr=substitute(v:fname,'\\.','/','g').'.hs'

highlight hsComment term=NONE ctermfg=cyan

nnoremap <buffer> K <Nop>

" Insert a separating line
nnoremap <buffer> <LocalLeader>l ^80i-<Esc>^llR<Space>

" Insert a Haddock comment
nnoremap <buffer> --\| O--<Space>\|<Space>

" Pragmas
nnoremap <buffer> <localleader>#l O{-# LANGUAGE  #-}<Esc>hhhi
nnoremap <buffer> <localleader>#i O{-# INLINE #-}<Esc>hhhi

" Insert an import declaration
nnoremap <buffer> <localleader>i Oimport 

" Set the tab size
setlocal tabstop=8
setlocal shiftwidth=2

" Open the current module in ghci
nnoremap <buffer> <LocalLeader>g :call VimuxRunCommand("ghci " . bufname("%"))<Cr>

" Reload the current module
nnoremap <buffer> <LocalLeader>r :call VimuxSendText(":r\n")<Cr>

" Type-checking commands
nnoremap <buffer> <LocalLeader>ty vaw"vy :call VimuxSendText(":t " . @v . "\n")<Cr>
vnoremap <buffer> <LocalLeader>ty    "vy :call VimuxSendText(":t " . @v . "\n")<Cr>
