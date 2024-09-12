decode_base64() {
  if base64 -d >/dev/null 2>&1; then
    # gnu
    cat - | base64 -d
  else
    # bsd
    cat - | base64 -D
  fi
}

export FZF_DEFAULT_OPTS='--height 50% --reverse --border --inline-info --tac'


if which fzf 2>/dev/null; then
  function fzf-history-selection() {
      BUFFER=`history -n 1 | awk '!a[$0]++' | fzf`
      CURSOR=$#BUFFER
      zle reset-prompt
  }
  function _fzf-ssh-select-host() {
    local host
    host=$(grep -iE '^host' ~/.ssh/config | awk '{print $2}' | fzf)
    if [ "$host" != '' ]; then
      ssh $@ $host
    fi
  }
  alias ssh-fzf=_fzf-ssh-select-host

  # zle -N fzf-history-selection
  # bindkey '^R' fzf-history-selection

  if which ghq 2>/dev/null; then
    bindkey '^]' fzf-src
    function fzf-src() {
      local src=$(ghq list --full-path | fzf --query "$LBUFFER")
      if [ -n "$src" ]; then
        BUFFER="cd $src"
        zle accept-line
      fi
      zle -R -c
    }
    zle -N fzf-src
  fi
fi
