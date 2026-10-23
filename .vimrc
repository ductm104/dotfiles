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

let s:stateHome = empty($XDG_STATE_HOME)
      \ ? expand('~/.local/state') : $XDG_STATE_HOME
let s:stateDir = s:stateHome . '/vim'
call mkdir(s:stateDir, 'p', 0700)
let &viminfofile = s:stateDir . '/viminfo'
let g:netrw_home = s:stateDir . '/netrw'
call mkdir(g:netrw_home, 'p', 0700)

if has('persistent_undo')
    let &undodir = s:stateDir . '/undo'
    call mkdir(&undodir, 'p', 0700)
    set undofile
endif

if exists('$TMUX')
    autocmd BufReadPost,FileReadPost,BufNewFile,BufEnter,FocusGained * call system("tmux rename-window 'vim: ".expand("%")."'")
    autocmd VimLeave,FocusLost * call system("tmux setw automatic-rename")
endif

" set mouse=a
" set ttymouse=xterm
