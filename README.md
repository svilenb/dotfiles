# Svilen's dotfiles

## Terminal

* Setup nord color scheme
* Use the following [font](https://github.com/belluzj/fantasque-sans)

## Neovim

### Install [neovim-remote](https://github.com/mhinz/neovim-remote)

### Configure

```
ln -sf ~/dotfiles/.vimrc ~/.config/nvim/init.vim
ln -sf ~/dotfiles/.gvimrc ~/.config/nvim/ginit.vim
ln -s ~/dotfiles/.vim/pack ~/.local/share/nvim/site/pack
```

## Vim

### Installation tips

* https://vi.stackexchange.com/questions/10817/how-can-i-get-a-newer-version-of-vim-on-ubuntu
* https://github.com/Valloric/YouCompleteMe/wiki/Building-Vim-from-source
* http://www.vim.org/git.php

### Configure

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
ln -sf ~/dotfiles/.cvsignore ~/.cvsignore
git config --global core.excludesFile ~/.cvsignore
```
