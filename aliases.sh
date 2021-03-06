# -------------------------------------------------------
# Original Author: Nathan Broadbent
# Modified By: Michael-Keith Bernard
# Source: https://github.com/ndbroadbent/ubuntu_config
# Retrieved: Oct 19, 2011
# -------------------------------------------------------

# -------------------------------------------------------
# Aliases, functions & key bindings
# -------------------------------------------------------

# -- shortcuts
alias serve="python -m 'SimpleHTTPServer'"

# -- bash
alias l='ls -Cv'
alias ll='ls -lv'
alias la='ls -lvA'

alias _='sudo'
alias n='nautilus .'
alias tmux="tmux -2"

alias ~='cd ~'
alias cl='cd -'
alias ..='cd ..'
alias ...='cd ../..';
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'

# -- apt
alias apt-install='sudo apt-get install -y'
alias apt-search='apt-cache search'

# -------------------------------------------------
# Include configurable bash aliases, if file exists
if [ -f ~/.bash_aliases ]; then
  . ~/.bash_aliases
fi

# ---------------------------------------------------------
# Alias management (helper functions for ~/.bash_aliases)
# ---------------------------------------------------------

# Adds a directory, then cds into it
# ------------------------------------------------
function mkd() {
  if [ -n "$1" ]; then
    mkdir -p $1
    cd $1
  else
    echo "Usage: mkd <directory_name>"
  fi
}

# Adds an alias to ~/.bash_aliases.
# ------------------------------------------------
function add_alias() {
  if [ -n "$1" ] && [ -n "$2" ]; then
    touch ~/.bash_aliases
    echo "alias $1=\"$2\"" >> ~/.bash_aliases
    source ~/.bashrc
  else
    echo "Usage: add_alias <alias> <command>"
  fi
}
# Adds a change directory alias to ~/.bash_aliases.
# Use '.' for current working directory.
# Changes directory, then lists directory contents.
# ------------------------------------------------
function add_dir_alias() {
  if [ -n "$1" ] && [ -n "$2" ]; then
    path=`dirname $2/.`   # Fetches absolute path.
    touch ~/.bash_aliases
    echo "alias $1=\"cd $path; ll\"" >> ~/.bash_aliases
    source ~/.bashrc
  else
    echo "Usage: add_dir_alias <alias> <path>"
  fi
}
# Remove an alias
# ------------------------------------------------
function rm_alias() {
  if [ -n "$1" ]; then
    touch ~/.bash_aliases
    grep -Ev "alias $1=" ~/.bash_aliases > ~/.bash_aliases.tmp
    mv ~/.bash_aliases.tmp ~/.bash_aliases
    unalias $1
    source ~/.bashrc
  else
    echo "Usage: rm_alias <alias>"
  fi
}

