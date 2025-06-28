#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return
hyfetch

# SHORTCUTS
alias ls='ls --color=auto'
alias la='ls -a'
alias grep='grep --color=auto'
alias cdd='cd ..'
alias yays='yay -S'
alias yayup='yay -Syu'
alias hm='cd ~'

PS1='[\u@\h \W]\$ '

# Oh-My-Posh init/config
eval "$(oh-my-posh init bash --config ~/.config/oh-my-posh/tekk-posh-01.omp.json)"

export PATH=$PATH:/home/tekk/.spicetify

wifico() {
    read -p "Enter WiFi SSID: " ssid
    read -s -p "Enter WiFi Password: " password
    echo
    sudo nmcli dev wifi connect "$ssid" password "$password"
}

