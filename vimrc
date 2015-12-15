runtime env.vim
runtime plugins.vim

let mapleader      = ","
let maplocalleader = ";"

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

nnoremap <silent> <C-n> :call Next()<Cr>
nnoremap <silent> <C-p> :call Prev()<Cr>
nnoremap <silent> <C-d> :Sayonara<Cr>

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

" Disable the arrow keys when in edit mode
inoremap <Up>    <NOP>
inoremap <Right> <NOP>
inoremap <Down>  <NOP>
inoremap <Left>  <NOP>

" Enable navication in insert mode with control modifiers
inoremap <C-k> <Up>
inoremap <C-j> <Down>
inoremap <C-f> <PageDown>
inoremap <C-b> <PageUp>

" Navigate through quickfix errors
nnoremap <silent> [q :cprev<Return>
nnoremap <silent> ]q :cnext<Return>

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
nnoremap <Leader>U viwgU
nnoremap <Leader>u viwgu

" Grep for the word under the cursor
nnoremap <Leader>f yiw:call FindPat('<C-r>"')<Cr>

" Swap files in one place
set directory=$VIMHOME/swap

" Enable hidden buffers (so that switching between dirty buffers doesn't throw
" an error)
set hidden

" Automatically restore the last position on reload
autocmd BufReadPost * normal `"

function FindPat(pat)
    execute "vimgrep /" . a:pat . "/j **"
    copen
endfunction

command -nargs=0 Todo call FindPat('\(TODO\|XXX\)')
