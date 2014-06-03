#!/bin/sh

function install_brew() {
	ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)" 2> /dev/null
}

function install_package() {
	brew install $1 2> /dev/null
}

install_brew

install_package zsh
install_package tmux
install_package ssh-copy-id
install_package git
install_package chruby
install_package ruby-install
install_package autojump
install_package the_silver_searcher
install_package jq
