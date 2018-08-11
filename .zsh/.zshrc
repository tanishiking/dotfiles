# .zshrc

alias vim="nvim"

export LANG=en_US.utf-8
export LC_ALL=en_US.utf-8
export LANGUAGE=en_US.utf-8

function add_path_if_exists() {
    if [ -d "$1" ]; then
        export PATH="$1:$PATH"
    fi
}

function load_library() {
    if [ -f $1 ]; then
        source $1
    fi
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

if which gsed 2>/dev/null; then
  alias sed='gsed'
fi
if which gtac 2>/dev/null; then
  alias tac='gtac'
fi
if which gawk 2>/dev/null; then
  alias awk='gawk'
fi

# for homebrew
add_path_if_exists /usr/local/bin
add_path_if_exists /usr/local/sbin

if [ -f /usr/local/bin/rbenv ]; then
	eval "$(rbenv init -)"
fi

## jenv
if which jenv > /dev/null; then
  export JENV_ROOT=/usr/local/var/jenv
  eval "$(jenv init -)"
fi


export PHP_ROOT="${HOME}/.phpenv"
if [ -d "${PHP_ROOT}" ]; then
    export PATH=${PHP_ROOT}/bin:$PATH
    eval "$(phpenv init - zsh)"
fi

### nodenv
if [ -f /usr/local/bin/nodenv ]; then
    eval "$(nodenv init -)"
fi

add_path_if_exists $HOME/.local/bin

export XDG_CONFIG_HOME=$HOME/.config
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

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/tanishiking/google-cloud-sdk/path.zsh.inc' ]; then source '/Users/tanishiking/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/tanishiking/google-cloud-sdk/completion.zsh.inc' ]; then source '/Users/tanishiking/google-cloud-sdk/completion.zsh.inc'; fi

add_path_if_exists $HOME/android-adk-macosx/platform-tools

load_library $ZDOTDIR/peco.zsh
