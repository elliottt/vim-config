#!/bin/sh

if [ ! -d swap ]; then
	mkdir swap
fi

if [ ! -d bundle/Vundle.vim ]; then
	git clone https://github.com/VundleVim/Vundle.vim bundle/Vundle.vim
fi

vim -u updaterc +BundleInstall +qa
