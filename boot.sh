#!/bin/bash

coc_plugins=(coc-rls)

if [[ "$1" == "-n" ]]; then
  VIM="nvim"
else
  VIM="vim"
fi

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

coc_plugins=(coc-rls)

"$VIM" -u updaterc +PlugInstall +qa

for plugin in $coc_plugins; do
  "$VIM" -u updaterc "+CocInstall ${plugin}" +qa
done
