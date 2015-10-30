set nocp
" Vundle goodness
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"

" NERDTree arrows not worknig
let NERDTREEDirArrows=0


" Turn syntax on
syntax on

" set the color scheme
if &term =~ "xterm-256color"
	color distinguished
else
	color slate
endif

" indent lines based on filetype
filetype plugin indent on

set ffs=unix,dos,mac

" set the line numbers
set number

" Set tabs to 2 spaces
set tabstop=2

" auto read when a file is changed from outside
set autoread

" Fast saving
nmap <leader>w :w!<cr>

" split below and right, it looks better
set splitbelow
set splitright

" Backspace behavior
set backspace=indent,eol,start

" Show the status line
set laststatus=2

" Remove arrow interaction to learn the keyboard better!
noremap <left> <nop>
noremap <up> <nop>
noremap <right> <nop>
noremap <down> <nop>

set nobackup
set nowritebackup
set shiftwidth=2

filetype plugin on
au FileType php,html,ctp setl ofu=phpcomplete#CompletePHP
au FileType ruby,eruby setl ofu=rubycomplete#Complete
au FileType html,ctp setl ofu=complete#CompleteTags
au FileType c setl ofu=ccomplete#CompleteCpp
au FileType css setl ofu=csscomplete#CompleteCSS

set autoindent

map ; :

set foldmethod=indent
