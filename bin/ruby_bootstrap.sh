export CFLAGS=-Wno-error=shorten-64-to-32
brew update
for formula in readline openssl curl-ca-bundle ruby-build chruby; do
	brew list $formula > /dev/null
	if [ $? -ne 0 ]; then
		brew install $formula
	fi
done

if [ ! -d ~/.rubies/2.0.0-p0 ]; then
	env RUBY_CONFIGURE_OPTS=--with-openssl-dir=`brew --prefix openssl` CONFIGURE_OPTS=--with-readline-dir=`brew --prefix readline` ruby-build 2.0.0-p0 ~/.rubies/2.0.0-p0
fi

if [ ! -d ~/.rubies/1.9.3-p392 ]; then
	env CONFIGURE_OPTS=--with-readline-dir=`brew --prefix readline` ruby-build 1.9.3-p392 ~/.rubies/1.9.3-p392
fi
