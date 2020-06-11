# https://github.com/sdispater/poetry/issues/571#issuecomment-470734363
# pyenv
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

# python poetry
export PATH="$HOME/.poetry/bin:$PATH"

[[ -s $HOME/.poetry/env ]] && source $HOME/.poetry/env
