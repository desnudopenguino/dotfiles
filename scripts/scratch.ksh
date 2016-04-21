#!/bin/ksh -vx
# scratch is a function that creates/opens a "scratch" text file in vim for a tmux session in the .scratch directory. it is used for notes on projects relatet to tmux stuff to make life easier

function scratch {
	session=$(tmux list-pane -F '#S' | head -1)
	dir=".scratch"
	if [[ -d ~/"$dir" ]]; then
		echo "Scratch folder exists"
	else
		mkdir ~/"$dir"
	fi
	session=$session".txt"
	~/dotfiles/scripts/box_down.expect $box_username $box_pass $session $dir
OIFS=$IFS
IFS='.'
set -A filename $session
IFS=$OIFS
	vi note:${filename[0]}
	~/dotfiles/scripts/box_up.expect $box_username $box_pass $session $dir
	echo "\n"
}
export scratch
