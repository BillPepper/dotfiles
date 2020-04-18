# export PATH=$HOME/bin:/usr/local/bin:$PATH
export ZSH=/home/mattes/.oh-my-zsh

ZSH_THEME="arrow"

COMPLETION_WAITING_DOTS="true"
plugins=(git)
source $ZSH/oh-my-zsh.sh
alias afn_nupy='export APP_ENV=config.DevelopmentConfig && cd /home/mattes/Documents/Artfacts/artfacts-nupy/'
alias pvenv='. venv/bin/activate'
alias nupy_fe='afn_nupy; npm run dev'
alias nupy_be='afn_nupy;pvenv; ./run.sh'
alias nupy_wt='afn_nupy;npm run watch'

# Administration
alias adm_kbd_en='setxkbmap us'
alias adm_kbd_de='setxkbmap de'
alias adm_kbd_intl='setxkbmap us -variant intl'
alias adm_restart_afn='zsh ~/Documents/Artfacts/scripts/restart-afn.sh'
alias adm_start_afn='zsh ~/Documents/Artfacts/scripts/start-afn.sh'
alias adm_stop_afn='zsh ~/Documents/Artfacts/scripts/stop-afn.sh'
alias feierabend='sudo pm-suspend && slock'
alias adm_nightmode-on='redshift -O 3500k'
alias adm_nightmode-off='redshift -x'
alias lsdirsizes='du -sh *'

# Configs
alias cfg_zshrc='vi ~/.zshrc'
alias cfg_vimrc='vi ~/.vimrc'

#------------------------------------------------------------------------------

export EDITOR=vim
export PATH=$PATH:/usr/local/binr



export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


SSH_ENV="$HOME/.ssh/environment"

feh --bg-center -H 1080 -W 1920 /home/mattes/Pictures/px_wall2.png

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
