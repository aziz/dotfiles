set nocompatible              " required
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim " set the runtime path to include Vundle and initialize
call vundle#begin()

Plugin 'gmarik/Vundle.vim'   " let Vundle manage Vundle, required
Plugin 'scrooloose/nerdtree'
Plugin 'bling/vim-airline'

call vundle#end()            " required
filetype plugin indent on    " required
