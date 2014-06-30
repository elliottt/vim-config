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
" Bundle 'IndentAnything'
" Bundle 'OOP-javascript-indentation'

" CtrlP
Bundle 'kien/ctrlp.vim'
let g:ctrlp_map = '<Space>'
let g:ctrlp_prompt_mappings = {
    \ 'AcceptSelection("t")': [ '<c-g>' ]
    \ }
let g:ctrlp_open_new_file = 'r'
nnoremap <C-@> :CtrlPBuffer<CR>

" Silver searcher integration
if executable('ag')
    set grepprg=ag\ --nogroup\ --nocolor
    let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
                             \ . ' --ignore "dist"'
                             \ . ' --ignore "\.(o|hi)"'
endif

" Quick Task
Bundle 'aaronbieber/quicktask'
let g:quicktask_snip_path = $VIMHOME . '/snips/'
let g:quicktask_snip_default_filetype = 'markdown'

Bundle 'jcf/vim-latex'
Bundle 'junegunn/seoul256.vim'

" Haskell Indenting
Bundle 'elliottt/haskell-indent'

" Airline
Bundle "bling/vim-airline"
set laststatus=2
if $OS != 'windows'
    if !exists('g:airline_symbols')
        let g:airline_symbols = {}
    endif

    " tabline config
    let g:airline#extensions#tabline#enabled = 1

    " empty git branch value
    let g:airline#extensions#branch#empty_message = ' '

    " no fancy symbols on windows
    let g:airline_powerline_fonts = 1

    " Airline output for tmux
    Bundle 'edkolev/tmuxline.vim'
    let g:tmuxline_preset = 'powerline'
endif

let g:airline_theme = 'bubblegum'

" Coq interaction
Bundle 'def-lkb/vimbufsync'
Bundle 'the-lambda-church/coquille'

" Text alignment
Bundle "tommcdo/vim-lion"

" Tmux integration
Bundle "benmills/vimux"

Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-commentary'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-markdown'

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
nnoremap <silent> <Leader><Leader> :noh<Enter>

" Always show cursor position
set ruler

" Tab/buffer navigation
function! Next()
    if tabpagenr('$') > 1
        tabnext
    else
        bnext
    endif
endfunction

function! Prev()
    if tabpagenr('$') > 1
        tabprevious
    else
        bprevious
    endif
endfunction

nnoremap <C-n> :call Next()<Cr>
nnoremap <C-p> :call Prev()<Cr>

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

" Disable the help key
nnoremap <F1> <Esc>
inoremap <F1> <Esc>

" Print options
set printoptions=paper:letter

" Completion options
set wildmode=longest:full,list:full
set wildmenu
set wildignore=*.o,*.hi,*.swp,*.bc,dist/*

" Colors!
colors seoul256
set bg=dark
highlight Normal cterm=NONE ctermbg=NONE

" Disable the arrow keys when in edit mode
inoremap <Up>    <NOP>
inoremap <Right> <NOP>
inoremap <Down>  <NOP>
inoremap <Left>  <NOP>

" Stop entering ex mode accidentally
nnoremap Q <NOP>

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

" Swap files in one place
set directory=$VIMHOME/swap
