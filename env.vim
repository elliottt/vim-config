" OS Detection
if has('win32') || has('win64')
let $OS = 'windows'
let $VIMHOME = $HOME. '/vimfiles'
else
let $OS = 'linux'
let $VIMHOME = $HOME . '/.vim'
endif
