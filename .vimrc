" -----------------------------------------------------------------------------
"  Pathogen for package management
" -----------------------------------------------------------------------------

runtime bundle/vim-pathogen/autoload/pathogen.vim
execute pathogen#infect()
syntax on
filetype plugin indent on

" -----------------------------------------------------------------------------
"  Some useful functions
" -----------------------------------------------------------------------------

" Map key to toggle option
function MapToggle(key, opt)
  let cmd = ':set '.a:opt.'! \| set '.a:opt."?\<CR>"
  exec 'nnoremap '.a:key.' '.cmd
  exec 'inoremap '.a:key." \<C-O>".cmd
endfunction
command -nargs=+ MapToggle call MapToggle(<f-args>)

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

  " Toggle fullscreen in gui
  MapToggle <F11> fullscreen

  " Function to hide distractions
  function HideDistractions()
    set nonumber
    set noruler
    set columns=80
  endfunction

  " Function to show distractions
  function ShowDistractions()
    set number
    set ruler
    set columns=9999
  endfunction

endif

" -----------------------------------------------------------------------------
"  Some tmux options 
" -----------------------------------------------------------------------------

if &term =~ '^screen'
  set ttymouse=xterm2     " Enable better mouse movement in vim
endif

" -----------------------------------------------------------------------------
"  Some key mappings 
" -----------------------------------------------------------------------------

" Copy/cut/paste/undo
vmap <C-c> "+yi
vmap <C-x> "+c
vmap <C-v> c<ESC>"+p
imap <C-v> <ESC>"+pa
imap <C-z> <ESC>u
nmap <C-z> u

" -----------------------------------------------------------------------------
"  Some unite key bindings
" -----------------------------------------------------------------------------

" Filename/Buffer/Yank History matching
let g:unite_source_history_yank_enable = 1
nnoremap <leader>f :Unite -start-insert file_rec<cr>
nnoremap <leader>b :Unite -start-insert buffer<cr>
nnoremap <leader>y :Unite -start-insert history/yank<cr>

" -----------------------------------------------------------------------------
"  Some latex stuff
" -----------------------------------------------------------------------------

let g:tex_flavor="latex"

