" カラースキーム
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

"===lightline.vim===
NeoBundle 'itchyny/lightline.vim'

"===incsearch.vim===
NeoBundle 'haya14busa/incsearch.vim'
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)

"===vim-json===
NeoBundle 'elzr/vim-json'
let g:vim_json_syntax_conceal = 0

"===MARKDOWN===
NeoBundle 'plasticboy/vim-markdown'
NeoBundle 'kannokanno/previm'
NeoBundle 'tyru/open-browser.vim'

au BufRead, BufNewFile *.md set filetype=markdown

"===caw.vim===
NeoBundle 'tyru/caw.vim.git'
nmap <Leader>c <Plug>(caw:i:toggle)
vmap <Leader>c <Plug>(caw:i:toggle)

"===vim-surround===
NeoBundle 'tpope/vim-surround'
