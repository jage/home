#!/usr/local/bin/zsh
# 
# jage <johan@imum.net> http://jage.se
#

# Settings
OPENBSD_CVS='anoncvs@anoncvs.se.openbsd.org:/cvs'
NETBSD_CVS='anoncvs@anoncvs.se.netbsd.org:/cvsroot'
FREEBSD_CVS='freebsdanoncvs@anoncvs.freebsd.org:/home/ncvs'

ARCH=`uname -m`
OS=`uname`

if [ $OS = SunOS ]; then
	HOSTNAME=`hostname | cut -f 1 -d .`
else
	HOSTNAME=`hostname -s`
fi


# Functions and aliases
function load_keychain() {
	if [ -x $1 ]; then
		$1 -q ~/.ssh/id_dsa_alt
		source ~/.keychain/`hostname`-sh > /dev/null
	fi
}

alias ri="LESS='-fREXMM' ri -f ansi"

# Defaults
PREFIX='/usr/local'



## OS and/or Machine
case $OS in
	OpenBSD)
		if [ '' = "`/sbin/sysctl kern.version | grep '\-current'`" ]; then
			VERSION=`uname -r`
		else
			VERSION='snapshots'
		fi

		CVSROOT=${OPENBSD_CVS}
		PKG_PATH="ftp://ftp.su.se/pub/OpenBSD/${VERSION}/packages/${ARCH}/"
	;;
	NetBSD)
		PREFIX=('/usr/local' '/usr/pkg')
		CVSROOT=${NETBSD_CVS}
	;;

	FreeBSD)
		CVSROOT=${FREEBSD_CVS}
	;;

	Darwin)    
		PREFIX=('/opt/local' '/usr/local')
	;;
	DragonFly)
		PREFIX=('/usr/local' '/usr/pkg')
	;;
	SunOS)
		stty erase ^\?
	
		# Machines
		if [ `hostname | cut -f 2 -d .` = ida ]; then
			PREFIX=('/usr/local/' '/sw/gnu/' '/usr/sfw/'
				'/student' '/sw/gcc-3.4.4' '/sw/emacs-21.4'
				'/sw/xemacs-21.4.12' '/sw/staroffice-8.0/usr/')
		fi
	;;
esac
export PKG_PATH
export CVSROOT

path=(
	.
	~/bin
	/bin
	/sbin
	/usr/bin
	/usr/sbin
	/usr/X11R6/bin
)

manpath=(
	/usr/man
	/usr/share/man
	/usr/X11R6/man
)


# OS specific local paths
for i in ${PREFIX}; do
	path=(${i}{/bin,/sbin} $path)
	manpath=(${i}/man $path)
done

# Unique entries
typeset -U path manpath

# titlebar and xterm-color
case $TERM in
	xterm*)
		precmd () {print -Pn "\e]0;%n@%m: %~\a"}
		preexec () { print -Pn "\e]0;%m: $1\a" }
		if [ $OS = SunOS ]; then
			TERM='xterm'
		else
			TERM='xterm-color'
		fi
	;;
	rxvt)
		precmd () {print -Pn "\e]0;%n@%m: %~\a"}
	;;
esac

# Magically quote urls
autoload -U url-quote-magic
zle -N self-insert url-quote-magic


# I like colors
export CLICOLOR=1

# colorls
if which colorls &> /dev/null; then
	alias ls='colorls -FG'
elif ls --color &> /dev/null; then
	alias ls='ls --color'
fi

# vim
if which vim &> /dev/null; then
	EDITOR='vim'
else
	EDITOR='vi'
fi
export EDITOR

# SSH functions
function known_fingerprint() {
    HOSTNAME=$1
    TMPFILE=`mktemp /tmp/example.XXXXXXXXXX` || exit 1
    ssh-keygen -F $HOSTNAME > $TMPFILE
    ssh-keygen -l -f $TMPFILE
    rm $TMPFILE
}
function fingerprints() {
    ssh-keygen -l -f /etc/ssh/ssh_host_dsa_key.pub
    ssh-keygen -l -f /etc/ssh/ssh_host_rsa_key.pub
}

# Prompt
PROMPT='%(#.#.$) '
RPROMPT='%n@%m %~'

# SSH
CVS_RSH='ssh'
RSYNC_RSH='ssh'

# Options
setopt \
	autocd \
	hash_dirs \
	no_beep \
	no_check_jobs \

# zcalc > bc
autoload -U zcalc

## Completion
autoload -U compinit
compinit

# Messages
zstyle ':completion:*:descriptions' format '%B%d%b'

# Completers to use
zstyle ':completion:*' completer _complete _prefix
zstyle ':completion::prefix-1:*' completer _complete
zstyle ':completion:incremental:*' completer _complete _correct
zstyle ':completion:predict:*' completer _complete

# Indexes before parameters in subscripts
zstyle ':completion:*:*:-subscript-:*' tag-order indexes parameters

# Match uppercase from lowercase
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# Completion caching
zstyle ':completion::complete:*' use-cache 1
zstyle ':completion::complete:*' cache-path ~/.zsh/cache/$HOST

# Emacs mode
set -o emacs

# rake completion
if [ -f $HOME/.rake_completion.zsh ]; then
	source $HOME/.rake_completion.zsh
fi

# Load machine specific settings
if [ -f ${HOME}/.zshrc_${HOSTNAME} ]; then
	source ${HOME}/.zshrc_${HOSTNAME}
fi

bindkey "^?" backward-delete-char
bindkey "^[[3~" delete-char
