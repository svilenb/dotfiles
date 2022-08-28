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

```
make clean
make distclean

./configure \
	--with-features=huge \
	--enable-multibyte \
	--enable-luainterp=yes \
	--enable-python3interp=yes \
	--with-python3-config-dir=/usr/lib/python3.9/config-3.8-x86_64-linux-gnu \
	--disable-gui \
	--enable-cscope \
	--prefix=/usr/local

make VIMRUNTIMEDIR=/usr/local/share/vim/vim82

sudo make install
```

Install following vimscripts

* [minpac](https://github.com/k-takata/minpac)
* [pathogen.vim](https://github.com/tpope/vim-pathogen)

## Z-Shell

Install [Oh My Zsh](https://github.com/robbyrussell/oh-my-zsh) framework.

## Tmux

Install [Tmux Plugin Manager](https://github.com/tmux-plugins/tpm).
Follow installation instructions for [tmux-yank](https://github.com/tmux-plugins/tmux-yank).

## Searching Tools

Install [The Silver Searcher](https://github.com/ggreer/the_silver_searcher)
