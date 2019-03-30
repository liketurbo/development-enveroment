# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/mronetwo/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git tmux zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# Manual path configuration
export MANPATH="/usr/local/man:$MANPATH"

# Preferred editor for local and remote sessions
export EDITOR='vim'

#########################
# User defined settings #
#########################

# Use vim key bindings
set -o vi

# Bugfix: backspace doesn't working in insert mode
# https://github.com/denysdovhan/spaceship-prompt/issues/91
bindkey "^?" backward-delete-char

# Bugfix: python: tkinter need a display
# https://stackoverflow.com/questions/48254530/tkinter-in-ubuntu-inside-windows-10-error-no-display-name-and-no-display-env
export DISPLAY=:0

# Node Version Manager - Simple bash script to manage multiple active node.js version
# https://github.com/creationix/nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Always work in a tmux session if tmux is installed
# https://github.com/chrishunt/dot-files/blob/master/.zshrc
if which tmux 2>&1 >/dev/null; then
  if [ $TERM != "screen-256color" ] && [  $TERM != "screen" ]; then
    tmux attach -t tmux &> /dev/null || tmux new -s tmux; exit
  fi
fi

# Changing the higlight color for zsh-syntax-highlighting
# https://github.com/zsh-users/zsh-syntax-highlighting/issues/464
ZSH_HIGHLIGHT_STYLES[suffix-alias]=fg=blue,underline
ZSH_HIGHLIGHT_STYLES[precommand]=fg=blue,underline
ZSH_HIGHLIGHT_STYLES[arg0]=fg=blue
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=5'

# Docker variables for WSL (Win10Pro)
# https://nickjanetakis.com/blog/setting-up-docker-for-windows-and-wsl-to-work-flawlessly
export DOCKER_HOST="tcp://localhost:2375"

# My startup
if [ $TMUX_PANE = "%0" ] ; then
  sudo service postgresql start &> /dev/null
  sudo service redis-server restart &> /dev/null
fi

# My aliases
alias cat="pygmentize -g"
