#!/bin/sh -eu

# This script is based on
#   https://raw.githubusercontent.com/Linuxbrew/install/master/install.sh on 2018/6/16
#   https://raw.githubusercontent.com/Linuxbrew/install/master/install-ruby on 2018/6/16
# and licensed under the BSD 2-clause "Simplified" License.
#  (https://github.com/Linuxbrew/brew/blob/master/LICENSE.txt)

prefix=~/.linuxbrew/Homebrew/Library/Homebrew/vendor
version=2.3.7
echo "==> Installing Ruby to $prefix"
mkdir -p $prefix
tar -C $prefix -xf portable-ruby-$version.x86_64_linux.bottle.tar.gz
echo '==> Installing successful'

export HOMEBREW_NO_ENV_FILTERING=1
DEFAULT_PATH=$(env - /bin/bash -c 'echo $PATH')

# Last cat is for preventing stop of this script
curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install \
    | sed 's%\(HOMEBREW_PREFIX_DEFAULT = "\)\(/home/linuxbrew\)\(/.linuxbrew"\)%\1#{ENV["HOME"]}\3%' \
    | sed 's#return @have_sudo unless @have_sudo.nil?#return false#' \
    | env - HOME=$HOME USER=$USER PATH=$LOCALDIR/bin:$DEFAULT_PATH LD_LIBRARY_PATH=$LOCALDIR/lib \
            CURL_CA_BUNDLE=$CURL_CA_BUNDLE GIT_SSL_NO_VERIFY=1 \
            $prefix/portable-ruby/$version/bin/ruby - --force-curl | cat
