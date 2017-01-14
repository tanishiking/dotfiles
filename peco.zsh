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

  function connpass() {
    local CONNPASS_API_URL='https://connpass.com/api/v1/event/'
    local CONNPASS_EVENT_URL='http://connpass.com/event/'
    local keyword=""
    for i in `seq 1 ${#}`; do
      if [ $i -eq 1 ];then
        keyword="${1}"
      else
        keyword="${keyword},${1}"
      fi
      shift
    done
    local event_id=$(curl "$CONNPASS_API_URL?keyword=$keyword" 2> /dev/null | jq -r '.events[] | "\(.event_id) \(.started_at) \(.title)"' | peco | awk '{print $1}')
    if [ "$event_id" != '' ]; then
      open "$CONNPASS_EVENT_URL/$event_id"
    fi
  }

  if _command_exists ghq; then
    bindkey '^]' peco-src
    function peco-src() {
      local src=$(ghq list --full-path | peco --query "$LBUFFER")
      if [ -n "$src" ]; then
        BUFFER="cd $src"
        zle accept-line
      fi
      zle -R -c
    }
    zle -N peco-src
  fi
fi
