" Turn syntax on
syntax on

try
	color distinguished
catch
endtry

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
