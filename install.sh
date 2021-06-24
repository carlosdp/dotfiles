#!/usr/bin/env bash

DOTROOT="`pwd`"

ln -s $DOTROOT/.vimrc $HOME/.vimrc
ln -s $DOTROOT/.vimrc $DOTROOT/.vim/init.vim
ln -s $DOTROOT/.vim $HOME/.vim
ln -s $DOTROOT/.tmux.conf $HOME/.tmux.conf
ln -s $DOTROOT/.zshrc $HOME/.zshrc
ln -s $DOTROOT/.oh-my-zsh $HOME/.oh-my-zsh
mkdir -p $HOME/.config
ln -s $DOTROOT/.vim $HOME/.config/nvim
# git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
touch ~/.gitignore_global
git config --global core.excludesfile ~/.gitignore_global
sudo apt update
sudo apt install -y hub zsh-syntax-highlighting neovim
nvim --headless +PlugInstall +qa
