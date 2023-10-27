# export PATH=$HOME/bin:/usr/local/bin:$PATH
export ZSH=~/.oh-my-zsh

ZSH_THEME="arrow"

COMPLETION_WAITING_DOTS="true"
plugins=(git)
source $ZSH/oh-my-zsh.sh

# Set default editor
export EDITOR=vim

# Theme fixes
export QT_QPA_PLATFORMTHEME="qt5ct"
export _JAVA_AWT_WM_NONREPARENTING=1

# Setup ruby stuff
export GEM_HOME="$HOME/.gems"
export PATH="$HOME/.gems/bin:$PATH"

export LS_COLORS="di=34:ln=35:so=32:pi=33;40:ex=31:bd=31:cd=31:su=31:sg=31:tw=31:ow=31:"

# Setup Node version manager
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Setup shortcuts
alias dev_projects="cd ~/Code/Projects/"
alias vi_wanted="vi ~/Documents/Private/wanted.txt"
alias vi_cook="vi ~/Documents/Private/cook.txt"
alias vi_songs="vi ~/Documents/MusicStuff/songs_2021.txt"

# ssh stuff
SSH_ENV="$HOME/.ssh/environment"
function start_agent {
    echo "Initialising new SSH agent..."
    /usr/bin/ssh-agent | sed 's/^echo/#echo/' > "${SSH_ENV}"
    echo succeeded
    chmod 600 "${SSH_ENV}"
    . "${SSH_ENV}" > /dev/null
    /usr/bin/ssh-add;
}

# Source SSH settings, if applicable
if [ -f "${SSH_ENV}" ]; then
    . "${SSH_ENV}" > /dev/null
    #ps ${SSH_AGENT_PID} doesn't work under cywgin
    ps -ef | grep ${SSH_AGENT_PID} | grep ssh-agent$ > /dev/null || {
        start_agent;
    }
else
    start_agent;
fi

# java dev kit
export PATH=/opt/jdk11/bin:$PATH
