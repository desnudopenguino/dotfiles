#!/bin/sh


echo "Linking Config Files to Home Directory (~)..."
# soft link vim config (.vimrc)
if [ ! -h ~/.vimrc ]; then
	ln -sf `pwd`/.vimrc ~/.vimrc
else 
	echo ".vimrc already exists..."
fi

# soft link vim directory (.vim/)
if [ ! -h ~/.vim ]; then
	ln -sf `pwd`/.vim ~/.vim
else
	echo ".vim/ already exists..."
fi

# soft link tmux config (.tmux.conf)
if [ ! -h ~/.tmux.conf ]; then
	ln -sf `pwd`/.tmux.conf ~/.tmux.conf
else
	echo ".tmux.conf already exists..."
fi

# soft link tmux directory
if [ ! -h ~/.tmux ]; then
	ln -sf `pwd`/.tmux ~/.tmux
else
	echo ".tmux/ already exists..."
fi

if [ ! -h ~/.Xdefaults ]; then
	ln -sf `pwd`/.Xdefaults ~/.Xdefaults
else
	echo "..Xdefaults already exists..."
fi

echo "Downloading Submodules..."
# download the submodules
git submodule update --init

echo "Installing Vim Plugins..."
# install vim scripts
vim -S install.vim > /dev/null 2>&1
