#!/bin/sh

# used on my linux pc

set -eu

PWD=`pwd`

#vim
mv ~/.vimrc ~/.vimrc.old || true
ln -s $PWD/vimrc ~/.vimrc
#vim bundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

#zsh
mv ~/.zshrc ~/.zshrc.old || true
ln -s $PWD/zshrc ~/.zshrc

#git
mv ~/.gitconfig ~/.gitconfig.old || true
ln -s $PWD/gitconfig ~/.gitconfig

#bin
ln $PWD/bin ~/bin

#dropbox
wget "https://www.dropbox.com/download?dl=packages/dropbox.py" -O bin/dropbox
chmod +x bin/dropbox
