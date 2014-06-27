setlocal autoindent
setlocal nocindent
setlocal expandtab

setlocal include="^\s*import\s\+\(qualified\s\+\)\?\zs[^ \t]\+\ze"
setlocal includeexpr=substitute(v:fname,'\\.','/','g').'.hs'

highlight hsComment term=NONE ctermfg=cyan

nnoremap <buffer> K <Nop>
vnoremap <buffer> K <Nop>

" Insert a separating line
nnoremap <buffer> <LocalLeader>l ^80i-<Esc>^llR<Space>

" Insert a Haddock comment
nnoremap <buffer> --\| O--<Space>\|<Space>

" Pragmas
nnoremap <buffer> <localleader>#l O{-# LANGUAGE  #-}<Esc>hhhi
nnoremap <buffer> <localleader>#i O{-# INLINE #-}<Esc>hhhi

" Insert an import declaration
nnoremap <buffer> <localleader>i Oimport 

" Run cabal build in a separate tmux pane
nnoremap <buffer> <silent> <localleader>b :call VimuxRunCommand('cabal build')<Cr>

" Set the tab size
setlocal tabstop=8
setlocal shiftwidth=2
