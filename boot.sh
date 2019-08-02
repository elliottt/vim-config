#!/bin/bash


if [ ! -d swap ]; then
	mkdir swap
fi

mkdir -p autoload

curl -fLo autoload/plug.vim \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

mkdir -p bundle

if [ ! -d bundle/vim-plug ]; then
	git clone https://github.com/junegunn/vim-plug bundle/vim-plug
fi

if [ "$1" = "-n" ]; then
  nvim -u updaterc +PlugInstall +qa
else
  vim -u updaterc +PlugInstall +qa
fi
