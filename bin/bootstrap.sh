#!/bin/sh

set -e

ZSH=~/.oh-my-zsh

if [ ! -d "$ZSH" ]; then
	hash git >/dev/null 2>&1 && \
		/usr/bin/env git clone https://github.com/robbyrussell/oh-my-zsh.git $ZSH
fi

hash rsync >/dev/null 2>&1 && /usr/bin/env rsync \
	--exclude ".git/" --exclude "README.md" --exclude "bootstrap.sh" --exclude Vagrantfile \
	-av ~/.home/ ~/
