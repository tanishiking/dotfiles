if dein#tap('junegunn/vim-easy-align')
  vnoremap <silent> <Enter> :EasyAlign<CR>
endif

"===incsearch.vim===
if dein#tap('haya14busa/incsearch.vim')
  map /  <Plug>(incsearch-forward)
  map ?  <Plug>(incsearch-backward)
  map g/ <Plug>(incsearch-stay)
endif

"===vim-json===
if dein#tap('elzr/vim-json')
  let g:vim_json_syntax_conceal = 0
endif

"===caw.vim===
if dein#tap('caw.vim')
  nmap <Leader>c <Plug>(caw:tildepos:toggle)
  vmap <Leader>c <Plug>(caw:tildepos:toggle)
endif


if dein#tap('vim-markdown.vim')
  let g:vim_markdown_folding_disabled = 1
endif
