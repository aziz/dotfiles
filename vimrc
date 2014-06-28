set nocompatible              " required
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim " set the runtime path to include Vundle and initialize
call vundle#begin()

Plugin 'gmarik/Vundle.vim'   " let Vundle manage Vundle, required
" utils
Plugin 'bling/vim-airline'
Plugin 'ervandew/supertab'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-fugitive'
Plugin 'Yggdroot/indentLine'
Plugin 'ap/vim-css-color'
Plugin 'bronson/vim-trailing-whitespace'
" languages
Plugin 'elzr/vim-json'
Plugin 'groenewege/vim-less'
Plugin 'hail2u/vim-css3-syntax'
Plugin 'jnwhiteh/vim-golang'
Plugin 'kchmck/vim-coffee-script'
Plugin 'othree/html5.vim'
Plugin 'pangloss/vim-javascript'
Plugin 'tpope/vim-haml'
Plugin 'tpope/vim-markdown'
Plugin 'tpope/vim-rails'
Plugin 'vim-ruby/vim-ruby'
" themes
Plugin 'tomasr/molokai'

call vundle#end()            " required
filetype plugin indent on    " required

set t_Co=256
set background=dark
let g:rehash256 = 1

colorscheme molokai
syntax on

" UI
set number          " show line number
set autoread        " watch for file changes
set noswapfile      " disable swapfiles
set nobackup        " disable backups
set backupdir=~/.vim/backup " Directories for swp files
set showmatch       " show matching brackets.
set showcmd         " shows what you're typing as a command
set wildmenu
"set ruler

" Whitespace stuff
set nowrap
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

" Searching
set hlsearch        " highlight all matches
set incsearch       " do incremental searching
set ignorecase      " ignore case when searching
set smartcase

"set modelines=1
set ttyfast         " faster redraw
set autoindent

" Folding
set foldmethod=indent   " fold based on indent level
set foldnestmax=10      " max 10 depth
set foldenable          " don't fold files by default on open
nnoremap <space> za
set foldlevelstart=10   " start with fold level of 1


" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" remap jj to escape in insert mode.  You'll never type jj anyway!
inoremap jj <Esc>hh

" :w!! to write to a file using sudo
cmap w!! %!sudo tee > /dev/null %

" Airline -------------------------------------------
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
set laststatus=2

" Include other files
" if filereadable(expand("~/.vimrc.local"))
"   source ~/.vimrc.local
" endif
