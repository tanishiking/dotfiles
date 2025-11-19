# nvm
# upgrade: https://github.com/nvm-sh/nvm?tab=readme-ov-file#install--update-script
#
# ref: https://chocoby.com/blog/2021/05/05/speed-up-zsh-startup-time/
function load-nvm () {
  export NVM_DIR="$HOME/.config/nvm"
  [ -s $NVM_DIR/nvm.sh ] && \. "$NVM_DIR/nvm.sh"
}

load-nvmrc() {
  if [[ -f .nvmrc && -r .nvmrc ]]; then

    if ! type nvm >/dev/null; then
      load-nvm
    fi

    nvm use
  fi
}
autoload -Uz add-zsh-hook
add-zsh-hook chpwd load-nvmrc

