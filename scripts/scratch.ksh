#!/bin/ksh -vx
# scratch is a function that creates/opens a "scratch" text file in vim for a tmux session in the .scratch directory. it is used for notes on projects relatet to tmux stuff to make life easier

function scratch {
  session=$(tmux list-pane -F '#S' | head -1)
  dir=".scratch"
  localdir="/home/`whoami`/$dir"
  if [[ ! -d "$localdir" ]]; then
    mkdir -p "$localdir"
  fi
  session=$session".txt"
  wl_box_get.expect $session $localdir $dir
OIFS=$IFS
IFS='.'
set -A filename $session
IFS=$OIFS
  vi note:${filename[0]}
  wl_box_put.expect $session $localdir $dir
  echo "\n"
}
export scratch
