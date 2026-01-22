typeset -U PATH path

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

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
setopt correct

autoload -U colors; colors
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

bindkey -e

alias rm='rm -i'

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

add_path_if_exists /usr/local/bin
add_path_if_exists /usr/local/sbin
add_path_if_exists $HOME/.local/bin

# Activate mise early so tools like atuin, ghq, fzf are available
if which mise >/dev/null; then
  eval "$(mise activate zsh)"
fi

if which opam > /dev/null; then
  eval $(opam env)
fi

if [ -d "$HOME/.cargo" ]; then
   source $HOME/.cargo/env
fi
add_path_if_exists $HOME/.cargo/bin

if which scala-cli > /dev/null; then
  eval "$(scala-cli install completions --env --shell zsh)"
fi

if which kubectl >/dev/null; then
  eval "$(kubectl completion zsh)"
fi

add_path_if_exists /opt/homebrew/opt/llvm@19/bin
add_path_if_exists $HOME/bin

export GPG_TTY=$(tty)
if which gpgconf >/dev/null; then
  gpgconf --launch gpg-agent
fi

export WASMTIME_HOME="$HOME/.wasmtime"
add_path_if_exists $WASMTIME_HOME/bin

add_path_if_exists "$HOME/.moon/bin"

if which atuin >/dev/null; then
  eval "$(atuin init zsh --disable-up-arrow)"
fi

fpath+=("$(brew --prefix)/share/zsh/site-functions")
autoload -U promptinit; promptinit
prompt pure

load_library $ZDOTDIR/fzf.zsh

export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
