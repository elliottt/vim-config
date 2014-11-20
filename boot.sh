#!/bin/zsh

if [[ ! -d swap ]]; then
	mkdir swap
fi

if [[ ! -d bundle/Vundle.vim ]]; then
	git clone https://github.com/gmarik/vundle.git bundle/Vundle.vim
fi

vim +BundleInstall +qa
