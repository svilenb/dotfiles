# Svilen's dotfiles

## Git

```
git clone https://github.com/svilenb/dotfiles.git ~/dotfiles
```

Add global .gitignore

```
ln -sf ~/dotfiles/.cvsignore ~/.cvsignore
git config --global core.excludesFile ~/.cvsignore
```

## GNU Stow

Install [GNU Stow](https://www.gnu.org/software/stow/) if it's not available already. Create application symlinks.

```
cd ~/dotfiles && \
stow -vSt ~ vim && \
stow -vSt ~ tmux && \
stow -vSt ~ zsh
```

## Vim

Create a directory for Vim's temporary files

```
cd ~/dotfiles && \
mkdir vimfiles
```

Install with package manager or compile from source

```
cd ~/vim && \
make clean && \
make distclean && \
make && \
sudo make install
```

Install following vimscripts

* [minpac](https://github.com/k-takata/minpac)

## Z-Shell

Install [Oh My Zsh](https://github.com/robbyrussell/oh-my-zsh) framework.

## Tmux

Install [Tmux Plugin Manager](https://github.com/tmux-plugins/tpm).
Follow installation instructions for [tmux-yank](https://github.com/tmux-plugins/tmux-yank).

## TODO

* Enhance grep mapping
