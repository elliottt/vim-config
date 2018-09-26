#!/bin/bash


if [ ! -d swap ]; then
	mkdir swap
fi

if [ ! -d bundle/Vundle.vim ]; then
	git clone https://github.com/VundleVim/Vundle.vim bundle/Vundle.vim
fi

if [ "$1" = "-n" ]; then
  nvim -u updaterc +BundleInstall +qa
else
  vim -u updaterc +BundleInstall +qa
fi
