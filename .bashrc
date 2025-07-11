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
alias bambot='pyv && python ~/Documents/bambot/main.py'
alias walselect='source ~/hyprtekdots/scripts/diryfknselector.sh &'
alias vim='nvim'
PS1='[\u@\h \W]\$ '

# Oh-My-Posh init/config
eval "$(oh-my-posh init bash --config ~/.config/oh-my-posh/tekk-posh-01.omp.json)"

wifico() {
    read -p "Enter WiFi SSID: " ssid
    echo
    sudo nmcli dev wifi connect "$ssid" --ask
}

. "$HOME/.cargo/env"
