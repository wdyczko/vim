#!/usr/bin/env bash

cd /tmp
git clone https://github.com/wdyczko/vim.git
mv vim/vimrc ~/.vimrc
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
vim +PlugInstall +qall
rm -rf /tmp/vim
