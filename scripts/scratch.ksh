#!/bin/ksh -vx
# scratch is a function that creates/opens a "scratch" text file in vim for a tmux session in the .scratch directory. it is used for notes on projects relatet to tmux stuff to make life easier

function scratch {
	session=$(tmux list-pane -F '#S' | head -1)
	if [[ -d ~/".scratch" ]]; then
		echo "Scratch folder exists"
	else
		mkdir ~/".scratch"
	fi
	~/dotfiles/scripts/box_down.expect $box_username $box_pass $session
	vi ~/".scratch/$session.txt"
	~/dotfiles/scripts/box_up.expect $box_username $box_pass $session
}
export scratch
