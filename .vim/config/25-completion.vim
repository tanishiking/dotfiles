" neocomplete
if dein#tap('neocomplete.vim')

  "disable autocomplPop
  let g:acp_enableAtStartup = 0
  "useneocomplete
  let g:neocomplete#enable_at_startup = 1
  "use smartcase
  let g:neocomplete#enable_smart_case = 1
  "3文字
  let g:neocomplete#sources#syntax#min_keyword_length = 3
  let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

  " define directory
  let g:complete#sources#dictionary#dictionaries = {
      \ 'default' : '',
      \ 'vimshell' : $HOME.'/.vimshell_hist',
      \ 'scheme' : $HOME.'/.gosh_completions',
      \ 'scala' : $HOME.'/.vim/dict/scala.dict'
          \ }

  if !exists('g:neocomplete#keyword_patterns')
          let g:neocomplete#keyword_patterns = {}
  endif
  let g:neocomplete#keyword_patterns['default'] = '\h\w*'

  "plugin key-mapping
  inoremap <expr><C-g> neocomplete#undo_completion()
  inoremap <expr><C-l> neocomplete#complete_common_string()

  " Enable completion
  autocmd FileType python setlocal omnifunc=python3complete#Complete

  " reccoment key mapping
  " <CR>: close popup and save indent
  "inoremap <silent><CR><C-r> = <SID>my_cr_function()<CR>
  function! s:my_cr_function()
      return neocomplete#close_popup()
  endfunction

  "<TAB>: completion
  inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"

  "<C-h> <BS> : close popup and delete backword char
  inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
  inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
endif
