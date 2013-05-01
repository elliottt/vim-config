" Ott language file for vim
" Author: Peter-Michael Osera
" posera[at]cis[dot]upenn[dot]edu

" Instructions:
" 1) Copy this file to ~/.vim/syntax (or equiv)
" 2) Add the following to your .vimrc file to automatically load this syntax
"    file when editing an ott file.
"
"     augroup filetype
"     au! BufRead,BufNewFile *.ott setfiletype ott
"     augroup end

" Version 1 (4/6/09): basic syntax highlighting support (extended from ottmode.el)

if version < 600
    syntax clear
elseif exists("b:current_syntax") && b:current_syntax == "ott"
    finish
endif

syn case match

syn match   ottPuncuation           "::=\|::\|<::\|---\+\|\.\.\| | \|</\|/>\|//"
syn match   ottComment              "%.*$"
syn region  ottMorphism             start="{{" end="}}" contains=ottVarInMorphism, ottKeywordInMorphism
syn region  ottVarInMorphism        contained start="\[\[" end="\]\]"
syn match   ottKeywordInMorphism    contained "\<tex\>\|\<isa\>\|\<coq\>\|\<hol\>\|\<ocaml\>\|\<com\>\|\<coq-equality\>\|\<repr-locally-nameless\>\|\<phantom\>\|\<lex\>\|\<texvar\>\|\<isavar\>\|\<holvar\>\|\<ocamlvar\>\|\<coq-equality\>\|\<ich\>\|\<ic\>\|\<ch\>\|\<ih\>\|\<isasyn\>\|\<isaprec\>\|\<isaprec\>"

syn keyword ottKeyword              embed homs metavar indexvar grammar subrules
syn keyword ottKeyword              contextrules substitutions single multiple
syn keyword ottKeyword              freevars defns defn funs right left parsing
syn keyword ottKeyword              names distinctnames union by IN
" These keywords are more common; seems like it's more prudent to not highlight them
" syn keyword ottKeyword              fun bind in non

" Define the default highlighting.
" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet
if version >= 508 || !exists("did_hs_syntax_inits")
    if version < 508
        let did_hs_syntax_inits = 1
        command -nargs=+ HiLink hi link <args>
    else
        command -nargs=+ HiLink hi def link <args>
    endif
endif

HiLink ottPuncuation            Structure
HiLink ottComment               Comment
HiLink ottMorphism              Macro
HiLink ottVarInMorphism         Identifier
HiLink ottKeywordInMorphism     Keyword

HiLink ottRule                  Normal

HiLink ottKeyword               Keyword

let b:current_syntax = "ott"
