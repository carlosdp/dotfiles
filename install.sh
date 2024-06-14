#!/usr/bin/env bash

DOTROOT="`pwd`"

ln -s $DOTROOT/.tmux.conf $HOME/.tmux.conf
rm $HOME/.zshrc
ln -s $DOTROOT/.zshrc $HOME/.zshrc
ln -s $DOTROOT/.oh-my-zsh $HOME/.oh-my-zsh
mkdir -p $HOME/.config
rm -rf $HOME/.config/fish
ln -s $DOTROOT/fish $HOME/.config/fish
ln -s $DOTROOT/.vim $HOME/.config/nvim
touch ~/.gitignore_global
git config --global core.excludesfile ~/.gitignore_global
if [ "$(uname)" != "Darwin" ]; then
	sudo apt update
	sudo apt install -y hub zsh-syntax-highlighting tmux ripgrep
  wget https://github.com/neovim/neovim/releases/download/v0.10.0/nvim.appimage -O ~/nvim.appimage
  cd ~/
  chmod u+x nvim.appimage
  ./nvim.appimage --appimage-extract
  cd -
fi
