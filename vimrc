set nocompatible              " required
filetype off                  " required
" 256 colors
set t_Co=256
"Paste without formatting
set pastetoggle=<F2>
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
"
" " alternatively, pass a path where Vundle should install plugins
" "call vundle#begin('~/some/path/here')
"
" " let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
"
" " Add all your plugins here (note older versions of Vundle used Bundle
" instead of Plugin)
Plugin 'vim-syntastic/syntastic'

"Plugin 'ltercation/vim-colors-solarized'

Plugin 'jnurmine/Zenburn'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'nvie/vim-flake8'
Plugin 'scrooloose/nerdtree'
Plugin 'kien/ctrlp.vim'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'ivanov/vim-ipython'
Plugin 'tpope/vim-surround'
Plugin 'vim-scripts/mayansmoke'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

"
"
" " All of your Plugins must be added before the following line
 call vundle#end()            " required
" filetype plugin indent on    " required

au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79|
    \ set expandtab|
    \ set autoindent|
    \ set fileformat=unix|


"colors Zenburn
set background=light
colorscheme zenburn 
let python_highlight_all=1
syntax on
set nu
"Windows split hotkeys
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
"enable folding
set foldmethod=indent
set foldlevel=99
nnoremap <space> za
" UTF8 support
set encoding=utf-8
"python with virtualenv support
py << EOF

import os
import sys
if 'VIRTUAL_ENV' in os.environ:
  project_base_dir = os.environ['VIRTUAL_ENV']
  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
  execfile(activate_this, dict(__file__=activate_this))
EOF

if has("autocmd")
    " Enable file type detection.
    " Use the default filetype settings, so that mail gets 'tw' set to 72,
    " 'cindent' is on in C files, etc.
    " Also load indent files, to automatically do language-dependent indenting.
    filetype plugin indent on
    
    " When editing a file, always jump to the last known cursor position.
    " Don't do it when the position is invalid or when inside an event handler
    " (happens when dropping a file on gvim).
    autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

else
    " if old vim, set vanilla autoindenting on
    set autoindent

endif " has("autocmd")

"Open a tree if no file is specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
"hotkey Nerdtree
map <C-n> :NERDTreeToggle<CR>
"Clipboard
set clipboard=unnamed
set guioptions-=r
set guioptions-=L
" make tab completion for files/buffers act like bash
set wildmenu
" show matching brackets, etc, for 1/10th of a second
set showmatch
set matchtime=1
" display cursor co-ords at all times
set ruler
set cursorline
" allow cursor to be positioned one char past end of line
" and apply operations to all of selection including last char
set selection=exclusive
"fix the airline
set laststatus=2
