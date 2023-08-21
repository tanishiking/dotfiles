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

  zle -N fzf-history-selection
  bindkey '^R' fzf-history-selection

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
    local event_id=$(curl "$CONNPASS_API_URL?keyword=$keyword" 2> /dev/null | jq -r '.events[] | "\(.event_id) \(.started_at) \(.title)"' | fzf | awk '{print $1}')
    if [ "$event_id" != '' ]; then
      open "$CONNPASS_EVENT_URL/$event_id"
    fi
  }

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

  if which git 2>/dev/null; then
    function git-grep-edit() {
      local src=$(git grep -n $1 | fzf | awk -F: '{print "+" $2 " " $1}')
      if [ -n "$src" ]; then
        eval "$EDITOR $src"
      fi
    }
  fi

  if which gh 2>/dev/null; then
    # https://twitter.com/elijahmanor/status/1559525388417503233
    function ghpr() {
      GH_FORCE_TTY=100% gh pr list | fzf --ansi --preview 'GH_FORCE_TTY=100% gh pr view {1}' --preview-window down --header-lines 3 | awk '{print $1}' | xargs gh pr checkout
    }
  fi

  local TODOIST_FZF=$(brew --prefix)/share/zsh/site-functions/_todoist_fzf
  if [ ! -f $TODOIST_FZF ]; then
    source $TODOIST_FZF
  fi
  alias todo="todoist --color list"
fi
