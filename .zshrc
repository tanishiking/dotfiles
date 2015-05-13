#動補完を有効にする
autoload -U compinit; compinit

#補完で小文字でも大文字にマッチ
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

#もしかして
setopt correct

#色
autoload -U colors; colors

#ls

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

#sudoのあとのコマンドでエイリアスを有効
alias sudo='sudo '


#===Python virtual env 用
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOMR=$HOME/Devel
source /usr/local/bin/virtualenvwrapper.sh

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

export PATH=/usr/local/bin/:$PATH # for homebrew
export PATH=/usr/local/sbin/:$PATH # for homebrew
eval "$(rbenv init -)"

