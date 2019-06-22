#!/bin/bash

source ./prepare.sh $1

if [ ! -e $LOCALDIR/cacert.pem ]
then
    curl -kL --output $LOCALDIR/cacert.pem https://curl.haxx.se/ca/cacert.pem 
fi

export CURL_CA_BUNDLE=$LOCALDIR/cacert.pem
export GIT_SSL_NO_VERIFY=1
export PATH="$HOME/.linuxbrew/bin:$HOME/.linuxbrew/sbin:$PATH"
source ./install-linuxbrew.sh

echo "Updating brew"
# Add local curl path forcedly
CURL_RB=$HOME/.linuxbrew/Homebrew/Library/Homebrew/utils/curl.rb
mv $CURL_RB $CURL_RB.orig
sed 's#"/usr/bin/curl",#"/usr/bin/curl","'$LOCALDIR/bin/curl'"#' $CURL_RB.orig \
  | sed 's#"SSL_CERT_FILE" => nil#"SSL_CERT_FILE" => nil, "LD_LIBRARY_PATH" => "'$LOCALDIR'/lib"#' \
  > $CURL_RB

export PATH=/share/apps/git-2.16.2/bin:$PATH
export PATH=/share/apps/cmake-3.12.0/bin:$PATH
export PATH=/share/apps/automake-1.15/bin/:$PATH
export PATH=/share/apps/autoconf-2.69/bin/:$PATH
export PATH=/share/apps/gcc-6.2.0/bin/:$PATH

export HOMEBREW_NO_ANALYTICS=1
export HOMEBREW_NO_ENV_FILTERING=1
export GIT=/share/apps/git-2.16.2/bin/git
export HOMEBREW_FORCE_BREWED_GIT=1
export HOMEBREW_BUILD_FROM_SOURCE=1
export HOMEBREW_NO_AUTO_UPDATE=1

export HOMEBREW_CACHE=/SAN/inm/moco/aaaALEX/.cache
export HOMEBREW_TEMP=/SAN/inm/moco/aaaALEX/.temp
export HOMEBREW_LOGS=/SAN/inm/moco/aaaALEX/.log

prefix=~/.linuxbrew
mkdir -p "$prefix"'/Cellar/gcc/6.2.0/'
cp -r /share/apps/gcc-6.2.0/* "$prefix"'/Cellar/gcc/6.2.0/'

brew link gcc

mkdir -p "$prefix"'/Cellar/gcc/6.2.0/lib/gcc/x86_64-unknown-linux-gnu/6.2.0/specs.orig'
gcc -dumpspecs > "$prefix"'/Cellar/gcc/6.2.0/lib/gcc/x86_64-unknown-linux-gnu/6.2.0/specs.orig'

brew install -v glibc

brew unlink gcc
rm -rf "$prefix"'/Cellar/gcc/'
brew install -v gcc

brew install -v hello
brew test -v hello
brew remove hello

brew update
brew install -v bzip2

# Modify bunzip2 path forcedly
BUNZIP_RB=$HOME/.linuxbrew/Homebrew/Library/Homebrew/unpack_strategy/bzip2.rb
mv $BUNZIP_RB $BUNZIP_RB.orig
sed 's#bunzip2#'$(which bunzip2)'#' $BUNZIP_RB.orig > $BUNZIP_RB

brew install -v curl
brew install -v git

mv $CURL_RB.orig $CURL_RB
mv $BUNZIP_RB.orig $BUNZIP_RB

brew install -v llvm

brew tap linuxbrew/homebrew-xorg
brew install -v xorg

brew install -v fish
