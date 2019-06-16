# Svilen's dotfiles

## Terminal

* Setup nord color scheme
* Use the following [font](https://github.com/belluzj/fantasque-sans)

## Neovim

```
ln -sf ~/dotfiles/.vimrc ~/.config/nvim/init.vim
ln -sf ~/dotfiles/.gvimrc ~/.config/nvim/ginit.vim
ln -s ~/dotfiles/.vim/pack ~/.local/share/nvim/site/pack
```

### Install [neovim-remote](https://github.com/mhinz/neovim-remote)

## Vim

```
ln -sf ~/dotfiles/.vimrc ~/.vimrc
ln -sf ~/dotfiles/.gvimrc ~/.gvimrc
ln -s ~/dotfiles/.vim/pack ~/.vim/pack
```

### Plugins with installation instructions:

* [fzf.vim](https://github.com/junegunn/fzf.vim)
  * install fd
* [ACK.VIM](https://github.com/mileszs/ack.vim)
  * install ack
  * install silver searcher
* [YouCompleteMe](https://github.com/valloric/youcompleteme)

## Z-Shell

### Install [Oh My Zsh](https://github.com/robbyrussell/oh-my-zsh)

### Install [Powerline Fonts](https://github.com/powerline/fonts)

## Tmux

### Install [Tmux Plugin Manager](https://github.com/tmux-plugins/tpm)

### Plugins with installation instructions:

* tmux-yank

### Solve the issue with colors when vim is opened inside tmux using the following [link](http://sunaku.github.io/tmux-24bit-color.html#usage)

## Use repository configs

```
ln -sf ~/dotfiles/.zshrc ~/.zshrc
ln -sf ~/dotfiles/.tmux.conf ~/.tmux.conf
ln -sf ~/dotfiles/.gitignore_global ~/.gitignore_global
git config --global core.excludesFile ~/.gitignore_global
```
