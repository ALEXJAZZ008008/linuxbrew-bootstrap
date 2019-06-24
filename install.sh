#!/bin/bash

source ./prepare.sh $1

if [ ! -e $LOCALDIR/cacert.pem ]
then
    curl -kL --output $LOCALDIR/cacert.pem https://curl.haxx.se/ca/cacert.pem 
fi

export CURL_CA_BUNDLE=$LOCALDIR/cacert.pem
export GIT_SSL_NO_VERIFY=1
export PATH=~/.linuxbrew/bin:~/.linuxbrew/sbin:$PATH"
source ./install-linuxbrew.sh

echo "Updating brew"
# Add local curl path forcedly
CURL_RB=$HOME/.linuxbrew/Homebrew/Library/Homebrew/utils/curl.rb
mv $CURL_RB $CURL_RB.orig
sed 's#"/usr/bin/curl",#"/usr/bin/curl","'$LOCALDIR/bin/curl'"#' $CURL_RB.orig \
  | sed 's#"SSL_CERT_FILE" => nil#"SSL_CERT_FILE" => nil, "LD_LIBRARY_PATH" => "'$LOCALDIR'/lib"#' \
  > $CURL_RB

source ./bootstrap.sh

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

./config.sh
