setlocal autoindent
setlocal nocindent
setlocal expandtab

highlight hsComment term=NONE ctermfg=cyan

nnoremap <buffer> K <Nop>
vnoremap <buffer> K <Nop>

" Insert a separating line
nnoremap <buffer> <LocalLeader>l ^80i-<Esc>^llR<Space>

" Insert a Haddock comment
nnoremap <buffer> --\| O--<Space>\|<Space>

" Pragmas
nnoremap <buffer> <localleader>#l O{-# LANGUAGE  #-}<Esc>hhhi
nnoremap <buffer> <localleader>#i O{-# INLINE  #-}<Esc>hhhi
nnoremap <buffer> <localleader>#u i{-# UNPACK #-} <Esc>F{

" Insert an import declaration
nnoremap <buffer> <localleader>i Oimport 

" Reload in ghci in a separate tmux pane
nnoremap <buffer> <silent> <localleader>r :call VimuxRunCommand(':r')<Cr>

setlocal textwidth=80

" Set the tab size
setlocal tabstop=8
setlocal shiftwidth=2

" Spellcheck comments
setlocal spell

" Configure :make
if haskell#CabalProjectFileExists()
    compiler cabal-new-build
elseif haskell#StackYamlFileExists()
    compiler stack-build
elseif haskell#CabalFileExists()
    compiler cabal-build
endif

" Setup include and includeexpr
call haskell#FollowImports()

nmap <buffer> gf <Plug>(haskell-gf)

" augroup haskell
"     autocmd!
"     autocmd BufWritePost *.hs Neomake!
" augroup END

if exists("g:haskell_use_unicode") && g:haskell_use_unicode == 1
    call haskell#UnicodeMacros()
endif
