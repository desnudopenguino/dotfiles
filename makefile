# makefile for my dotfiles
#

all:
	@echo "Linking Dotfiles to ~..."
	@if [ ! -h ~/.vimrc ]; then ln -sf `pwd`/.vimrc ~/.vimrc; fi
	@if [ ! -h ~/.vim ]; then ln -sf `pwd`/.vim ~/.vim; fi
	@if [ ! -h ~/.tmux ]; then ln -sf `pwd`/.tmux ~/.tmux; fi
	@if [ ! -h ~/.tmux.conf ]; then ln -sf `pwd`/.tmux.conf ~/.tmux.conf; fi
	@if [ ! -h ~/.tmux ]; then ln -sf `pwd`/.tmux ~/.tmux; fi
	@if [ ! -h ~/.Xdefaults ]; then ln -sf `pwd`/.Xdefaults ~/.Xdefaults; fi
	@if [ ! -h ~/.tmux ]; then ln -sf `pwd`/.tmux ~/.tmux; fi
	@if [ ! -h ~/.backgrounds ]; then ln -sf `pwd`/.backgrounds ~/.backgrounds; fi
	@if [ ! -h ~/.kshrc ]; then ln -sf `pwd`/.kshrc ~/.kshrc; fi
	@if [ ! -h ~/.fonts ]; then ln -sf `pwd`/.fonts ~/.fonts; fi
	@if [ ! -h ~/.xsession ]; then ln -sf `pwd`/.xsession ~/.xsession; fi
	@if [ ! -h ~/.xmodmaprc ]; then ln -sf `pwd`/.xmodmaprc ~/.xmodmaprc; fi
	@if [ ! -h ~/.cwmrc ]; then ln -sf `pwd`/.cwmrc ~/.cwmrc; fi
	@echo "Installing Git Submodules"
	@git submodule update --init
	@echo "Installing Vim Plugins"
	@vim +PluginInstall +qall
	@echo "Installing Fonts...\n"
	@/usr/X11R6/bin/fc-cache -v
	@xset fp rehash

update:

deinstall:
