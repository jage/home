#!/bin/sh

function install_cask() {
	brew install phinze/cask/brew-cask 2> /dev/null
}

function install_package() {
	brew cask install $1 2> /dev/null
}

function hookup_alfred() {
	brew cask alfred link 2> /dev/null
}

install_cask

install_package iterm2
install_package firefox
install_package things
install_package gitx
install_package github
install_package dropbox
install_package isolator
install_package alfred
install_package sizeup
install_package the-unarchiver
install_package sequel-pro

hookup_alfred
