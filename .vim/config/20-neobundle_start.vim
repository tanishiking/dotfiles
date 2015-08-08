if !1 | finish | endif

if has('vim_starting')
    if &compatible
        set nocompatible
    endif
    " required
    set runtimepath+=~/dotfiles/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/dotfiles/.vim/bundle/'))
"Let NeoBundle manage NeoBundle 
""required
NeoBundleFetch 'Shougo/neobundle.vim'

