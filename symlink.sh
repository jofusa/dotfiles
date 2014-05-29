#!/bin/bash


git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle

if [ ! -d ~/.vim/UltiSnips/ ]; then
   echo "Making Directory"
   mkdir ~/.vim/UltiSnips	
fi

ls -1 ./UltiSnips/* | xargs -n1 -I{} cp  {} ~/.vim/UltiSnips

if [ ! -d ~/.dircolors/ ]; then
   echo "Making .dircolors Directory"
   mkdir ~/.dircolors	
fi
ls -1 ./.dircolors/* | xargs -n1 -I{} cp  {} ~/.dircolors

if [ ! -d ~/.vim/colors ]; then
   echo "Making .vim/colors Directory"
   mkdir ~/.vim/colors	
fi
ls -1 ./colors/* | xargs -n1 -I{} cp  {} ~/.vim/colors

cp ./vimrc ~/.vimrc
cp ./.gitconfig ~/.gitconfig
cp ./.githelpers ~/.githelpers

 
vim +BundleInstall +qall



cp ./zshrc ~/.zshrc

source ~/.zshrc
