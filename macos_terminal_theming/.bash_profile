#   Set default blocksize for ls, df, du
export BLOCKSIZE=1k

#   Colorful Man Pages
mans () {
	man $1 | grep -iC2 --color=always $2 | less
}

#   extract:  Extract most know archives with one command
extract () {
	if [ -f $1 ] ; then
		case $1 in
			*.tar.bz2)   tar xjf $1     ;;
			*.tar.gz)    tar xzf $1     ;;
			*.bz2)       bunzip2 $1     ;;
			*.rar)       unrar e $1     ;;
			*.gz)        gunzip $1      ;;
			*.tar)       tar xf $1      ;;
			*.tbz2)      tar xjf $1     ;;
			*.tgz)       tar xzf $1     ;;
			*.zip)       unzip $1       ;;
			*.Z)         uncompress $1  ;;
			*.7z)        7z x $1        ;;
			*)     echo "'$1' cannot be extracted via extract()" ;;
		esac
	else
		echo "'$1' is not a valid file"
	fi
}

# Networking
alias myip='dig +short myip.opendns.com @resolver1.opendns.com'	# myip:         Public facing IP Address
alias netCons='lsof -i'                             		# netCons:      Show all open TCP/IP sockets
alias flushDNS='dscacheutil -flushcache'            		# flushDNS:     Flush out the DNS Cache
alias lsock='sudo /usr/sbin/lsof -i -P'             		# lsock:        Display open sockets
alias lsockU='sudo /usr/sbin/lsof -nP | grep UDP'   		# lsockU:       Display only open UDP sockets
alias lsockT='sudo /usr/sbin/lsof -nP | grep TCP'   		# lsockT:       Display only open TCP sockets
alias ipInfo0='ipconfig getpacket en0'              		# ipInfo0:      Get info on connections for en0
alias ipInfo1='ipconfig getpacket en1'              		# ipInfo1:      Get info on connections for en1
alias openPorts='sudo lsof -i | grep LISTEN'        		# openPorts:    All listening connections

# Dealing with files
alias cleanupDS="find . -type f -name '*.DS_Store' -ls -delete"	# cleanupDS:  	Recursively delete .DS_Store files

# Brew Stuffs
alias brewup='brew update; brew upgrade; brew prune; brew cleanup; brew doctor'

#   Add color to terminal
export PS1="\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\w\[\033[m\]\$ "
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad
alias ls='ls -GFh'
