"" General
syntax on
set termguicolors
" if exists('+termguicolors')
	" let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
	" let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
	" set termguicolors
" endif
set t_Co=256
" set -g default-terminal 'tmux-256color'
" set -ga terminal-overrides ',*256col*:Tc'

let mapleader = " "
set number		" Show line numbers
set linebreak		" Break lines at word (requires Wrap lines)
set showbreak=+++	" Wrap-broken line prefix
set textwidth=100	" Line wrap (number of cols)
set showmatch		" Highlight matching brace
set visualbell		" Use visual bell (no beeping)
set hlsearch		" Highlight all search results
set smartcase		" Enable smart-case search
set ignorecase		" Always case-insensitive
set incsearch		" Searches for strings incrementally
set autoindent		" Auto-indent new lines
set shiftwidth=2	" Number of auto-indent spaces
set smartindent		" Enable smart-indent
set smarttab		" Enable smart-tabs
set softtabstop=2	" Number of spaces per Tab

   
"" Advanced
set ruler 			" Show row and column ruler information
set undolevels=1000		" Number of undo levels
set backspace=indent,eol,start	" Backspace behaviour

set clipboard=unnamedplus

"set path+=**
" Nice menu when typing `:find *.py`
"set wildmode=longest,list,full
"set wildmenu
" Ignore files
"set wildignore+=*.pyc
"set wildignore+=*_build/*
"set wildignore+=**/coverage/*
"set wildignore+=**/node_modules/*
"set wildignore+=**/android/*
"set wildignore+=**/ios/*
"set wildignore+=**/.git/*

let asyncomplete_auto_completeopt = 0
set completeopt=menuone,noinsert,noselect,preview

let g:completion_enable_snippet = 'UltiSnips'
