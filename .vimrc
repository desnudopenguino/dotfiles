" Turn syntax on
syntax on

" set the color scheme
try
	color distinguished
catch
endtry

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
