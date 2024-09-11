# Svilen's dotfiles

## Installation

```
git clone https://github.com/svilenb/dotfiles.git ~/dotfiles
```

## GNU Stow

Install [GNU Stow](https://www.gnu.org/software/stow/) if it's not available already. Create application symlinks.

```
cd ~/dotfiles && \
stow -vSt ~ scm && \
stow -vSt ~ vim && \
stow -vSt ~ vimfiles && \
stow -vSt ~ tmux && \
stow -vSt ~ zsh && \
stow -vSt ~ karabiner
```

## Git

Add global .gitignore

```
git config --global core.excludesFile ~/.cvsignore
```

Add default set of hooks for ctags. Set git alias for easier one-off re-index.

```
git config --global init.templatedir '~/.git_template'
git config --global alias.ctags '!.git/hooks/ctags'
```

## Z-Shell

Install [Oh My Zsh](https://github.com/robbyrussell/oh-my-zsh) framework.

## Tmux

Install [Tmux Plugin Manager](https://github.com/tmux-plugins/tpm).
Follow installation instructions for [tmux-yank](https://github.com/tmux-plugins/tmux-yank).

## Ctags

Follow instructions for [ctags-patterns-for-javascript](https://github.com/romainl/ctags-patterns-for-javascript).

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

## TODO

* Enhance grep mapping
