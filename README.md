# DesnudoPenguino's Dotfiles!
Currently a set of vim and tmux files, more will be added probably as time goes on.

I made this so I can have all my dev environments be the same. Make sure you set the terminal in your bash profile, or whatever profile you are using! This .tmux.conf is set up to run under *BSD so BASH is found in a different location.

Step 1. Set the terminal to xterm-256-color to get all those pretty colors!

if [ "$TERM" == "xterm" ]; then

  export TERM=xterm-256color
  
fi

Step 2. Clone this repo

git clone https://github.com/desnudopenguino/dotfiles.git dotfiles

Step 3. Run the install script

cd dotfiles && ./install.sh
