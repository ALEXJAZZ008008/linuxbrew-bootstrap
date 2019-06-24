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

brew install gcc --without-glibc --only-dependencies

echo -e "mkdir -p ~/.linuxbrew/Cellar/gcc/6.2.0/"
mkdir -p ~/.linuxbrew/Cellar/gcc/6.2.0/

echo -e "cp -r /share/apps/gcc-6.2.0/* ~/.linuxbrew/Cellar/gcc/6.2.0/"
cp -r /share/apps/gcc-6.2.0/* ~/.linuxbrew/Cellar/gcc/6.2.0/

brew link gcc

echo -e "mkdir -p ~/.linuxbrew/Cellar/gcc/6.2.0/lib/gcc/x86_64-unknown-linux-gnu/6.2.0/specs.orig"
mkdir -p ~/.linuxbrew/Cellar/gcc/6.2.0/lib/gcc/x86_64-unknown-linux-gnu/6.2.0/specs.orig

echo -e "gcc -dumpspecs > ~/.linuxbrew/Cellar/gcc/6.2.0/lib/gcc/x86_64-unknown-linux-gnu/6.2.0/specs.orig"
gcc -dumpspecs > ~/.linuxbrew/Cellar/gcc/6.2.0/lib/gcc/x86_64-unknown-linux-gnu/6.2.0/specs.orig

brew install -v gmp
brew install -v isl@0.18
brew install -v libmpc
brew install -v mpfr

brew install -v m4
brew install -v gpatch
brew install -v ncurses
brew install -v gettext
brew install -v bzip2
brew install -v pcre2
brew install -v libbsd
brew install -v expat
brew install -v libffi
brew install -v gpatch
brew install -v ncurses
brew install -v libedit
brew install -v libelf
brew install -v gdbm
brew install -v readline
brew install -v sqlite
brew install -v xz
brew install -v python
brew install -v libxml2
brew install -v python@2
brew install -v libpng
brew install -v freetype
brew install -v berkeley-db
brew install -v perl
brew install -v autoconf
brew install -v automake
brew install -v gperf
brew install -v libtool
brew install -v json-c
brew install -v util-linux
brew install -v fontconfig

brew install -v glibc
brew update
brew edit glibc

echo -e "PATH: "$PATH
echo -e "source ~/.bashrc"
source ~/.bashrc
echo -e "PATH: "$PATH

brew install -v glibc

brew unlink gcc

echo -e "rm -rf ~/.linuxbrew/Cellar/gcc/"
rm -rf ~/.linuxbrew/Cellar/gcc/

brew install -v gcc

brew install -v hello
brew test -v hello
brew remove hello
