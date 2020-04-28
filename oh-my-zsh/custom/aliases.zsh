#random only
if type "hub" > /dev/null; then
	alias git=hub
fi

if type "codium" > /dev/null; then
	alias code='codium'
fi

if type "dnf" > /dev/null; then
	alias dnf='dnf --color always'
fi

alias docker_paper="docker --tlsverify \
	--tlscacert=/home/random/.docker/certificates/papertext/ca.pem \
	--tlscert=/home/random/.docker/certificates/papertext/cert.pem \
	--tlskey=/home/random/.docker/certificates/papertext/key.pem \
	-H=papertext.ru:2375"

# replace ls with [exa](https://github.com/ogham/exa)
if type "exa" > /dev/null; then
	alias ls='exa --icons --git-ignore'
	alias l='ls -1 --icons --header --git-ignore --git'
	alias ll='ls -l --icons --header --git-ignore --git'
	alias la='ls -la --icons --header --color-scale --git'
	alias ltree='la --tree --git-ignore --color-scale --git'
fi

# common
alias h='history'
alias zshrc='$EDITOR ~/.zshrc'

# command line tail appendixes
alias -g H='| head'
alias -g T='| tail'
alias -g G='| grep'
alias -g L="| less"
alias -g M="| most"
alias -g NULL="> /dev/null 2>&1"

# Make zsh know about hosts already accessed by SSH
zstyle -e ':completion:*:(ssh|scp|sftp|rsh|rsync):hosts' hosts 'reply=(${=${${(f)"$(cat {/etc/ssh_,~/.ssh/known_}hosts(|2)(N) /dev/null)"}%%[# ]*}//,/ })'

