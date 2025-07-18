#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return
fastfetch

# SHORTCUTS
alias ls='ls --color=auto'
alias la='ls -a'
alias grep='grep --color=auto'
alias cdd='cd ..'
alias yays='yay -S'
alias yayup='yay -Syu'
alias hm='cd ~'
alias pyv='source ~/env01/bin/activate'
alias walselect='source ~/hyprtekdots/scripts/diryfknselector.sh &'
alias vim='nvim'
alias fvim='nvim $( fzf -m --preview "bat --style=numbers --color=always {}" ) '
alias fzf='fzf --preview "bat --style=numbers --color=always {}"'
PS1='[\u@\h \W]\$ '

# Oh-My-Posh init/config
eval "$(oh-my-posh init bash --config ~/.config/oh-my-posh/tekk-posh-01.omp.json)"

 "$HOME/.cargo/env"
