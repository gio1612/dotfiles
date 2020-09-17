#
# ~/.bashrc
#

# If not running interactively, don't do anything
#[[ $- != *i* ]] && return

#comandos modificados
alias ls='ls --color=auto'
alias diff='colordiff'
alias df='df -h'
alias du='du -c -h'
alias ..='cd ..'
alias ls='ls -hF --color=auto'
alias rm='rm -i'
alias vi='vim'

#nuevos comandos
alias da='date "+%A, %B %d, %Y [%T]"'
alias pg='ps -Af|grep $1'

# privileged access
if [ $UID -ne 0 ]; then
    alias sudo='sudo '
    alias scat='sudo cat'
    alias svim='sudo vim'
    alias reboot='sudo reboot'
    alias halt='sudo halt'
    alias update='sudo pacman -Su'
fi



#PS1='[\u@\h \W]\$ '
#PS1='\[\e[1;32m\][\u@\h \W]\$\[\e[0m\] '
#PS1='\[\e[1;33m\]\u\[\e[m\]\[\e[1;34m\]\w\[\e[m\]\[\e[1;32m\]\$ '
PS1='\[\e[1;37m\]\u\[\e[m\]\[\e[1;34m\]\w\[\e[m\]\[\e[1;32m\]\$\[\e[m\]\[\e[0;37m\] '

export LESS="-R"

#------man color--------

#man() {

#	env \
#		LESS_TERMCAP_mb=$(printf "\e[1;31m") \
#		LESS_TERMCAP_md=$(printf "\e[1;31m") \
#		LESS_TERMCAP_me=$(printf "\e[0m") \
#		LESS_TERMCAP_se=$(printf "\e[0m") \
#		LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
#		LESS_TERMCAP_ue=$(printf "\e[0m") \
#		LESS_TERMCAP_us=$(printf "\e[1;32m") \
#			man "$@"
PATH=$PATH:$HOME/bin:$HOME/android/android-sdk/platform-tools/:$HOME/android/android-sdk/tools/
PATH=$PATH:$HOME/android/android-studio/bin/

export PATH
export LANG=es_ES.utf8

