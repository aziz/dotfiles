set nocompatible              " required
filetype off                  " required

set rtp+=$HOME/.vim/bundle/Vundle.vim " set the runtime path to include Vundle and initialize
call vundle#begin()

Plugin 'gmarik/Vundle.vim'   " let Vundle manage Vundle, required
" utils
Plugin 'ap/vim-css-color'
Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'bronson/vim-trailing-whitespace'
Plugin 'chrisbra/vim-diff-enhanced'
Plugin 'ervandew/supertab'
Plugin 'gabesoft/vim-ags'
Plugin 'godlygeek/tabular'
Plugin 'kien/ctrlp.vim'
Plugin 'lilydjwg/colorizer'
Plugin 'matchit.zip'
Plugin 'mhinz/vim-startify'
Plugin 'Raimondi/delimitMate'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'terryma/vim-expand-region'
Plugin 'tomtom/tcomment_vim'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'elentok/plaintasks.vim'
" languages
Plugin 'elzr/vim-json'
Plugin 'groenewege/vim-less'
Plugin 'hail2u/vim-css3-syntax'
Plugin 'jnwhiteh/vim-golang'
Plugin 'kchmck/vim-coffee-script'
Plugin 'othree/html5.vim'
Plugin 'pangloss/vim-javascript'
Plugin 'tpope/vim-haml'
Plugin 'tpope/vim-rails'
Plugin 'vim-ruby/vim-ruby'
" themes
Plugin 'gertjanreynaert/cobalt2-vim-theme'
Plugin 'YorickPeterse/happy_hacking.vim'
Plugin 'tyrannicaltoucan/vim-deep-space'
Plugin 'vim-scripts/ScrollColors'

call vundle#end()            " required
filetype plugin indent on    " required

" UI
set encoding=utf-8
set number          " show line number
set autoread        " watch for file changes
set autoindent
set noswapfile      " disable swapfiles
set nobackup        " disable backups
set backupdir=$HOME/.vim/backup " Directories for swp files
set showmatch       " show matching brackets.
set showcmd         " shows what you're typing as a command
set wildmenu
set ttyfast         " faster redraw
set timeoutlen=1000 ttimeoutlen=0 " eliminating esc delays
set shortmess+=I    " no welcome message
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
set gdefault
" use normal regex for search
nnoremap / /\v
vnoremap / /\v

" Folding
set foldmethod=indent   " fold based on indent level
set foldnestmax=10      " max 10 depth
set foldenable          " don't fold files by default on open
nnoremap <space> za     " use space to toggle folds
set foldlevelstart=10   " start with fold level of 1


" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" remap jj to escape in insert mode.  You'll never type jj anyway!
inoremap jj <Esc>hh
" Removes highlight of your last search
noremap <C-n> :nohl<CR>
vnoremap <C-n> :nohl<CR>
inoremap <C-n> :nohl<CR>

" force *.md files as markdown
autocmd BufNewFile,BufReadPost *.md set filetype=markdown

" :w!! to write to a file using sudo
cmap w!! %!sudo tee > /dev/null %

" Source the vimrc file after saving it
autocmd BufWritePost $MYVIMRC source $MYVIMRC
" Disable syntax highlight for files larger than 50 MB
autocmd BufWinEnter * if line2byte(line("$") + 1) > 50000000 | syntax clear | endif

" Airline
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_theme='powerlineish'
set laststatus=2

let g:NERDTreeWinPos = "left"
autocmd BufWinEnter * NERDTreeMirror
" NERDTree, Use F3 for toggle NERDTree
nmap <silent> <F3> :NERDTreeToggle<CR>

"set background=dark
"set fillchars+=stl:\ ,stlnc:\
"let g:rehash256 = 1

set t_Co=256
syntax on
:silent! colorscheme cobalt2

" Set split separator to Unicode box drawing character
set fillchars+=vert:│
" Override color scheme to make split lines gray
highlight VertSplit ctermbg=NONE guibg=NONE ctermfg=Gray

" Include other files
" if filereadable(expand("~/.vimrc.local"))
"   source ~/.vimrc.local
" endif
