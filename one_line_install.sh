#!/usr/bin/env bash

cd /tmp
git clone https://github.com/wdyczko/vim.git
mv vim/vimrc ~/.vimrc
dnf install -y cmake &&
dnf install -y cargo
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
vim +PlugInstall +qall
cd ~/.vim/plugged/youcompleteme/
./install.py --all
rm -rf /tmp/vim
