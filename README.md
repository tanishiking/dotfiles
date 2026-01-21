# dotfiles

## Structure
- `.zsh/` - Zsh configuration
- `.config/nvim/` - Neovim configuration (lazy.nvim)
- `.config/mise/` - mise tool manager configuration
- `.config/git/` - Git global ignore

## Setup

```bash
cd ~
git clone git@github.com:tanishiking/dotfiles.git
cd dotfiles
./install.sh
```

## Tools managed by mise

CLI tools are managed via [mise](https://mise.jdx.dev/):

```bash
brew install mise
mise install
```

Tools: atuin, bat, delta, eza, fzf, gh, ghq, gitui, hugo, jq, kind, kubectl, neovim

## Remaining brew packages

Some tools stay in Homebrew (installed via mise postinstall hook):

- binaryen, coreutils, findutils, git, gnu-time, htop, pure, tree, wget, zsh, zsh-async
