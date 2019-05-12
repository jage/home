#!/bin/sh

for formula in chruby ruby-install; do
  echo "brew '${formula}'" | brew bundle --file=-
done

for version in 2.4 2.5 2.6; do
  ruby-install --no-reinstall --jobs="$(sysctl -n hw.physicalcpu)" ruby "${version}" -- --enable-dtrace

  if [ $? -ne 0 ]; then
    chruby-exec "ruby-${version}" -- gem install bundler pry
  fi
done
