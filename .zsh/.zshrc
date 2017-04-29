# .zshrc

function add_path_if_exists() {
    if [ -d "$1" ]; then
        export PATH="$1:$PATH"
    fi
}

function load_library() {
    if [ -f $1 ]; then
        . $1
    fi
}

function _command_exists() {
    hash "$1" 2>/dev/null
}

# 履歴ファイルの保存先
export HISTFILE=${HOME}/.zsh_history
# # メモリに保存される履歴の件数
export HISTSIZE=100000
# # 履歴ファイルに保存される履歴の件数
export SAVEHIST=100000
# # 重複を記録しない
setopt hist_ignore_dups
# zsh 間でhistoryを共有
setopt share_history
# # 開始と終了を記録
setopt EXTENDED_HISTORY


#動補完を有効にする
autoload -U compinit
compinit

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
%(?.%{$fg[green]%}.%{$fg[blue]%})%(?!(っ´∀｀)っ!(;・∀・%)<)%{${reset_color}%} "

#キーバインドemacs
bindkey -e

#エイリアス
alias rm='rm -i'
alias mkdir='mkdir -p'

alias ll='ls -la'

#sudoのあとのコマンドでエイリアスを有効
alias sudo='sudo '

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

# JAVA_HOME
if [ -f /usr/libexec/java_home ]; then
  export JAVA_HOME=`/usr/libexec/java_home -v 1.8`
fi


export PHP_ROOT="${HOME}/.phpenv"
if [ -d "${PHP_ROOT}" ]; then
    export PATH=${PHP_ROOT}/bin:$PATH
    eval "$(phpenv init - zsh)"
fi

### nodebrew
add_path_if_exists $HOME/.nodebrew/current/bin

add_path_if_exists $HOME/.local/bin

export XDG_DATA_HOME=/usr/local/share
if [ -f /usr/local/bin/plenv ]; then
    eval "$(plenv init -)"
fi

### golang ###
if [ -d "$HOME/dev" ]; then
    export GOPATH="$HOME/dev"
fi
add_path_if_exists $GOPATH/bin

### diff-highlight ###
add_path_if_exists /usr/local/share/git-core/contrib/diff-highlight

load_library $ZDOTDIR/peco.zsh

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/tanishiking/google-cloud-sdk/path.zsh.inc' ]; then source '/Users/tanishiking/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/tanishiking/google-cloud-sdk/completion.zsh.inc' ]; then source '/Users/tanishiking/google-cloud-sdk/completion.zsh.inc'; fi
