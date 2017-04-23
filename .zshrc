[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx 
alias ls='ls --color'
alias iphone='sudo ip link set enp0s20f0u1c4i2 up | sudo dhcpcd enp0s20f0u1c4i2 '
alias relogin='exec $SHELL -l'
alias office='libreoffice'
alias vim='nvim'
alias cd..='cd ..'
