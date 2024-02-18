#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

# execute startx after login
if systemctl -q is-active graphical.target && [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
	exec startx
fi
