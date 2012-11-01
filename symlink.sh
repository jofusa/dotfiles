#!/bin/bash



if [ ! -d ~/.vim/UltiSnips/ ]; then
   echo "Making Directory"
   mkdir ~/.vim/UltiSnips	
fi

ls -1 ./UltiSnips/* | xargs -n1 -I{} sudo cp  {} ~/.vim/UltiSnips


cp ./vimrc ~/.vimrc

