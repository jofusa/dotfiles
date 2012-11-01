#!/bin/bash


git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle

if [ ! -d ~/.vim/UltiSnips/ ]; then
   echo "Making Directory"
   mkdir ~/.vim/UltiSnips	
fi

ls -1 ./UltiSnips/* | xargs -n1 -I{} cp  {} ~/.vim/UltiSnips


cp ./vimrc ~/.vimrc
 
vim +BundleInstall +qall
