augroup cpp
    " Format before write
    au BufWritePre *.cc call CocAction('format')
augroup END

" Set a breakpoint
function! SetBreakPoint(...)
    let l:cmd = ""
    for arg in a:000
        let cmd = l:cmd." ".arg
    endfor

    let l:line = line(".")
    let l:file = expand("%")
    if strlen(l:cmd) > 0
        VimuxRunCommand('break set --file '.l:file.' --line '.l:line.' -C "' . l:cmd . '"')
    else
        VimuxRunCommand('b '.l:file.':'.l:line)
    endif
endfunction

command! -nargs=* Break call SetBreakPoint(expand("<args>"))

nnoremap <silent><buffer> <LocalLeader>b :Break<cr>
nnoremap <silent><buffer> <LocalLeader>r :call VimuxRunCommand("run")<cr>
nnoremap <silent><buffer> <LocalLeader>u :call VimuxRunCommand("up")<cr>
nnoremap <silent><buffer> <LocalLeader>U :call VimuxRunCommand("down")<cr>
nnoremap <silent><buffer> <LocalLeader>n :call VimuxRunCommand("next")<cr>
nnoremap <silent><buffer> <LocalLeader>s :call VimuxRunCommand("step")<cr>
nnoremap <silent><buffer> <LocalLeader>l :call VimuxRunCommand("break list")<cr>
