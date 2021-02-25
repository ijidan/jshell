#!/bin/bash

source ./common.sh

`isProgramInstalled vim`

if [[ "$?" -ne "0" ]]
then
	echo "vim not installed;"
	exit 1
fi

#cp -rf  src/vim/.vim 		~/
cp -f 	src/vim/.vimrc 		~/
cp -f   src/vim/.viminfo	~/


vim vim +BundleInstall +qall
