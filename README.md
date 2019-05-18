# Svilen's dotfiles

## Terminal

* Setup nord color scheme
* Use the following [font](https://github.com/belluzj/fantasque-sans)

## Neovim

### Install [neovim-remote](https://github.com/mhinz/neovim-remote)

### Install vim-plug

### Plugins with installation instructions:

* fzf
  * install fd
  * install silver searcher
* editorconfig-vim

## Z-Shell

### Install [Oh My Zsh](https://github.com/robbyrussell/oh-my-zsh)

### Install [Powerline Fonts](https://github.com/powerline/fonts)

## Tmux

### Install Tmux Plugin Manager

### Plugins with installation instructions:

* tmux-yank

### Solve the issue with colors when vim is opened inside tmux using the following [link](http://sunaku.github.io/tmux-24bit-color.html#usage)

## Use repository configs

* ```ln -sf ~/dotfiles/.zshrc ~/.zshrc```
* ```ln -sf ~/dotfiles/.tmux.conf ~/.tmux.conf```
* ```ln -sf ~/dotfiles/init.vim ~/.config/nvim/init.vim```
* ```ln -sf ~/dotfiles/.gitignore_global ~/.gitignore_global```
* ```git config --global core.excludesFile ~/.gitignore_global```
