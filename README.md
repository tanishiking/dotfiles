# dotfiles

## Structure
- `.zsh/` - Zsh configuration
- `.config/nvim/` - Neovim configuration (lazy.nvim)
- `.config/mise/` - mise tool manager configuration
- `.config/git/` - Git global ignore
- `.config/zed/` - Zed configuration

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

Tools: atuin, bat, coursier, delta, eza, fd, fzf, gh, ghq, gitui, helm, hugo, jq, kind, kubectl, neovim, node, ripgrep, scala-cli

## Zed Scala/Metals

Zed auto-installs the Scala extension (`zed-metals`) via `.config/zed/settings.json`.
Metals is installed by the mise postinstall hook with:

```bash
cs install metals
```

Custom install tasks:

```bash
mise run install-spin-canary
```

## Remaining brew packages

Some tools stay in Homebrew (installed via mise postinstall hook):

- binaryen, coreutils, findutils, git, gnu-time, htop, pure, tree, wget, zsh, zsh-async
