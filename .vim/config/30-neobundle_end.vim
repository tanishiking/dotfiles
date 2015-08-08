call neobundle#end()

" ファイル形式別印伝ととプラグインを有効化する
filetype plugin indent on
NeoBundleCheck

" on_source を実行
call neobundle#call_hook("on_source")


set background=dark
"let g:solarized_termcolors=256
let g:solarized_termtrans=1

colorscheme solarized
