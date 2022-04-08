#!/usr/bin/env bash

DOTROOT="`pwd`"

ln -s $DOTROOT/.vimrc $HOME/.vimrc
ln -s $DOTROOT/.vimrc $DOTROOT/.vim/init.vim
ln -s $DOTROOT/.vim $HOME/.vim
ln -s $DOTROOT/.tmux.conf $HOME/.tmux.conf
mkdir -p $HOME/.config
rm -rf $HOME/.config/fish
ln -s $DOTROOT/fish $HOME/.config/fish
ln -s $DOTROOT/.vim $HOME/.config/nvim
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
touch ~/.gitignore_global
git config --global core.excludesfile ~/.gitignore_global
if [ "$(uname)" != "Darwin" ]; then
	sudo apt update
	sudo apt install -y hub zsh-syntax-highlighting tmux ripgrep
  wget https://github.com/neovim/neovim/releases/download/v0.5.0/nvim.appimage -O ~/nvim.appimage
  cd ~/
  chmod u+x nvim.appimage
  ./nvim.appimage --appimage-extract
  cd -
fi
~/squashfs-root/usr/bin/nvim --headless +PlugInstall +qa
~/squashfs-root/usr/bin/nvim --headless -c "CocInstall coc-tsserver" +qa
