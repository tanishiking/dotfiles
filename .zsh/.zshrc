typeset -U PATH path
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

export HISTFILE=${HOME}/.zsh_history
export HISTSIZE=100000
export SAVEHIST=100000
setopt hist_ignore_dups
setopt share_history
setopt EXTENDED_HISTORY

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

#キーバインドemacs
bindkey -e

alias rm='rm -i'

alias ll='ls -la'

add_path_if_exists /opt/homebrew/bin
add_path_if_exists /usr/local/opt/gnu-sed/libexec/gnubin

add_path_if_exists /opt/homebrew/opt/binutils/bin
add_path_if_exists /usr/local/opt/binutils/bin
if which gtac >/dev/null; then
  alias tac='gtac'
fi
if which gawk >/dev/null; then
  alias awk='gawk'
fi

# for homebrew
add_path_if_exists /usr/local/bin
add_path_if_exists /usr/local/sbin
add_path_if_exists $HOME/.local/bin

if which opam > /dev/null; then
  eval $(opam env)
fi

## cargo
if [ -d "$HOME/.cargo" ]; then
   source $HOME/.cargo/env
fi
add_path_if_exists $HOME/.cargo/bij

### scala-cli ###
if which scala-cli > /dev/null; then
  eval "$(scala-cli install completions --env --shell zsh)"
fi

### kubernetes ###
if which kubectl >/dev/null; then
  eval "$(kubectl completion zsh)"
fi

## LLVM
add_path_if_exists /opt/homebrew/opt/llvm@19/bin

# misc
add_path_if_exists $HOME/bin

# GPG
export GPG_TTY=$(tty)
if which gpgconf >/dev/null; then
  gpgconf --launch gpg-agent
fi

# wasmtime
export WASMTIME_HOME="$HOME/.wasmtime"
add_path_if_exists $WASMTIME_HOME/bin

# moonbit
add_path_if_exists "$HOME/.moon/bin"

if which atuin >/dev/null; then
  eval "$(atuin init zsh --disable-up-arrow)"
fi

fpath+=("$(brew --prefix)/share/zsh/site-functions")
autoload -U promptinit; promptinit
prompt pure

load_library $ZDOTDIR/fzf.zsh
load_library $ZDOTDIR/nvm.zsh

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
