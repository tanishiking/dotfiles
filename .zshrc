# .zshrc
#
#
# Copyright (c) 2014 - 2015, Rikito Taniguchi


function add_path_if_exists() {
    if [ -d "$1" ]; then
        export PATH="$1:$PATH"
    fi
}


#動補完を有効にする
autoload -U compinit; compinit

#補完で小文字でも大文字にマッチ
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

#もしかして
setopt correct

# ビープ音をOFF
setopt no_beep
setopt nolistbeep

#色
autoload -U colors; colors

#補完候補もLS_COLORSに合わせて色付け
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

#lsがカラー表示になるようエイリアス
case "${OSTYPE}" in
darwin*)
    #Mac
    alias ls="ls -GF"
    ;;
linux*)
    #Linux
    alias ls='ls -F --color'
    ;;
esac


#プロンプト
PROMPT="
[%n] %{${fg[yellow]}%}%~%{${reset_color}%}
%(?.%{$fg[green]%}.%{$fg[blue]%})%(?!(*'-') <!(*;-;%)? <)%{${reset_color}%} "

#キーバインドvim
bindkey -v

#エイリアス
alias rm='rm -i'
alias cp='cp -i'
alias mv='cp -i'
alias mkdir='mkdir -p'

alias ll='ls -la'

#sudoのあとのコマンドでエイリアスを有効
alias sudo='sudo '


#===Python virtual env 用
if [ -f /usr/local/bin/virtualenvwrapper.sh ]; then
    export WORKON_HOME=$HOME/.virtualenvs
    export PROJECT_HOMR=$HOME/Devel
    source /usr/local/bin/virtualenvwrapper.sh
fi

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# for homebrew
add_path_if_exists /usr/local/bin
add_path_if_exists /usr/local/sbin
if [ -f /usr/local/bin/rbenv ]; then
	eval "$(rbenv init -)"
fi

#export PATH="$(brew --prefix homebrew/php/php56)/bin:$PATH"
if [ -f /usr/local/bin/brew ]; then
  add_path_if_exists $(brew --prefix homebrew/php/php56)
  add_path_if_exists $HOME/.composer/vendor/bin
fi

### nodebrew
export PATH=$PATH:$HOME/.nodebrew/current/bin:$PATH

add_path_if_exists PATH=$HOME/.local/bin:$PATH
