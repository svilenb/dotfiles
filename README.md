# Svilen's dotfiles

## Terminal

* Color scheme
 * [Gnome Terminal](https://github.com/Mayccoll/Gogh)
 * [Other](https://github.com/morhetz/gruvbox-contrib)
* [Font](https://github.com/belluzj/fantasque-sans)

## Neovim

### Install vim-plug

### Plugins with installation instructions:

* fzf
 * install fd
 * install silver searcher
* editorconfig-vim
* ale
 * install prettier

## Tmux

### Install Tmux Plugin Manager

### Plugins with installation instructions:

* tmux-yank

### [Colors](http://sunaku.github.io/tmux-24bit-color.html#usage)

## Use repository configs

### Create symbolic links

* ```ln -sf ~/dotfiles/.tmux.conf ~/.tmux.conf```
* ```ln -sf ~/dotfiles/init.vim ~/.config/nvim/init.vim```
* ```ln -sf ~/dotfiles/.gitignore_global ~/.gitignore_global```

### Setup global .gitignore 

```$ git config --global core.excludesFile ~/.gitignore_global```
