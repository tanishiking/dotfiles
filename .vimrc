"===Spaces&Tab===
set tabstop=4   "number of visual spaces per <TAB>
set softtabstop=4   "number of spaces in tab when edditing
set shiftwidth=4

augroup vimrc_autocmd
autocmd! FileType html setlocal shiftwidth=2 softtabstop=2 tabstop=2
autocmd! FileType css  setlocal shiftwidth=4 softtabstop=2 tabstop=2
augroup END
    

set expandtab   "tab to spaces(num of spaces equals to softtabstop)


"===UI config===
set number  "show line numbers
set showcmd     "show commands

set cursorline  "highlight cursor line
set cursorcolumn    "show cursor column

set hidden  "保存しなくてもファイルを切り替えられる

filetype indent on  "load language specific indentation files ~/.vim/indent/

set wildmenu    "visual autocomplete for command menu
set lazyredraw  "redraw only when you type :redraw!
set showmatch   "hilight matching [{()}]
set matchpairs& matchpairs+=<:>     "add match pair <>

set backspace=indent,eol,start  "enable to del anything by bs

"===show invisible chars===
"set list
"set listchars=tab:>-,trail:-,nbsp:%,extends:>,precedes:<
set title "show title


"===Searching===
set incsearch    "enable to incremental search

set hlsearch    "hilight matches

nnoremap <leader><space> :nohlsearch<CR>
"ignore case when searching
set ignorecase
set smartcase

"===backup===
set noswapfile


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
scriptencoding utf-8 "vim script encoding


"===Clipboard===
"set clipboard=unnamedplus
set clipboard+=unnamed

"===Browser View
nnoremap <C-p> :!open %<CR>


"=============================
"NeoBundle SetUp
"=============================
if !1 | finish | endif

if has('vim_starting')
    if &compatible
        set nocompatible
    endif
    set runtimepath+=~/dotfiles/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/dotfiles/.vim/bundle/'))
"Let NeoBundle manage NeoBundle
NeoBundleFetch 'Shougo/neobundle.vim'

" My Bundles here
"===Color===
NeoBundle 'altercation/vim-colors-solarized'

"===basic plugins===
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neosnippet.vim'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'Townk/vim-autoclose'
NeoBundle 'scrooloose/syntastic.git'
NeoBundle 'Yggdroot/indentLine'


"===Easy Align===
NeoBundle 'junegunn/vim-easy-align'
vnoremap <silent> <Enter> :EasyAlign<CR>


"=====neocomplete=====
NeoBundle 'Shougo/neocomplete.vim'
let g:acp_enableAtStartup = 0 "disable autocomplPop
let g:neocomplete#enable_at_startup = 1 "useneocomplete
let g:neocomplete#enable_smart_case = 1 "use smartcase
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

let g:complete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

if !exists('g:neocomplete#keyword_patterns')
        let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

"plugin key-mapping
inoremap <expr><C-g> neocomplete#undo_completion()
inoremap <expr><C-l> neocomplete#complete_common_string()

"<CR>: close popup and save indent
"inoremap <silent><CR><C-r> = <SID>my_cr_function()<CR>
"function! s:my_cr_function()
"        return neocomplete#close_popup()
"endfunction

"<TAB>: completion
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"

"<C-h> <BS> : close popup and delete backword char
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"


"===html css js jquery===
NeoBundle 'mattn/emmet-vim'
NeoBundle 'hail2u/vim-css-syntax'
NeoBundle 'pangloss/vim-javascript'

"===Python===

NeoBundleLazy "nvie/vim-flake8", {
    \ "autoload": {
    \ "filetypes": ["python", "python3", "djangohtml"]
    \ }}

"autocmd FileType python setlocal completeopt-=preview "disable docstring
"autocmd FileType python setlocal omnifunc=jedi#completions
"let g:jedi#completions_enabled = 0
"let g:jedi#auto_vim_configuration = 0
"if !exists('g:neocomplete#force_omni_input_patterns')
"        let g:neocomplete#force_omni_input_patterns = {}
"endif
"let g:neocomplete#force_omni_input_patterns.python = '\h\w*\|[^. \t]\.\w*'

"===Haskell===
NeoBundle 'kana/vim-filetype-haskell'

"===MARKDOWN===
NeoBundle 'plasticboy/vim-markdown'
NeoBundle 'kannokanno/previm'
NeoBundle 'tyru/open-browser.vim'

au BufRead,BufNewFile *.md set filetype=markdown



call neobundle#end()
filetype plugin indent on

NeoBundleCheck

set t_Co=256    "256色モード

syntax on   "enable syntax processing
set background=dark
"let g:solarized_termcolors=256
let g:solarized_termtrans=1
colorscheme solarized

