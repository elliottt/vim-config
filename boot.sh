#!/bin/bash

if [[ "$1" == "-n" ]]; then
  VIM="nvim"
else
  VIM="vim"
fi

mkdir -p swap
mkdir -p bundle

"$VIM" -u updaterc +PlugUpgrade +PlugInstall +qa
