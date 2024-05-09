# Svilen's dotfiles

## Installation

```
git clone https://github.com/svilenb/dotfiles.git ~/dotfiles
```

## GNU Stow

Install [GNU Stow](https://www.gnu.org/software/stow/) if it's not available already. Create application symlinks.

```
cd ~/dotfiles && \
stow -vSt ~ vim && \
stow -vSt ~ vimfiles && \
stow -vSt ~ tmux && \
stow -vSt ~ scm && \
stow -vSt ~ zsh
```

## Git

Add global .gitignore

```
git config --global core.excludesFile ~/.cvsignore
```

## Vim

Create a directory for Vim's temporary files

```
cd ~/dotfiles && \
mkdir -p vimfiles/.backup vimfiles/.swp vimfiles/.undo
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
