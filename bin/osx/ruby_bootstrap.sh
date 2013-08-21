#!/bin/sh

brew update
for formula in chruby ruby-install; do
	brew list $formula > /dev/null
	if [ $? -ne 0 ]; then
		brew install $formula
	fi
done

ruby-install ruby 1.8 -- --without-tcl --without-tk
ruby-install ruby 1.9
ruby-install ruby 2.0 -- --enable-dtrace

