
function! s:goyo_enter()
  Limelight

  let b:quitting = 0
  let b:quitting_bang = 0
  autocmd QuitPre <buffer> let b:quitting = 1
  cabbrev <buffer> q! let b:quitting_bang = 1 <bar> q!
endfunction

function! s:bufhidden(num)
    for buf in getbufinfo({'buflisted': 1})
        if a:num == buf.bufnr
            return !buf.hidden
        endif
    endfor

    return 0
endfunction

function! s:goyo_leave()
  echom "thingers"

  Limelight!

  " Quit Vim if this is the only remaining buffer
  if b:quitting && len(filter(range(1, bufnr('$')), 's:bufhidden(v:val)')) == 1
    if b:quitting_bang
      qa!
    else
      qa
    endif
  endif
endfunction

autocmd! User GoyoEnter call <SID>goyo_enter()
autocmd! User GoyoLeave call <SID>goyo_leave()
