set nocp
"""""""""""""""""""""""""""""""""""""""""""
" Vundle goodness
"""""""""""""""""""""""""""""""""""""""""""
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim' "Vim Bundler 
Plugin 'tpope/vim-fugitive' " Git wrapper
Plugin 'kien/ctrlp.vim' " Fuzzy search
Plugin 'kristijanhusak/vim-multiple-cursors' " Multiple cursors at once
Plugin 'majutsushi/tagbar' " Tagbar for ctags
Plugin 'ludovicchabant/vim-gutentags' " Autogenerate ctags for file
Plugin 'airblade/vim-gitgutter' " Gutter notifications for git diff
Plugin 'Lokaltog/vim-distinguished' "vim distinguished colorscheme
Plugin 'onur/vim-motivate' "Motivational goodness!
Plugin 'itchyny/lightline.vim' " Info line at bottom, more customizable than vim-airline

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on

"""""""""""""""""""""""""""""""""""""""""""
" Behaviors 
"""""""""""""""""""""""""""""""""""""""""""

set shell=/usr/local/bin/bash

" UTF-8
set encoding=utf-8
set fileencoding=utf-8
scriptencoding utf-8

" File Format
set ffs=unix,dos,mac

" Auto indents the next line
set autoindent

" Backspace behavior
set backspace=indent,eol,start

" Show the status line
set laststatus=2

" Don't write back-up files
set nobackup
set nowritebackup

" split below and right, it looks better
set splitbelow
set splitright

"""""""""""""""""""""""""""""""""""""""""""
" Visuals
"""""""""""""""""""""""""""""""""""""""""""

" Set tabs to 2 spaces
set tabstop=2
set shiftwidth=2

" show tabs, nbsp, and tabs
exec "set listchars=tab:\uBB\uBB,trail:\uB7"
set list

" highlight current cursor line
set cursorline

" Turn syntax on
syntax on

filetype plugin on
au FileType php,html,ctp setl ofu=phpcomplete#CompletePHP
au FileType ruby,eruby setl ofu=rubycomplete#Complete
au FileType html,ctp setl ofu=complete#CompleteTags
au FileType c setl ofu=ccomplete#CompleteCpp
au FileType css setl ofu=csscomplete#CompleteCSS

" set the color scheme
if &term =~ "xterm-256color" || &term =~ "rxvt-unicode-256color" || &term =~ "screen-256color"
	color distinguished
endif

" set relative number with actual line number (hybrid numbers) 
set relativenumber
set number
set ruler

" transparent background
hi Normal ctermbg=NONE

" 81st Coumn highlighting
highlight ColorColumn ctermbg=magenta
call matchadd('ColorColumn', '\%81v', 100)


let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'component': {
      \   'readonly': '%{&readonly?"⭤":""}',
      \ },
      \ 'separator': { 'left': "\ue0b0", 'right': "\ue0b2" },
      \ 'subseparator': { 'left': "\ue0b1", 'right': "\ue0b3" }
      \ }

"""""""""""""""""""""""""""""""""""""""""""
" Commands/shortcuts
"""""""""""""""""""""""""""""""""""""""""""

" use ; instead of :, one less keystroke needed!
nmap ; :

" Fast saving
noremap ;w :w!<CR>

" map F8 to toggle tagbar window
nmap <F8> :TagbarToggle<CR>

" Close All buffers easily
noremap <F7> :bufdo bd<CR>

" Close and replace current buffer with previous buffer in this pane
noremap :bc :bp <bar> bd #<CR>

" Remove arrow interaction to learn the keyboard better!
noremap <left> <nop>
noremap <up> <nop>
noremap <right> <nop>
noremap <down> <nop>

" use ;q to replace escape and save (nice on dvorak, and mapped with ; as :)
inoremap ;q <esc>:w<CR>

" reload .vimrc
noremap ;r :source ~/.vimrc<CR>

" commands for CtrlP
if !empty(glob(".vim/bundle/ctrlp.vim"))
	let g:ctrlp_map = '<c-p>'
	let g:ctrlp_cmd = 'CtrlP'
endif
