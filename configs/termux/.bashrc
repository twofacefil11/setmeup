  #goodone
   PS1='\[\e[38;5;202m\]\u\[\e[0m\] : \[\e[38;5;95m\]\[\e[1m\]$(for ((i = 1; i < $(echo "$PWD" | tr -cd '/' | wc -c) - 1; i++)); do echo -n "/"; done)\[\e[0m\]\[\e[38;5;109m\]/\W\[\e[0m\] : '

# ░
# ▒
# ▓

alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

alias zj="zellij"
alias y="yazi"
alias c="clear"


function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

