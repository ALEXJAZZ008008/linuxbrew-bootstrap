#!/bin/bash

# Copyright University College London 2019
# Author: Alexander Whitehead, Institute of Nuclear Medicine, UCL
# For internal research only.

if [ "$#" -ne 1 ]
then
    LOCALDIR=$(readlink -f ~/local)
else
    LOCALDIR=$(readlink -f "$1")
fi

source /SAN/inm/tools/set_env_cluster.sh

export CC=gcc
export CXX=g++
export EDITOR=nano

export PATH=/share/apps/git-2.16.2/bin:$PATH
export PATH=/share/apps/cmake-3.12.0/bin:$PATH
export PATH=/share/apps/automake-1.15/bin/:$PATH
export PATH=/share/apps/autoconf-2.69/bin/:$PATH
export PATH=/share/apps/gcc-6.2.0/bin/:$PATH

export PATH=~/.linuxbrew/sbin:$PATH
export PATH=~/.linuxbrew/bin:$PATH

export XDG_DATA_DIRS=~/.linuxbrew/share:$XDG_DATA_DIRS

alias ruby=~/.linuxbrew/Homebrew/Library/Homebrew/vendor/portable-ruby/current/bin/ruby
alias brew=~/.linuxbrew/bin/brew

export HOMEBREW_NO_ANALYTICS=1
export HOMEBREW_NO_ENV_FILTERING=1
export GIT=/share/apps/git-2.16.2/bin/git
export HOMEBREW_FORCE_BREWED_GIT=1
export HOMEBREW_BUILD_FROM_SOURCE=1
export HOMEBREW_NO_AUTO_UPDATE=1

export HOMEBREW_CACHE="$LOCALDIR"'/.cache'
export HOMEBREW_TEMP="$LOCALDIR"'/.temp'
export HOMEBREW_LOGS="$LOCALDIR"'/.log'
