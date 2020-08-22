
# If not running interactively, return
case $- in
    *i*) ;;
      *) return;;
esac
if [ -f "/google/devshell/bashrc.google" ]; then
  source "/google/devshell/bashrc.google"
fi
########################################################################
# Start History configuration
#settings from https://stackoverflow.com/questions/9457233/unlimited-bash-history
########################################################################
# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
#HISTSIZE=1000000
#HISTFILESIZE=2000000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar


# Eternal bash history.
# ---------------------
# Undocumented feature which sets the size to "unlimited".
# http://stackoverflow.com/questions/9457233/unlimited-bash-history
export HISTFILESIZE=
export HISTSIZE=
export HISTTIMEFORMAT="[%F %T] "
# Change the file location because certain bash sessions truncate .bash_history file upon close.
# http://superuser.com/questions/575479/bash-history-truncated-to-500-lines-on-each-login
export HISTFILE=~/.bash_eternal_history
# Force prompt to write history after every command.
# http://superuser.com/questions/20900/bash-history-loss
PROMPT_COMMAND="history -a; $PROMPT_COMMAND"


########################################################################
# End History configuration
########################################################################
# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    # some more ls aliases
    alias ll='ls -l --color=auto'
    alias llt='ls -lt --color=auto'
    alias lla='ls -lA --color=auto'

    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    #alias fgrep='fgrep --color=auto'
    #alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'


#alias l='ls -CF'
#updating this file automatically
alias cali='vim $HOME/.bashrc ;source $HOME/.bashrc'
alias bc='bcompare'

alias hh=history
alias hg='hh| grep $@' 
alias hgi='hh| grep -i $@'

#git
#alias git='sudo git'
alias g=git
alias gga='g aliases | grep $@'

#Docker
alias dexec='docker exec -e COLUMNS="`tput cols`" -e LINES="`tput lines`" -ti $@' 
alias drun='docker run -e COLUMNS="`tput cols`" -e LINES="`tput lines`" -ti $@' 

alias dc=docker-compose

#source <(kubectl completion bash)
alias k=kubectl
function kubectl() { echo "+ kubectl $@">&2; command kubectl $@; }
[ -f ~/.kubectl_aliases ] && source ~/.kubectl_aliases

#complete -F __start_kubectl k

export
PATH=/home/spikkie/.gems/bin:/usr/local/rvm/bin:/usr/local/go/bin:/opt/gradle/bin:/opt/maven/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/local/nvm/versions/node/v10.14.2/bin:/usr/local/rvm/bin:/google/go_appengine:/google/google_appengine:/home/spikkie/gopath/bin:/google/gopath/bin:/google/migrate/anthos/:/home/spikkie/bin:/home/spikkie/.jx/bin:/home/spikkie/projects/geneesplaats.nl/graphbook/bin/

complete -C /usr/local/bin/terraform terraform

source <(jx completion bash)
