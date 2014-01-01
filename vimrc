set nocompatible

let mapleader      = ","
let maplocalleader = ";"

" OS Detection
if has('win32') || has('win64')
let $OS = 'windows'
let $VIMHOME = $HOME. '/vimfiles'
else
let $OS = 'linux'
let $VIMHOME = $HOME . '/.vim'
endif

" Setup bundles
filetype off

set rtp+=$VIMHOME/bundle/vundle/
call vundle#rc($VIMHOME . '/bundle')

" Vundle
Bundle 'gmarik/vundle'

" External packages
Bundle 'tpope/vim-markdown'
Bundle 'IndentAnything'
Bundle 'OOP-javascript-indentation'

" Quick Task
Bundle 'aaronbieber/quicktask'
let g:quicktask_snip_path = $VIMHOME . '/snips/'
let g:quicktask_snip_default_filetype = 'markdown'

Bundle 'tpope/vim-fugitive'
Bundle 'jcf/vim-latex'
Bundle 'junegunn/seoul256.vim'

" Haskell Indenting
Bundle 'elliottt/haskell-indent'

" NERDTree config
Bundle 'scrooloose/nerdtree'
if $OS != 'windows'
    let NERDTreeQuitOnOpen = 1
endif

" Airline
Bundle "bling/vim-airline"
set laststatus=2
if $OS != 'windows'
    if !exists('g:airline_symbols')
        let g:airline_symbols = {}
    endif

    " tabline config
    let g:airline#extensions#tabline#enabled       = 1
    let g:airline#extensions#tabline#show_buffers  = 0
    let g:airline#extensions#tabline#tab_min_count = 2

    " empty git branch value
    let g:airline#extensions#branch#empty_message = ' '

    " no fancy symbols on windows
    let g:airline_powerline_fonts = 1

    " Airline output for tmux
    Bundle 'edkolev/tmuxline.vim'
endif

let g:airline_theme = 'bubblegum'

" Coq interaction
Bundle 'def-lkb/vimbufsync'
Bundle 'trefis/coquille'

" Text alignment
Bundle "tommcdo/vim-lion"

" Enable filetype detection
filetype plugin indent on

set ignorecase smartcase

" Allow backspacing over everything
set backspace=indent,eol,start

" Incremental searching
set incsearch

" Extended matching with %
runtime macros/matchit.vim

" Set the terminal title
set title

" Cursor context
set scrolloff=3

" Allow \ \ to kill the search highlighting.
nnoremap <Leader><Leader> :noh<Enter>

" Always show cursor position
set ruler

" Fold by manually defined folds
set foldenable
set foldmethod=marker

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

" Highlight lines longer than 80 chars
let w:m80=matchadd('ErrorMsg', '\%>80v.\+', -1)

" Wrap the line at 80 characters
set textwidth=80

" Highlight trailing space, and tab characters, toggle with <leader>-s
set list lcs=tab:>-,trail:.
nnoremap <leader>s :set nolist!<CR>


" Tab navigation
nnoremap <C-n> gt
nnoremap <C-p> gT

" Disable the help key
nnoremap <F1> <Esc>
inoremap <F1> <Esc>

" Print options
set printoptions=paper:letter

" Completion options
set wildmode=longest:full,list:full
set wildmenu
set wildignore=*.o,*.hi,*.swp,*.bc

" Colors!
colors seoul256
set bg=dark
highlight Normal cterm=NONE ctermbg=NONE

" Disable the arrow keys when in edit mode
inoremap <Up>    <NOP>
inoremap <Right> <NOP>
inoremap <Down>  <NOP>
inoremap <Left>  <NOP>

inoremap jk <Esc>

" Set F2 as the binding to toggle the paste mode
set pastetoggle=<F2>

" Use F3 to toggle spelling
nnoremap <F3> :set spell!<CR>

" Disable the bell
set noeb t_vb=

" Map <Leader>s to sort the visual selection
vnoremap <Leader>s :sort<Cr>

" Case altering
nnoremap <Leader>U vawgU
nnoremap <Leader>u vawgu
