#!/bin/sh


# soft link vim config (.vimrc)
ln -sf `pwd`/.vimrc ~/.vimrc

# soft link vim directory (.vim/)
ln -sf `pwd`/.vim ~/.vim

# soft link tmux config (.tmux.conf)
ln -sf `pwd`/.tmux.conf ~/.tmux.conf
