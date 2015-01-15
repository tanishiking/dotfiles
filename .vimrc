"<<<<<<< HEAD
set title "編集中のファイル名表示
syntax on "コードの色分け
set tabstop=4 "インデントをスペース４つ
set smartindent "autoindent

"インクリメンタルサーチを行う
set incsearch

"タブの代わりに空白文字を指定
set expandtab

"行番号表示
set number


"=======
"シンタックスハイライト
syntax enable
"エンコード
set encoding=utf-8
"ファイルエンコード
set fileencoding=utf-8

"不可視文字を表示
set list
set listchars=tab:>-,trail:-,nbsp:%,extends:>,precedes:<
"行番号表示
set number
"右下に表示される行・列の番号を表示する
set ruler
"タイトル表示
set title

"対応カッコに<と>のペアを追加
set matchpairs& matchpairs+=<:>
"対応括弧をハイライト表示
set showmatch
"対応括弧の表示秒数2秒
set matchtime=2

"OSのクリップボード使用
set clipboard+=unnamed
set clipboard=unnamed
"改行時の自動インデント
set autoindent

"画面表示 タブ
set tabstop=4 "タブ幅4
set shiftwidth=4 "インデント時に使用されるスペース数
set expandtab "タブ挿入時にタブを半角スペースとして挿入
set softtabstop=4 "タブ入力時にその数値文だけ半角スペース挿入
set wrap "画面端折り返し

"インクリメントサーチ有効
set incsearch
"検索結果をハイライト
set hlsearch
"検索時に大文字小文字を区別しない
set ignorecase
set smartcase


"=============================
"NeoBundle SetUp
"=============================
" 以下を追記
set nocompatible
filetype plugin indent off

if has('vim_starting')
    if &compatible
        set nocompatible
    endif

    "Required:
    set runtimepath+=~/dotfiles/.vim/bundle/neobundle.vim/
endif

"Required
call neobundle#begin(expand('~/dotfiles/.vim/bundle/'))

"Let NeoBundle manage NeoBundle
NeoBundleFetch 'Shougo/neobundle.vim'

" My Bundles here
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neosnippet.vim'
NeoBundle 'tomasr/molokai'

call neobundle#end()

filetype plugin indent on

NeoBundleCheck
">>>>>>> f7814a28eba556009dd409a55224dd1378e25dbe
