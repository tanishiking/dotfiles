if &compatible
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
" <TAB> によって入力される空白の数
set softtabstop=4
" インデントの空白数
set shiftwidth=4
" タブを空白に
set expandtab


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
" 80列目に印をつける
set colorcolumn=80

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
"set incsearch
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
" ファイル名表示
set title


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

"===Folding===
" foldするぞ！
set foldenable
"open most folds default
set foldlevelstart=10

set foldnestmax=10
"nnoremap <space> za
"set foldmethod=indent

" C-p でブラウザを開く
nnoremap <C-p> :!open %<CR>

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
" jj is espacpe
inoremap jj <esc>

"===Clipboard===
set clipboard+=unnamed

" 外部ファイルを読み込み
runtime! config/*.vim

