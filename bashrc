#!/bin/bash
# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don’t want to commit.
if [[ "$(uname)" == "Darwin" ]]; then
    for file in ~/.{path,exports,aliases,functions,extra}; do
        [ -r "$file" ] && [ -f "$file" ] && source "$file";
    done;
elif [[ "$(expr substr $(uname -s) 1 5)" == "Linux" ]]; then
    for file in ~/.{path,exports,aliases,functions,extra}; do
        [ -r "$file" ] && [ -f "$file" ] && source "$file";
    done;
    # Do something under GNU/Linux platform
elif [[ "$(expr substr $(uname -s) 1 10)" == "MINGW32_NT" ]]; then
    # Do something under Windows NT platform
    echo "PASS"
fi
unset file;

source ~/.autoenv/activate.sh

# If fortune is installed, run a fortune
if [ -e /opt/local/bin/fortune ]; then
    fortune -so
    echo " "
fi

set -o emacs

export CLICOLOR=1
export LSCOLORS=Gxfxcxdxbxegedabagacad

alias .bash='. ~/.bashrc'

# Detect which `ls` flavor is in use
if ls --color > /dev/null 2>&1; then # GNU `ls`
    colorflag="--color"
else # OS X `ls`
    colorflag="-G"
fi

# Centos Korean fix
LANG="ko_KR.UTF-8"
SYSFONT="latarcyrheb-sun16"

# Auto-launching ssh-agent when open bash
# Note: ~/.ssh/environment should not be used, as it
#       already has a different purpose in SSH.

env=~/.ssh/agent.env

# Note: Don't bother checking SSH_AGENT_PID. It's not used
#       by SSH itself, and it might even be incorrect
#       (for example, when using agent-forwarding over SSH).

agent_is_running() {
    if [ "$SSH_AUTH_SOCK" ]; then
        # ssh-add returns:
        #   0 = agent running, has keys
        #   1 = agent running, no keys
        #   2 = agent not running
        ssh-add -l >/dev/null 2>&1 || [ $? -eq 1 ]
    else
        false
    fi
}

agent_has_keys() {
    ssh-add -l >/dev/null 2>&1
}

agent_load_env() {
    . "$env" >/dev/null
}

agent_start() {
    (umask 077; ssh-agent >"$env")
    . "$env" >/dev/null
}

#carpedm20

if ! agent_is_running; then
    agent_load_env
fi

# if your keys are not stored in ~/.ssh/id_rsa.pub or ~/.ssh/id_dsa.pub, you'll need
# to paste the proper path after ssh-add
if ! agent_is_running; then
    agent_start
    ssh-add
elif ! agent_has_keys; then
    ssh-add
fi
export TERM="xterm-256color"

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# set where virutal environments will live   
export WORKON_HOME=$HOME/.virtualenvs    
# ensure all new environments are isolated from the site-packages directory    
export VIRTUALENVWRAPPER_VIRTUALENV_ARGS='--no-site-packages'    
# use the same directory for virtualenvs as virtualenvwrapper    
export PIP_VIRTUALENV_BASE=$WORKON_HOME    
# makes pip detect an active virtualenv and install to it    
export PIP_RESPECT_VIRTUALENV=true   


#export DISPLAY=:0.0
#gsettings set org.gnome.Vino require-encryption false

# added by Anaconda2 2.4.0 installer
export PATH="/Users/carpedm20/anaconda2/bin:$PATH"

# Torch
. /home/carpedm20/git/torch/install/bin/torch-activate

# Chrome Remote Desktop
export CHROME_REMOTE_DESKTOP_DEFAULT_DESKTOP_SIZES="YOUR_PREFERRED/DEFAULT_RESOLUTION_HERE"

if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
