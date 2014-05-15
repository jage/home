#!/bin/sh

brew update
for formula in chruby ruby-install; do
  brew list $formula > /dev/null
  if [ $? -ne 0 ]; then
    brew install $formula
  fi
done

ruby-install --no-reinstall ruby 1.8 -- --without-tcl --without-tk
if [ $? -ne 0 ]; then
  chruby-exec ruby-1.8 -- gem install bundler
fi

ruby-install --no-reinstall ruby 1.9
if [ $? -ne 0 ]; then
  chruby-exec ruby-1.9 -- gem install bundler pry
fi

ruby-install --no-reinstall ruby 2.0 -- --enable-dtrace
if [ $? -ne 0 ]; then
  chruby-exec ruby-2.0 -- gem install bundler pry
fi

ruby-install --no-reinstall ruby 2.1 -- --enable-dtrace
if [ $? -ne 0 ]; then
  chruby-exec ruby-2.1 -- gem install bundler pry
fi
