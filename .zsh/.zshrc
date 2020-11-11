# .zshrc

alias vim="nvim"

autoload -U compinit
fpath=($HOME/.bloop/zsh $fpath)
compinit

export LANG=en_US.utf-8
export LC_ALL=en_US.utf-8
export LANGUAGE=en_US.utf-8

# export AWS_DEFAULT_PROFILE='hatena'

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

# starship
# https://starship.rs/
if which starship > /dev/null; then
  eval "$(starship init zsh)"
fi


#キーバインドemacs
bindkey -e

#エイリアス
alias rm='rm -i'

alias ll='ls -la'

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

# Linux
add_path_if_exists $HOME/.rbenv/bin
if which rbenv > /dev/null; then
	eval "$(rbenv init -)"
fi

## jenv
if which jenv > /dev/null; then
  export JENV_ROOT=/usr/local/var/jenv
  eval "$(jenv init -)"
  export JAVA_HOME="$JENV_ROOT/versions/`jenv version-name`"
fi

## jabba
[ -s "$JABBA_HOME/jabba.sh" ] && source "$JABBA_HOME/jabba.sh"

# nodenv
## Linux
## git clone https://github.com/nodenv/nodenv.git ~/.nodenv
add_path_if_exists $HOME/.nodenv/bin
## OSX
if which nodenv > /dev/null; then
  eval "$(nodenv init -)"
fi

add_path_if_exists $HOME/.local/bin

export XDG_CONFIG_HOME=$HOME/.config
if [ -f /usr/local/bin/plenv ]; then
    eval "$(plenv init -)"
fi

### golang ###
if [ -d "$HOME/src" ]; then
    export GOPATH="$HOME/src"
fi
add_path_if_exists $GOPATH/bin
export GO111MODULE=on

### kubernetes ###
if which kubectl 2>/dev/null; then
  eval "$(kubectl completion zsh)"
fi

### diff-highlight ###
add_path_if_exists /usr/local/share/git-core/contrib/diff-highlight

if which aws_zsh_completer.sh 2>/dev/null; then
  source aws_zsh_completer.sh
fi

### awscli
add_path_if_exists ~/Library/Python/3.7/bin


# The next line updates PATH for the Google Cloud SDK.
if [ -f "$HOME/google-cloud-sdk/path.zsh.inc" ]; then source "$HOME/google-cloud-sdk/path.zsh.inc"; fi

# The next line enables shell command completion for gcloud.
if [ -f "$HOME/google-cloud-sdk/completion.zsh.inc" ]; then source "$HOME/google-cloud-sdk/completion.zsh.inc"; fi



# scalameta
# if which coursier 2>/dev/null; then
#   alias metac="coursier launch org.scalameta:metac_2.12.8:4.1.9 -- -cp $(coursier fetch -p org.scala-lang:scala-library:2.12.8)"
#   alias metap="coursier launch  -M scala.meta.cli.Metap org.scalameta:scalameta_2.11:4.1.9 --"
# fi

load_library $ZDOTDIR/peco.zsh
