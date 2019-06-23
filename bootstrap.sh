#!/bin/bash

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

brew install gcc --without-glibc --only-dependencies

prefix=~/.linuxbrew
mkdir -p "$prefix"'/Cellar/gcc/6.2.0/'
cp -r /share/apps/gcc-6.2.0/* "$prefix"'/Cellar/gcc/6.2.0/'

brew link gcc

mkdir -p "$prefix"'/Cellar/gcc/6.2.0/lib/gcc/x86_64-unknown-linux-gnu/6.2.0/specs.orig'
gcc -dumpspecs > "$prefix"'/Cellar/gcc/6.2.0/lib/gcc/x86_64-unknown-linux-gnu/6.2.0/specs.orig'

brew install -v gmp
brew install -v isl@0.18
brew install -v libmpc
brew install -v mpfr

brew install -v glibc

brew unlink gcc
rm -rf "$prefix"'/Cellar/gcc/'
brew install -v gcc

brew install -v hello
brew test -v hello
brew remove hello
