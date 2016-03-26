set runtimepath^=~/.vim/dein/repos/github.com/Shougo/dein.vim

let s:base_path = expand('~/.vim/dein')
if dein#load_state(s:base_path)
  let s:toml_path = '~/.vim/config/dein.toml'
  let s:toml_lazy_path = '~/.vim/config/deinlazy.toml'

  call dein#begin(s:base_path, [expand('<sfile>'), s:toml_path, s:toml_lazy_path])

  call dein#load_toml(s:toml_path, {'lazy': 0})
  call dein#load_toml(s:toml_lazy_path, {'lazy' : 1})

  call dein#end()
  call dein#save_state()
endif

filetype plugin indent on

" If you want to install not installed plugins on startup.
if has('vim_starting') && dein#check_install()
  call dein#install()
endif

set background=dark
"let g:solarized_termcolors=256
let g:solarized_termtrans=1

colorscheme solarized
