

if exists('b:did_indent')
    finish
endif

let b:did_indent = 1

setlocal indentexpr=GetHaskellIndent(v:lnum)
setlocal indentkeys=!^F,o,O


function! GetHaskellIndent(lnum)
    let l:line = getline(a:lnum - 1)

    if l:line =~# '^\s*$'
        return match(l:line, '\S')
    endif


    let l:indent = indent(a:lnum - 1)

    if l:line =~# '^data\>.*=.\+'
        let l:indent = &shiftwidth

    elseif l:line =~# '^data\>[^=]\+\|^class\>\|^instance\>'
        let l:indent = &shiftwidth

    elseif l:line =~# '^newtype\>.*=.\+'
        let l:indent = &shiftwidth

    elseif l:line =~# '^\k\+.*=\s*\%(do\)\?$'
        let l:indent = match(l:line, '\S') + &shiftwidth

    elseif l:line =~# '\[[^\]]*$'
        let l:indent = match(l:line, '\[')

    elseif l:line =~# '{[^}]*$'
        let l:indent = match(l:line, '{')

    elseif l:line =~# 'module.*($'
        let l:indent = match(l:line, '\S') + &shiftwidth

    elseif l:line =~# '([^)]*$'
        let l:indent = match(l:line, '(')

    elseif l:line =~# '\<case\>.*\<of\>'
        let l:indent = match(l:line, '\S') + &shiftwidth

    elseif l:line =~# '\<if\>.*\<then\>.*\%(\<else\>\)\@!'
        let l:indent = match(l:line, '\<then\>')

    elseif l:line =~# '\<if\>'
        let l:indent = match(l:line, '\<if\>') + 3

    elseif l:line =~# '\<do$'
        let l:indent = match(l:line, '\S') + &shiftwidth

    elseif l:line =~# '\<\%(do\|let\|where\|in\|then\|else\)$'
        let l:indent = indent(a:lnum - 1)

    elseif l:line =~# '\<do\>'
        let l:indent = match(l:line, '\<do\>') + 3

    elseif l:line =~# '\<let\>.*\s=$'
        let l:indent = match(l:line, '\<let\>') + 4 + &shiftwidth

    elseif l:line =~# '\<let\>'
        let l:indent = match(l:line, '\<let\>') + 4

    elseif l:line =~# '\<where\>'
        let l:indent = match(l:line, '\<where\>') + 6

    elseif l:line =~# '\s=$'
        let l:indent = indent(a:lnum - 1) + &shiftwidth

    endif


    if synIDattr(synIDtrans(synID(a:lnum - 1, l:indent, 1)), 'name')
                \ =~# '\%(Comment\|String\)$'
        return indent(a:lnum - 1)
    endif

    return l:indent
endfunction
