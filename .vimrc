" ---------------------------------------------------------------------------
" .vimrc
" Ethan Schoonover
" www: ethanschoonover.com
" email: es@ethanschoonover.com
" irc/github: altercation
" twitter: ethanschoonover

" Frontmatter ---------------------------------------------------------------

set nocompatible                " explicitly leave vi-compatibility mode
                                " (must be first as may impact options below)

" Plugins -------------------------------------------------------------------

" download vim-plug if missing 
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif

call plug#begin()
Plug 'bling/vim-airline'
Plug 'tpope/vim-surround'
Plug 'Raimondi/delimitMate'
Plug 'scrooloose/nerdcommenter'
Plug 'ervandew/supertab'
Plug 'scrooloose/syntastic'
Plug 'kien/rainbow_parentheses.vim'
"Plug 'luochen1990/rainbow'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': 'yes \| ./install' }
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-speeddating'
Plug 'tpope/vim-repeat'
Plug 'jlanzarotta/bufexplorer'
Plug 'vimoutliner/vimoutliner'
call plug#end()

set background=dark

" Sensible settings ---------------------------------------------------------
" not exactly tpope's sensible.vim but similar set of sane settings

if has('autocmd') | filetype plugin indent on | endif
if has('syntax') && !exists('g:syntax_on') | syntax enable | endif
set autoindent
set backspace=indent,eol,start
set complete-=i
set smarttab
set nrformats-=octal
set ttimeout
set ttimeoutlen=100
set incsearch
" Use <C-L> to clear the highlighting of :set hlsearch.
if maparg('<C-L>', 'n') ==# '' | nnoremap <silent> <C-L> :nohlsearch<CR><C-L> | endif
set laststatus=2
set ruler
set showcmd
set wildmenu
if !&scrolloff | set scrolloff=1 | endif
if !&sidescrolloff | set sidescrolloff=5 | endif
set display+=lastline
if &encoding ==# 'latin1' && has('gui_running') | set encoding=utf-8 | endif
if &listchars ==# 'eol:$' | set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+ | endif
" Delete comment character when joining commented lines
if v:version > 703 || v:version == 703 && has("patch541") | set formatoptions+=j | endif
if has('path_extra') | setglobal tags-=./tags tags-=./tags; tags^=./tags; | endif
if &shell =~# 'fish$' | set shell=/bin/bash | endif
set autoread
set fileformats+=mac
if &history < 1000 | set history=1000 | endif
if &tabpagemax < 50 | set tabpagemax=50 | endif
if !empty(&viminfo) | set viminfo^=! | endif
set sessionoptions-=options
" Allow color schemes to do bright colors without forcing bold.
if &t_Co == 8 && $TERM !~# '^linux' | set t_Co=16 | endif
" Load matchit.vim, but only if the user hasn't installed a newer version.
if !exists('g:loaded_matchit') && findfile('plugin/matchit.vim', &rtp) ==# '' | runtime! macros/matchit.vim | endif
inoremap <C-U> <C-G>u<C-U>


" Airline -------------------------------------------------------------------
let g:airline_theme             = 'solarized'
let g:airline_powerline_fonts = 1


" General -------------------------------------------------------------------

set number                      " line numbering
set showcmd                     " incomplete cmds displayed at bottom
set showmode                    " active mode displayed at bottom
set history=1000                " num lines of :cmdline history to retain
set gcr=a:blinkon0              " no cursor blink
set visualbell                  " no beep
set autoread                    " reload file on external changes
set backspace=indent,eol,start  " backspace on while in insert mode
set modeline
syntax on                       " colorized syntax highlighting

" This makes vim act like all other editors, buffers can
" exist in the background without being in a window.
" http://items.sjbach.com/319/configuring-vim-right
set hidden

" Change leader to a comma because the backslash is too far away
" That means all \x commands turn into ,x
" The mapleader has to be set before vundle starts loading all 
" the plugins.
let mapleader=","

"   Environment   -----------------------------------------------------------

set encoding=utf-8              " unicode encoding by default
set title                       " show title in terminal
set clipboard+=unnamed          " unnamed buffer set to gui register *
                                " so that dd == "*dd
set hidden                      " buffers hidden, not closed, when abandoned
set noexrc                      " don't use local version of .(g)vimrc, .exrc

