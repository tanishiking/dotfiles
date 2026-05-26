typeset -U PATH path fpath

function add_path_if_exists() {
    if [ -d "$1" ]; then
        export PATH="$1:$PATH"
    fi
}

function load_library() {
    if [ -f "$1" ]; then
        source "$1"
    fi
}

for zsh_site_functions_dir in \
  /opt/homebrew/share/zsh/site-functions \
  /usr/local/share/zsh/site-functions \
  "$HOME/Library/Application Support/ScalaCli/completions/zsh"; do
  if [ -d "$zsh_site_functions_dir" ]; then
    fpath+=("$zsh_site_functions_dir")
  fi
done
unset zsh_site_functions_dir

export HISTFILE=${HOME}/.zsh_history
export HISTSIZE=100000
export SAVEHIST=100000
setopt hist_ignore_dups
setopt share_history
setopt EXTENDED_HISTORY

autoload -Uz compinit
_zcompdump="${ZDOTDIR:-$HOME}/.zcompdump"
if [[ ! -s "$_zcompdump" || "$_zcompdump" -ot "${ZDOTDIR:-$HOME}/.zshrc" ]]; then
  compinit -d "$_zcompdump"
else
  compinit -C -d "$_zcompdump"
fi
unset _zcompdump

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

if command -v gtac &>/dev/null; then
  alias tac='gtac'
fi
if command -v gawk &>/dev/null; then
  alias awk='gawk'
fi

add_path_if_exists /usr/local/bin
add_path_if_exists /usr/local/sbin
# For installing v8 on Mac
# https://gist.github.com/kevincennis/0cd2138c78a07412ef21
add_path_if_exists $HOME/depot_tools
add_path_if_exists $HOME/.local/bin

if [ -z "$JAVA_HOME" ] && [ -d "$HOME/.sdkman/candidates/java/current" ]; then
  export JAVA_HOME="$HOME/.sdkman/candidates/java/current"
fi
[ -n "$JAVA_HOME" ] && add_path_if_exists "$JAVA_HOME/bin"

# Use mise shims directly. `mise activate zsh` installs a chpwd hook, which makes
# every `cd` wait for `mise hook-env`.
add_path_if_exists "$HOME/.local/share/mise/shims"

export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"
export LANG="${LANG:-en_US.UTF-8}"
export LC_ALL="${LC_ALL:-en_US.UTF-8}"
export LANGUAGE="${LANGUAGE:-en_US.UTF-8}"
export EDITOR="${EDITOR:-nvim}"
export BAT_THEME="${BAT_THEME:-ansi}"

if command -v nvim &>/dev/null; then
  alias vi='nvim'
  alias vim='nvim'
fi
if command -v eza &>/dev/null; then
  alias ls='eza'
  alias ll='eza -l -g --icons --git -a'
  alias la='eza -l -g --icons --git -a'
  alias lt='eza --tree --icons --git-ignore'
fi
if command -v bat &>/dev/null; then
  alias cat='bat'
fi
if command -v rg &>/dev/null; then
  alias grep='rg'
fi

if command -v opam &>/dev/null; then
  eval "$(opam env)"
fi

if [ -f "$HOME/.cargo/env" ]; then
  source "$HOME/.cargo/env"
fi

_zsh_cache_completion() {
  local cache_file="$1"
  shift
  local command_path="${commands[$1]}"

  if [[ -r "$cache_file" ]]; then
    source "$cache_file"
  fi

  if [[ -n "$command_path" && ( ! -r "$cache_file" || "$cache_file" -ot "$command_path" ) ]]; then
    local cache_tmp="${cache_file}.${RANDOM}.tmp"
    (
      mkdir -p "${cache_file:h}" &&
        "$@" >| "$cache_tmp" &&
        mv "$cache_tmp" "$cache_file"
    ) &!
  fi
}

_zsh_completion_cache_dir="${XDG_CACHE_HOME:-$HOME/.cache}/zsh/completions"
_zsh_cache_completion "$_zsh_completion_cache_dir/kubectl.zsh" kubectl completion zsh
unset _zsh_completion_cache_dir
unfunction _zsh_cache_completion

if command -v scala-cli &>/dev/null; then
  _zsh_scala_cli_completion_stamp="${XDG_CACHE_HOME:-$HOME/.cache}/zsh/scala-cli-completion.stamp"
  if [[ ! -r "$_zsh_scala_cli_completion_stamp" || "$_zsh_scala_cli_completion_stamp" -ot "${commands[scala-cli]}" ]]; then
    (
      scala-cli install completions --env --shell zsh >/dev/null &&
        mkdir -p "${_zsh_scala_cli_completion_stamp:h}" &&
        : >| "$_zsh_scala_cli_completion_stamp"
    ) &!
  fi
  unset _zsh_scala_cli_completion_stamp
fi

add_path_if_exists /opt/homebrew/opt/llvm@19/bin
add_path_if_exists $HOME/bin
export HOLDIR="$HOME/ghq/github.com/HOL-Theorem-Prover/HOL"
add_path_if_exists $HOLDIR/bin

[[ -n "$TTY" ]] && export GPG_TTY="$TTY"
if command -v gpgconf &>/dev/null; then
  gpgconf --launch gpg-agent &>/dev/null &!
fi

export WASMTIME_HOME="$HOME/.wasmtime"
add_path_if_exists $WASMTIME_HOME/bin

add_path_if_exists "$HOME/.moon/bin"

_zsh_atuin_uuid() {
  printf '%08x-%04x-4%03x-%04x-%04x%04x%04x\n' \
    $(( EPOCHSECONDS & 0xffffffff )) \
    $RANDOM \
    $(( RANDOM & 0x0fff )) \
    $(( (RANDOM & 0x3fff) | 0x8000 )) \
    $RANDOM \
    $RANDOM \
    $RANDOM
}

if command -v atuin &>/dev/null; then
  _zsh_atuin_cache="${XDG_CACHE_HOME:-$HOME/.cache}/zsh/atuin.zsh"
  if [[ -r "$_zsh_atuin_cache" ]]; then
    source "$_zsh_atuin_cache"
  fi

  if [[ ! -r "$_zsh_atuin_cache" || "$_zsh_atuin_cache" -ot "${commands[atuin]}" ]]; then
    _zsh_atuin_tmp="${_zsh_atuin_cache}.${RANDOM}.tmp"
    (
      mkdir -p "${_zsh_atuin_cache:h}" &&
        atuin init zsh --disable-up-arrow |
          sed 's|^export ATUIN_SESSION=$(atuin uuid)$|export ATUIN_SESSION="${ATUIN_SESSION:-$(_zsh_atuin_uuid)}"|' >| "$_zsh_atuin_tmp" &&
        mv "$_zsh_atuin_tmp" "$_zsh_atuin_cache"
    ) &!
  fi
  unset _zsh_atuin_cache _zsh_atuin_tmp
fi

autoload -U promptinit; promptinit
prompt pure

load_library $ZDOTDIR/fzf.zsh

export SDKMAN_DIR="$HOME/.sdkman"
sdk() {
  [[ -s "$SDKMAN_DIR/bin/sdkman-init.sh" ]] || return 127
  unset -f sdk
  source "$SDKMAN_DIR/bin/sdkman-init.sh"
  sdk "$@"
}
