#!/bin/bash -eu

mkdir -p log
LOCALDIR=$(readlink -f "$1")

export PATH=$LOCALDIR/bin:$PATH
export CPATH=$LOCALDIR/include:$LOCALDIR/include/ncurses
export LIBRARY_PATH=$LOCALDIR/lib
export LD_LIBRARY_PATH=$LOCALDIR/lib

### Install m4
echo "Installing m4 locally..."
M4=m4-1.4.18
M4_LOG=../log/m4.log

if [ ! -e $M4 ]
then
    tar xf $M4.tar.gz
fi

if [ ! -e ../bin/m4 ]
then
    pushd $M4 > /dev/null
    ./configure --prefix=$LOCALDIR > $M4_LOG 2>&1
    make >> $M4_LOG 2>&1
    make install >> $M4_LOG 2>&1
    popd > /dev/null
fi

### Install autoconf
echo "Installing autoconf locally..."
AUTOCONF=autoconf-2.69
AUTOCONF_LOG=../log/autoconf.log

if [ ! -e $AUTOCONF ]
then
    tar xf $AUTOCONF.tar.gz
fi

if [ ! -e ../bin/autoconf ]
then
    pushd $AUTOCONF > /dev/null
    ./configure --prefix=$LOCALDIR > $AUTOCONF_LOG 2>&1
    make >> $AUTOCONF_LOG 2>&1
    make install >> $AUTOCONF_LOG 2>&1
    popd > /dev/null
fi

### Install automake
echo "Installing automake locally..."
AUTOMAKE=automake-1.16.1
AUTOMAKE_LOG=../log/automake.log

if [ ! -e $AUTOMAKE ]
then
    tar xf $AUTOMAKE.tar.gz
fi

if [ ! -e ../bin/automake ]
then
    pushd $AUTOMAKE > /dev/null
    ./configure --prefix=$LOCALDIR > $AUTOMAKE_LOG 2>&1
    make >> $AUTOMAKE_LOG 2>&1
    make install >> $AUTOMAKE_LOG 2>&1
    popd > /dev/null
fi

### Install libtool
echo "Installing libtools locally..."
LIBTOOL=libtool-2.4.6
LIBTOOL_LOG=../log/libtool.log

if [ ! -e $LIBTOOL ]
then
    tar xf $LIBTOOL.tar.gz
fi

if [ ! -e ../bin/libtool ]
then
    pushd $LIBTOOL > /dev/null
    ./configure --prefix=$LOCALDIR > $LIBTOOL_LOG 2>&1
    make >> $LIBTOOL_LOG 2>&1
    make install >> $LIBTOOL_LOG 2>&1
    popd > /dev/null
fi

### Install openssl
echo "Installing OpenSSL locally..."
OPENSSL=openssl-1.0.2o
OPENSSL_LOG=../log/openssl.log

if [ ! -e $OPENSSL ]
then
    tar xf $OPENSSL.tar.gz
fi

if [ ! -e ../bin/openssl ]
then
    pushd $OPENSSL > /dev/null
    ./config shared --prefix=~/local --openssldir=openssl > $OPENSSL_LOG 2>&1
    make >> $OPENSSL_LOG 2>&1
    make test >> $OPENSSL_LOG  2>&1
    make install >> $OPENSSL_LOG 2>&1
    popd > /dev/null
fi

### Install curl
echo "Installing cURL locally..."
CURL=curl-7.60.0
CURL_LOG=../log/curl.log

if [ ! -e $CURL ]
then
    tar xf $CURL.tar.gz
fi

if [ ! -e ../bin/curl ]
then
    pushd $CURL > /dev/null
    CPPFLAGS="-I$LOCALDIR/include" LDFLAGS="-L$LOCALDIR/lib" ./configure --prefix=$LOCALDIR --with-ssl > $CURL_LOG 2>&1
    CPPFLAGS="-I$LOCALDIR/include" LDFLAGS="-L$LOCALDIR/lib" make >> $CURL_LOG 2>&1
    CPPFLAGS="-I$LOCALDIR/include" LDFLAGS="-L$LOCALDIR/lib" make install >> $CURL_LOG 2>&1
    popd > /dev/null
fi

### Install expat
echo "Installing libexpat locally..."
EXPAT=expat-2.2.5
EXPAT_LOG=../../log/expat.log

if [ ! -e $EXPAT ]
then
    tar xf $EXPAT.tar.gz
fi

if [ ! -e ../lib/libexpat.so ]
then
    pushd libexpat-R_2_2_5/expat > /dev/null
    $LOCALDIR/bin/autoreconf -i -f > $EXPAT_LOG 2>&1
    ./configure --without-xmlwf --prefix=$LOCALDIR >> $EXPAT_LOG 2>&1
    make >> $EXPAT_LOG 2>&1
    make install >> $EXPAT_LOG 2>&1
    popd > /dev/null
fi

### Install gettext
echo "Installing gettext locally..."
GETTEXT=gettext-0.19.8.1
GETTEXT_LOG=../log/gettext.log

if [ ! -e $GETTEXT ]
then
    tar xf $GETTEXT.tar.gz
fi

if [ ! -e ../bin/gettext ]
then
    pushd $GETTEXT > /dev/null
    ./configure --prefix=$LOCALDIR > $GETTEXT_LOG 2>&1
    make >> $GETTEXT_LOG 2>&1
    make install >> $GETTEXT_LOG 2>&1
    popd > /dev/null
fi

### Install zlib
echo "Installing zlib locally..."
ZLIB=zlib-1.2.11
ZLIB_LOG=../log/zlib.log

if [ ! -e $ZLIB ]
then
    tar xf $ZLIB.tar.gz
fi

if [ ! -e ../lib/zlib.so ]
then
    pushd $ZLIB > /dev/null
    ./configure --prefix=$LOCALDIR > $ZLIB_LOG 2>&1
    make >> $ZLIB_LOG 2>&1
    make install >> $ZLIB_LOG 2>&1
    popd > /dev/null
fi

### Install git
echo "Installing git locally..."
GIT=git-2.16.2
GIT_LOG=../log/git.log

if [ ! -e $GIT ]
then
    tar xf $GIT.tar.gz
fi

if [ ! -e ../bin/git ]
then
    pushd $GIT > /dev/null
    make prefix=$LOCALDIR all > $GIT_LOG 2>&1
    make prefix=$LOCALDIR install >> $GIT_LOG 2>&1
    popd > /dev/null
fi
