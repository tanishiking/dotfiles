if _command_exists peco; then
  function peco-history-selection() {
      BUFFER=`history -n 1 | tail -r  | awk '!a[$0]++' | peco`
      CURSOR=$#BUFFER
      zle reset-prompt
  }
  function _peco-ssh-select-host() {
    local host
    host=$(grep -iE '^host' ~/.ssh/config | awk '{print $2}' | peco)
    if [ "$host" != '' ]; then
      ssh $@ $host
    fi
  }
  alias ssh-peco=_peco-ssh-select-host

  zle -N peco-history-selection
  bindkey '^R' peco-history-selection
fi
