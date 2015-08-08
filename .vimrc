if &nocompatible
    set compatible
endif

" vim
set encoding=utf-8
" vim script encoding
scriptencoding utf-8
" ファイルを開く際のエンコーディング
set fileencoding=utf-8

"256色モード
set t_Co=256

syntax on

"===Spaces&Tab===
" 改行時の自動インデントとスマートインデントをおこなう
set autoindent smartindent
"<TAB> によって見えるスペースの数
set tabstop=4
" <TAB> によって入力されるスペースの数
set softtabstop=4
set shiftwidth=4
" タブをホワイトスペースに
set expandtab

augroup vimrc_autocmd
  autocmd! FileType html setlocal shiftwidth=2 softtabstop=2 tabstop=2
  autocmd! FileType css  setlocal shiftwidth=4 softtabstop=2 tabstop=2
augroup END


"===UI config===
" 行番号を表示する
set number
" コマンドを表示
set showcmd
" カーソル行をハイライトする
set cursorline
" カーソル列をハイライト
set cursorcolumn
"保存しなくてもファイルを切り替えられる
set hidden
" ファイルを保存をしてないときにファイル保存を確認する
set confirm
"ビープ恩の代わりに画面をフラッシュ
set visualbell
" 画面フラッシュもオフ
set t_vb=
" すべてのモードでマウス有効
set mouse=a

" マッピングはタイムアウトなし
" キーコードはタイムアウトあり
set notimeout ttimeout ttimeoutlen=200

" swapファイルつくらない
set noswapfile

" バックアップ
" 上書きに失敗した場合のみバックアップをつくる
set nobackup
set writebackup
" バックアップファイルの場所
set backupdir=.,~/tmp.~/


"===Searching===
" インクリメンタルサーチするぞ
set incsearch
" 検索結果ハイライト
set hlsearch

nnoremap <leader><space> :nohlsearch<CR>
" 小文字なら大文字を無視 大文字なら大文字も検索
set smartcase
"set ignorecase


" ===表示設定===
" ステータスラインを常に表示
set laststatus=2
" コマンドラインの行数
set cmdheight=1

" ウィンドウの最後の行も省略せずに表示
set display=lastline


" === インデント ===
filetype indent on  "load language specific indentation files ~/.vim/indent/

" コマンドもオートコンプリートする
set wildmenu
" :redraw! のときにredrow
set lazyredraw
"[{()}] とかのマッチをハイライトする
set showmatch
" <>もマッチして欲しい
set matchpairs& matchpairs+=<:>
" backspace でこれらも削除したい
set backspace=indent,eol,start

" 不可視文字の表示
set list
set listchars=tab:>-,trail:-,nbsp:%,extends:>,precedes:<
" ファイル名表示
set title







"===Folding===
" foldするぞ！
set foldenable
"open most folds default
set foldlevelstart=10

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
" exc を 
inoremap jj <esc>
"jk is espacpe

"===Clipboard===
set clipboard+=unnamed

"===Browser View
" C-p でブラウザを開く
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


set background=dark
"let g:solarized_termcolors=256
let g:solarized_termtrans=1
colorscheme solarized

