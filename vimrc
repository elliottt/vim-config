set nocompatible

" Colors!
colors default
set bg=dark

set ignorecase smartcase

" Allow backspacing over everything
set backspace=indent,eol,start

" Incremental searching
set incsearch

" Always show cursor position
set ruler

" Fold by manually defined folds
if version >= 600
    set foldenable
    set foldmethod=marker
endif

" Syntax
if &t_Co > 2 || has("gui_running")
    syntax enable
    set hlsearch
endif

" Spell checking
if has("spell")
    setlocal spell spelllang=en_us
    set nospell
endif

" Enable filetype detection
filetype on

" Highlight undefined, trace and error
let hs_highlight_debug = "true"

" Highlight lines longer than 80 chars
let w:m80=matchadd('ErrorMsg', '\%>80v.\+', -1)
set textwidth=80

" Highlight trailing space, and tab characters
set list lcs=tab:>-,trail:.

