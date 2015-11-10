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
Plugin 'kien/ctrlp.vim'
Plugin 'bling/vim-airline'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on

" Turn syntax on
syntax on

" set the color scheme
if &term =~ "xterm-256color" || &term =~ "rxvt-unicode-256color"
	color distinguished
else
	color slate
endif

set ffs=unix,dos,mac

" set relative number with actual line number (hybrid numbers) 
set relativenumber
set number

" Set tabs to 2 spaces
set tabstop=2
set shiftwidth=2

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

" Don't write back-up files
set nobackup
set nowritebackup

filetype plugin on
au FileType php,html,ctp setl ofu=phpcomplete#CompletePHP
au FileType ruby,eruby setl ofu=rubycomplete#Complete
au FileType html,ctp setl ofu=complete#CompleteTags
au FileType c setl ofu=ccomplete#CompleteCpp
au FileType css setl ofu=csscomplete#CompleteCSS

" Auto indents the next line
set autoindent

" fold on indenting, faster file navigation maybe?
set foldmethod=indent

" use ; instead of :, one less keystroke needed!
map ; :

" commands for CtrlP
if !empty(glob(".vim/bundle/ctrlp.vim"))
	let g:ctrlp_map = '<c-p>'
	let g:ctrlp_cmd = 'CtrlP'
endif

" show tabs, nbsp, and tabs
exec "set listchars=tab:\uBB\uBB,trail:\uB7"
set list
