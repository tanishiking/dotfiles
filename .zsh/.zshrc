alias vim="nvim"
alias bazel="bazelisk"

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

alias rm='rm -i'

alias ll='ls -la'


add_path_if_exists /opt/homebrew/bin
add_path_if_exists /usr/local/opt/gnu-sed/libexec/gnubin

add_path_if_exists /opt/homebrew/opt/binutils/bin
add_path_if_exists /usr/local/opt/binutils/bin
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
# if [ -d "$HOME/.jabba" ]; then
#     export JABBA_HOME="$HOME/.jabba"
# fi
# [ -s "$JABBA_HOME/jabba.sh" ] && source "$JABBA_HOME/jabba.sh"

# pyenv
## git clone https://github.com/pyenv/pyenv.git ~/.pyenv
## git clone https://github.com/pyenv/pyenv-virtualenv.git $(pyenv root)/plugins/pyenv-virtualenv
if [ -d "$HOME/.pyenv" ]; then
  export PYENV_ROOT="$HOME/.pyenv"
fi
add_path_if_exists $PYENV_ROOT/bin
add_path_if_exists $HOME/.poetry/bin
if which pyenv 2>/dev/null; then
  eval "$(pyenv init -)"
  eval "$(pyenv virtualenv-init -)"
  # for https://github.com/pyenv/pyenv/issues/1737
  export LDFLAGS="-L/usr/local/opt/zlib/lib -L/usr/local/opt/bzip2/lib"
  export CPPFLAGS="-I/usr/local/opt/zlib/include -I/usr/local/opt/bzip2/include"
fi


# nvm
# upgrade: https://github.com/nvm-sh/nvm?tab=readme-ov-file#install--update-script
export NVM_DIR="$HOME/.config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

add_path_if_exists $HOME/.local/bin

export XDG_CONFIG_HOME=$HOME/.config
if [ -f /usr/local/bin/plenv ]; then
    eval "$(plenv init -)"
fi

if which opam > /dev/null; then
  eval $(opam env)
fi


## cargo
if [ -d "$HOME/.cargo" ]; then
   source $HOME/.cargo/env
fi
add_path_if_exists $HOME/.cargo/bij

### golang ###
if [ -d "$HOME/src" ]; then
    export GOPATH="$HOME/src"
fi
add_path_if_exists $GOPATH/bin
export GO111MODULE=on

### scala-cli ###
if which scala-cli > /dev/null; then
  eval "$(scala-cli install completions --env --shell zsh)"
fi

### kubernetes ###
if which kubectl 2>/dev/null; then
  eval "$(kubectl completion zsh)"
fi

### diff-highlight ###
add_path_if_exists /usr/local/share/git-core/contrib/diff-highlight

### couriser
export PATH="$PATH:/Users/tanishiking/Library/Application Support/Coursier/bin"

add_path_if_exists $HOME/src/github.com/graalvm/mx

## mysql
add_path_if_exists /usr/local/opt/mysql-client/bin

## LLVM
add_path_if_exists /opt/homebrew/opt/llvm@14/bin

# vcpkg
# git clone git clone https://github.com/Microsoft/vcpkg.git at HOME
# and ./vcpkg/bootstrap-vcpkg.sh
add_path_if_exists $HOME/vcpkg

# misc
add_path_if_exists $HOME/bin


# The next line updates PATH for the Google Cloud SDK.
if [ -f "$HOME/google-cloud-sdk/path.zsh.inc" ]; then source "$HOME/google-cloud-sdk/path.zsh.inc"; fi

# The next line enables shell command completion for gcloud.
if [ -f "$HOME/google-cloud-sdk/completion.zsh.inc" ]; then source "$HOME/google-cloud-sdk/completion.zsh.inc"; fi

# GPG
export GPG_TTY=$(tty)
if which gpgconf 2>/dev/null; then
  gpgconf --launch gpg-agent
fi

# wasmtime
export WASMTIME_HOME="$HOME/.wasmtime"
add_path_if_exists $WASMTIME_HOME/bin

# deno
if which deno 2>/dev/null; then
  # deno completions zsh > $ZDOTDIR/_deno.zsh
  load_library $ZDOTDIR/_deno.zsh
fi

load_library $ZDOTDIR/fzf.zsh

