#!/usr/bin/env bash

DOTROOT="`pwd`"

ln -s $DOTROOT/.vimrc $HOME/.vimrc
ln -s $DOTROOT/.vimrc $DOTROOT/.vim/init.vim
ln -s $DOTROOT/.vim $HOME/.vim
ln -s $DOTROOT/.tmux.conf $HOME/.tmux.conf
rm $HOME/.zshrc
ln -s $DOTROOT/.zshrc $HOME/.zshrc
ln -s $DOTROOT/.oh-my-zsh $HOME/.oh-my-zsh
mkdir -p $HOME/.config
ln -s $DOTROOT/.vim $HOME/.config/nvim
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
touch ~/.gitignore_global
git config --global core.excludesfile ~/.gitignore_global
if [ "$(uname)" != "Darwin" ]; then
	sudo apt update
	sudo apt install -y hub zsh-syntax-highlighting tmux ripgrep
  wget https://github.com/neovim/neovim/releases/download/v0.5.0/nvim.appimage ~/nvim.appimage
  chmod u+x ~/nvim.appimage
  ~/nvim.appimage --appimage-extract
fi
nvim --headless +PlugInstall +qa
nvim --headless -c "CocInstall coc-tsserver" +qa
