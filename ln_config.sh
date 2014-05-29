#!/bin/sh

set -eu

PWD=`pwd`

#vim
mv ~/.vim ~/.vim.old || true
mv ~/.vimrc ~/.vimrc.old || true
ln -s  $PWD/vim ~/.vim
ln -s $PWD/vimrc ~/.vimrc
ls -la ~|grep .vim

#zsh
mv ~/.zshrc ~/.zshrc.old || true
ln -s $PWD/zshrc ~/.zshrc

#git
mv ~/.gitconfig ~/.gitconfig.old || true
ln -s $PWD/gitconfig ~/.gitconfig
