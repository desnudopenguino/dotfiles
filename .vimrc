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
" call vundle#begin('~/some/path/here')
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim' "Vim Bundler
Plugin 'tpope/vim-fugitive' " Git wrapper
Plugin 'ctrlpvim/ctrlp.vim' " Fuzzy search
Plugin 'kristijanhusak/vim-multiple-cursors' " Multiple cursors at once
Plugin 'majutsushi/tagbar' " Tagbar for ctags
Plugin 'ludovicchabant/vim-gutentags' " Autogenerate ctags for file
Plugin 'dracula/vim' " dracula color scheme
Plugin 'itchyny/lightline.vim' " Info line at bottom, more customizable than vim-airline
Plugin 'lervag/vimtex' " Tex/LaTex plugin for making pretty outputs
Plugin 'xolox/vim-misc' " Needed for vim-notes
Plugin 'xolox/vim-notes' " Note taking format for my scratch stuff
Plugin 'ryanoasis/vim-devicons' " Pretty icons
Plugin 'tpope/vim-rails' " Rails plugin
Plugin 'fatih/vim-go' " Go plugin
Plugin 'tpope/vim-vinegar' " Plugin to help with netrw
Plugin 'vim-syntastic/syntastic' " Syntastic syntax checker
Plugin 'junegunn/fzf' " fzf in vim
Plugin 'junegunn/fzf.vim' " fzf in vim
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
" filetype plugin on
"""""""""""""""""""""""""""""""""""""""""""
" Behaviors
"""""""""""""""""""""""""""""""""""""""""""
" set the leader
noremap <space> <nop>
let mapleader = ' '
" netrw
let g:netrw_liststyle = 3
let g:netrw_banner = 1
" Set font
set guifont=Hack\ 10
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
" turn off gitgutter grep color command for gitgutter
let g:gitgutter_grep_command='grep -e'
let g:gitgutter_max_signs=100000
" encryption
set cm=blowfish2
" Notes settings
let g:notes_directories = ['~/.scratch']
let g:notes_suffix = '.txt'

" gutentags
let g:gutentags_ctags_executable="/usr/local/bin/ectags"

"""""""""""""""""""""""""""""""""""""""""""
" Visuals
"""""""""""""""""""""""""""""""""""""""""""
" Set tabs to 2 spaces
set tabstop=4
set shiftwidth=4 expandtab
set breakindent

" show tabs, nbsp, and tabs
exec "set listchars=tab:\uBB\uBB,trail:\uB7"
set list

" highlight current cursor line
set cursorline

" Turn syntax on
syntax on

" show command
set showcmd

" autocomplete
filetype plugin on
au FileType php,html,ctp setl ofu=phpcomplete#CompletePHP
au FileType ruby,eruby setl ofu=rubycomplete#Complete
au FileType html setl ofu=htmlcomplete#CompleteTags
au FileType css setl ofu=csscomplete#CompleteCSS

" set the color scheme
if &term =~ "xterm-256color" || &term =~ "rxvt-unicode-256color" || &term =~ "screen-256color"
  silent! colorscheme dracula
endif
" set relative number with actual line number (hybrid numbers)
set relativenumber
set number
set ruler
" transparent background
 hi Normal ctermbg=NONE
" 81st Coumn highlighting
 highlight ColorColumn ctermbg=238
call matchadd('ColorColumn', '\%81v', 16)
" lightline config
let g:lightline = {
      \ 'colorscheme': 'darcula',
      \ }
" Syntastic settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Syntax checkers
let g:syntastic_ruby_checkers = ['rubocop']

"""""""""""""""""""""""""""""""""""""""""""
" Commands/shortcuts
"""""""""""""""""""""""""""""""""""""""""""
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
" reload .vimrc
noremap :r :source ~/.vimrc<CR>
" insert timestamp
:nnoremap <F5> "=strftime("%c")<CR>P
:inoremap <F5> <C-R>=strftime("%c")<CR>
" commands for CtrlP
if !empty(glob(".vim/bundle/ctrlp.vim"))
  let g:ctrlp_map = '<c-p>'
  let g:ctrlp_cmd = 'CtrlP'
endif
" cleans up any whitespace and formatting issues
function TrimWhiteSpace()
  " retab to set tabs to spaces
  retab
  " remove carriage returns
  %s///g
  " remove spaces
  %s/\s\+$//e
endfunction
noremap :trim :call TrimWhiteSpace()<CR>

" html beautify
if executable('html-beautify')
  let &l:formatprg = 'html-beautify -I -s ' . &shiftwidth
endif

" html, js, and css tabbings
autocmd FileType html,javascript,css,yaml setlocal shiftwidth=2 tabstop=2


" set syntax checker for latex
let g:syntastic_tex_lacheck_quiet_messages = { 'regex': '\Vpossible unwanted space at' }
let g:syntastic_tex_checkers = ['lacheck']

" auto complete tags
:iabbrev <lt>// </<C-X><C-O><Esc>==gi

" fzf
nmap <Leader>f :Files<CR>
nmap <Leader>F :GFiles<CR>
