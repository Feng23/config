#!/bin/sh

set -eu

PWD=`pwd`

#vim
mv ~/.vim ~/.vim.old || true
mv ~/.vimrc ~/.vimrc.old || true
ln -s  $PWD/vim ~/.vim
ln -s $PWD/vimrc ~/.vimrc
ls -la ~|grep .vim
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
