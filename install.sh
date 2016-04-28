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

# .Xdefaults
if [ ! -h ~/.Xdefaults ]; then
	ln -sf `pwd`/.Xdefaults ~/.Xdefaults
else
	echo "..Xdefaults already exists..."
fi

# soft link fluxbox directory (.fluxbox/)
if [ ! -h ~/.fluxbox ]; then
	ln -sf `pwd`/.fluxbox ~/.fluxbox
else
	echo ".fluxbox/ already exists..."
fi

# soft link i3 directory (.i3/)
if [ ! -h ~/.i3 ]; then
	ln -sf `pwd`/.i3 ~/.i3
else
	echo ".i3/ already exists..."
fi

# soft link backgrounds directory (.backgrounds/)
if [ ! -h ~/.backgrounds ]; then
	ln -sf `pwd`/.backgrounds ~/.backgrounds
else
	echo ".backgrounds/ already exists..."
fi

# soft link .kshrc file
if [ ! -h ~/.kshrc ]; then
	ln -sf `pwd`/.kshrc ~/.kshrc
else 
	echo ".kshrc already exists..."
fi

echo "Downloading Submodules..."
# download the submodules
git submodule update --init

echo "Installing Vim Plugins..."
# install vim scripts
vim +PluginInstall +qall 


# soft link fonts directory (.fonts/)
if [ ! -h ~/.fonts ]; then
	ln -sf `pwd`/.fonts ~/.fonts
else
	echo ".fonts/ already exists..."
fi
echo "Installing fonts...\n"
/usr/X11R6/bin/fc-cache -v
xset fp rehash
