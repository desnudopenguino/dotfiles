# makefile to install dotfiles

all:
	@echo "Linking Dotfiles to ~..."
	@if [ ! -h ~/.vimrc ]; then ln -sf `pwd`/.vimrc ~/.vimrc; fi
	@if [ ! -h ~/.vim ]; then ln -sf `pwd`/.vim ~/.vim; fi
	@if [ ! -h ~/.tmux ]; then ln -sf `pwd`/.tmux ~/.tmux; fi
	@if [ ! -h ~/.tmux.conf ]; then ln -sf `pwd`/.tmux.conf ~/.tmux.conf; fi
	@if [ ! -h ~/.Xdefaults ]; then ln -sf `pwd`/.Xdefaults ~/.Xdefaults; fi
	@if [ ! -h ~/.kshrc ]; then ln -sf `pwd`/.kshrc ~/.kshrc; fi
	@if [ ! -h ~/.fonts ]; then ln -sf `pwd`/.fonts ~/.fonts; fi
	@if [ ! -h ~/.xsession ]; then ln -sf `pwd`/.xsession ~/.xsession; fi
	@if [ ! -h ~/.cwmrc ]; then ln -sf `pwd`/.cwmrc ~/.cwmrc; fi
	@if [ ! -h ~/.conkyrc ]; then ln -sf `pwd`/.conkyrc ~/.conkyrc; fi
	@if [ ! -h ~/.conkyrc2 ]; then ln -sf `pwd`/.conkyrc2 ~/.conkyrc2; fi
	@if [ ! -h ~/.bg.png ]; then ln -sf `pwd`/.bg.png ~/.bg.png; fi
	@if [ ! -h ~/.compton.conf ]; then ln -sf `pwd`/.compton.conf ~/.compton.conf; fi
	@echo "Installing Git Submodules"
	@git submodule update --init
	@echo "Installing Vim Plugins"
	@vim +PluginInstall +qall
	@echo "Installing Fonts...\n"
	@/usr/X11R6/bin/fc-cache -v
