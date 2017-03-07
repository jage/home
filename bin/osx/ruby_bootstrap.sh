#!/bin/sh

for formula in chruby ruby-install; do
  brew list $formula > /dev/null
  if [ $? -ne 0 ]; then
    brew install $formula
  fi
done

for version in 2.1 2.2 2.3 2.4; do
  ruby-install --no-reinstall ruby $version -- --enable-dtrace
  if [ $? -ne 0 ]; then
    chruby-exec ruby-$version -- gem install bundler pry
  fi
done
