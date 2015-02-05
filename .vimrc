syntax enable   "enable syntax processing

"Spaces&Tab
set tabstop=4   "number of visual spaces per <TAB>
set softtabstop=4   "number of spaces in tab when edditing
set expandtab   "tab to spaces(num is softtabstop)

"===UI config===
set number  "show line numbers
set showcmd     "show commands
set cursorline  "highlight cursor line
filetype indent on  "load language specific indentation files ~/.vim/indent/
set wildmenu    "visual autocomplete for command menu
set lazyredraw  "redraw only when you type :redraw!
set showmatch   "hilight matching [{()}]
set matchpairs& matchpairs+=<:>     "add match pair <>
"show invisible chars
set list
set listchars=tab:>-,trail:-,nbsp:%,extends:>,precedes:<
set title "show title

"===Searching===
set incsearch    "enable to incremental search
set hlsearch    "hilight matches
nnoremap <leader><space> :nohlsearch<CR>
"ignore case when searching
set ignorecase
set smartcase


"===Folding===
set foldenable  "enable to fold
set foldlevelstart=10   "open most folds default
set foldnestmax=10
"nnoremap <space> za
"set foldmethod=indent


"===Movement===
"move vertically by visual line
nnoremap j gj
nnoremap k gk

"moveto begin and end of line
nnoremap B ^
nnoremap E $
"nnoremap $ <nop>
"nnoremap ^ <nop>
"hilight last inserted line
nnoremap gV `[v`]


"===Leader Shortcuts===
"let mapleader=","
inoremap jj <esc>
"jk is espacpe


"===encoding===
set encoding=utf-8
set fileencoding=utf-8


"===Clipboard===
set clipboard=unnamedplus


"=============================
"NeoBundle SetUp
"=============================
if !1 | finish | endif

if has('vim_starting')
    if &compatible
        set nocompatible
    endif
    set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/.vim/bundle/'))
"Let NeoBundle manage NeoBundle
NeoBundleFetch 'Shougo/neobundle.vim'

" My Bundles here
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neosnippet.vim'

call neobundle#end()
filetype plugin indent on

NeoBundleCheck
