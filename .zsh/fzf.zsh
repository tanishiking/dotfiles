export FZF_DEFAULT_OPTS='--height 50% --reverse --border --inline-info --tac'

if which fzf >/dev/null; then
  function _fzf-ssh-select-host() {
    local host
    host=$(grep -iE '^host' ~/.ssh/config | awk '{print $2}' | fzf)
    if [ "$host" != '' ]; then
      ssh $@ $host
    fi
  }
  alias ssh-fzf=_fzf-ssh-select-host

  if which ghq >/dev/null; then
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
