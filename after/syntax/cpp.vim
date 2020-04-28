" Set a breakpoint
function! SetBreakPoint(...)
    let cmd = join(a:000, ' ')
    let line = line(".")
    let file = expand("%")
    if strlen(l:cmd) > 0
        VimuxRunCommand('break set --file '.l:file.' --line '.l:line.' -C "' . l:cmd . '"')
    else
        VimuxRunCommand('b '.l:file.':'.l:line)
    endif
endfunction

command! -nargs=* Break call SetBreakPoint(expand("<args>"))

setlocal signcolumn=yes

" Wrap the line at 120 characters
set textwidth=120

nnoremap <silent><buffer> <LocalLeader>b :Break<cr>
nnoremap <silent><buffer> <LocalLeader>r :call VimuxRunCommand("run")<cr>
nnoremap <silent><buffer> <LocalLeader>u :call VimuxRunCommand("up")<cr>
nnoremap <silent><buffer> <LocalLeader>U :call VimuxRunCommand("down")<cr>
nnoremap <silent><buffer> <LocalLeader>n :call VimuxRunCommand("next")<cr>
nnoremap <silent><buffer> <LocalLeader>s :call VimuxRunCommand("step")<cr>
nnoremap <silent><buffer> <LocalLeader>l :call VimuxRunCommand("break list")<cr>
