syntax on
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

set autoindent
set number
set ruler

set hlsearch
set incsearch
set ignorecase

set encoding=utf-8

set timeoutlen=100
set ttimeoutlen=5

set backspace=indent,eol,start
set showcmd
set wildmenu
set background=dark

:nnoremap <C-l> <End>
:nnoremap <C-h> _

let g:python_highlight_all=1
set path+=**

highlight Comment ctermfg=green

" Persistent undo
let vimDir = '$HOME/.vim'
let &runtimepath.=','.vimDir

" Keep undo history across sessions by storing it in a file
if has('persistent_undo')
    let myUndoDir = expand(vimDir . '/undodir')
    " Create dirs
    call system('mkdir ' . vimDir)
    call system('mkdir ' . myUndoDir)
    let &undodir = myUndoDir
    set undofile
endif

if exists('$TMUX')
    autocmd BufReadPost,FileReadPost,BufNewFile,BufEnter,FocusGained * call system("tmux rename-window 'vim: ".expand("%")."'")
    autocmd VimLeave,FocusLost * call system("tmux setw automatic-rename")
endif

" set mouse=a
" set ttymouse=xterm
