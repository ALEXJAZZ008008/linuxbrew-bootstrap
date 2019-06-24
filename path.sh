#!/bin/bash

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

export HOMEBREW_CACHE=/SAN/inm/moco/aaaALEX/.cache
export HOMEBREW_TEMP=/SAN/inm/moco/aaaALEX/.temp
export HOMEBREW_LOGS=/SAN/inm/moco/aaaALEX/.log
