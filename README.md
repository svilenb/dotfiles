# Svilen's dotfiles

Add global .gitignore

```
ln -sf ~/dotfiles/.cvsignore ~/.cvsignore
git config --global core.excludesFile ~/.cvsignore
```

Create application symlinks using GNU Stow

This is an example for Vim:

```
stow -vSt ~ vim
```

## Terminal

* Install the following [font](https://github.com/belluzj/fantasque-sans)

## Vim

Install following one of the following examples.

* https://vi.stackexchange.com/questions/10817/how-can-i-get-a-newer-version-of-vim-on-ubuntu
* https://github.com/Valloric/YouCompleteMe/wiki/Building-Vim-from-source
* http://www.vim.org/git.php

Follow installation instructions for [minpac](https://github.com/k-takata/minpac).
Install [The Silver Searcher](https://github.com/ggreer/the_silver_searcher)

## Neovim

Add support for --remote using [neovim-remote](https://github.com/mhinz/neovim-remote).
Follow installation instructions from [nvim-lsp](https://github.com/neovim/nvim-lsp) for tsserver, vimls, cssls, texlab.

## Z-Shell

Install [Oh My Zsh](https://github.com/robbyrussell/oh-my-zsh) framework.

## Tmux

Install [Tmux Plugin Manager](https://github.com/tmux-plugins/tpm).
Follow installation instructions for [tmux-yank](https://github.com/tmux-plugins/tmux-yank).

