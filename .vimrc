" -----------------------------------------------------------------------------
"  Pathogen for package management
" -----------------------------------------------------------------------------

runtime bundle/vim-pathogen/autoload/pathogen.vim
execute pathogen#infect()
syntax on
filetype plugin indent on

" -----------------------------------------------------------------------------
"  Some general options
" -----------------------------------------------------------------------------

set nocompatible                " No Vi compatibility
set shortmess+=I                " No Welcome screen
set backspace=indent,eol,start  " Fix for buggy backspace problem
set tabstop=2                   " 2 space tab stop
set shiftwidth=2                " 2 space shift width
set softtabstop=2               " 2 space soft tab stop
set autoindent                  " use auto indent
set smartindent                 " use smart indent
set expandtab                   " expand tabs to spaces
set ruler                       " Show line and column number
set textwidth=80                " Maximum 80 chars per line
set whichwrap+=<,>,h,l,[,]      " Arrows wrap around
set hidden                      " Buffers can exist in the background
set fillchars=""                " Remove ugly split character
set mouse+=a                    " Enable mouse for scrolling
set number                      " Show line numbers
set confirm                     " Confirm write on exit
set cursorline                  " Show current line
set clipboard=unnamedplus       " Synchronize with clipboard          
set wildmenu                    " Command completions
set wildmode=longest:full,full  " Command completions
set backup                      " Use backup files
set writebackup                 " Write a backup file
set noswapfile                  " Don't write a swap file

" -----------------------------------------------------------------------------
"  Colour scheme
" -----------------------------------------------------------------------------

syntax enable
set background=dark
colorscheme solarized

" Set 16 colours if gui isn't running
if !has("gui_running")
  set t_Co=16
endif

" -----------------------------------------------------------------------------
"  Some GUI options
" -----------------------------------------------------------------------------

if has("gui_running")

  set guioptions-=T         " No tool bar
  set guioptions-=m         " No menu bar
  set guifont=Ubuntu\ Mono\ 13
  set lines=25 columns=80   " The size of the window

endif

" -----------------------------------------------------------------------------
"  Some tmux options 
" -----------------------------------------------------------------------------

if &term =~ '^screen'
  set ttymouse=xterm2     " Enable better mouse movement in vim
endif

" -----------------------------------------------------------------------------
"  Some latex stuff
" -----------------------------------------------------------------------------

let g:tex_flavor="latex"

function! g:ToggleNuMode()
  if(&rnu == 1)
    set nornu
  else
    set rnu
  endif
endfunction

nnoremap <silent> <C-L> :call g:ToggleNuMode()<cr> 
