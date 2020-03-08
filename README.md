# Svilen's dotfiles

Configure by copy and paste the following into your terminal/shell:

```
ln -sf ~/dotfiles/.vimrc ~/.vimrc
ln -sf ~/dotfiles/.gvimrc ~/.gvimrc
ln -sf ~/dotfiles/.config/nvim/init.vim ~/.config/nvim/init.vim
ln -s ~/dotfiles/.config/nvim/lua ~/.config/nvim/lua
ln -s ~/dotfiles/.config/nvim/compiler ~/.config/nvim/compiler
ln -sf ~/dotfiles/.zshrc ~/.zshrc
ln -sf ~/dotfiles/.tmux.conf ~/.tmux.conf
ln -sf ~/dotfiles/.cvsignore ~/.cvsignore
git config --global core.excludesFile ~/.cvsignore
```

## Terminal

* Setup [Nord](https://www.nordtheme.com/) color scheme and install the following [font](https://github.com/belluzj/fantasque-sans)

## Vim

Install following one of the following examples.

* https://vi.stackexchange.com/questions/10817/how-can-i-get-a-newer-version-of-vim-on-ubuntu
* https://github.com/Valloric/YouCompleteMe/wiki/Building-Vim-from-source
* http://www.vim.org/git.php

Install [The Silver Searcher](https://github.com/ggreer/the_silver_searcher).
Follow installation instructions for [vim-plug](https://github.com/junegunn/vim-plug).

## Neovim

Add support for --remote using [neovim-remote](https://github.com/mhinz/neovim-remote).
Follow installation instructions from [nvim-lsp](https://github.com/neovim/nvim-lsp) for tsserver, vimls, cssls, texlab.

## Z-Shell

Install [Oh My Zsh](https://github.com/robbyrussell/oh-my-zsh) framework.

## Tmux

Install [Tmux Plugin Manager](https://github.com/tmux-plugins/tpm).
Follow installation instructions for [tmux-yank](https://github.com/tmux-plugins/tmux-yank).

Solve the issue with colors when vim is opened inside tmux using the following [link](http://sunaku.github.io/tmux-24bit-color.html#usage)
