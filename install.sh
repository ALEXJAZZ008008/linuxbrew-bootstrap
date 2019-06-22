#!/bin/bash
source ./prepare.sh

if [ ! -e $LOCALDIR/cacert.pem ]; then
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
ln -s /share/apps/gcc-6.2.0/bin/gcc $prefix/bin/gcc-6.2.0
ln -s /share/apps/gcc-6.2.0/bin/g++ $prefix/bin/g++-6.2.0
ln -s /share/apps/gcc-6.2.0/bin/gfortran $prefix/bin/gfortran-6.2.0
export HOMEBREW_CC=gcc-6.2.0
brew install hello && brew test -v hello; brew remove hello

brew update
brew install bzip2

# Modify bunzip2 path forcedly
BUNZIP_RB=$HOME/.linuxbrew/Homebrew/Library/Homebrew/unpack_strategy/bzip2.rb
mv $BUNZIP_RB $BUNZIP_RB.orig
sed 's#bunzip2#'$(which bunzip2)'#' $BUNZIP_RB.orig > $BUNZIP_RB

brew install curl
brew install git
brew install gcc

mv $CURL_RB.orig $CURL_RB
mv $BUNZIP_RB.orig $BUNZIP_RB
