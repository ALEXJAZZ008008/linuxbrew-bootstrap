#!/bin/bash
WGET="wget"

which wget > /dev/null || WGET="curl"
which curl > /dev/null || WGET=""

if [ "$WGET" = "" ]
then
    echo "Cannot find wget or curl. Stop downloading."
    exit 1
fi

download(){
    if [ "$3" != "" ]
    then
        f=$3
    else
        f=${1##*/}
    fi
    
    if [ ! -e "$f" ]
    then
        if [ "$WGET" = "wget" ]
        then
            wget $1
        else
            curl -L --output ${1##*/} $1
        fi
        
        if [ "$3" != "" ]
        then
            mv ${1##*/} $f
        fi
    fi
    
    if [[ ! -e "$f" || $(md5sum $f | awk '{print $1}') != "$2" ]]
    then
        echo "Fail to download $f, please try again."
        rm $f 2> /dev/null
        
        exit 1
    fi
}

download "https://ftp.gnu.org/gnu/autoconf/autoconf-2.69.tar.gz" "82d05e03b93e45f5a39b828dc9c6c29b"
download "https://ftp.gnu.org/gnu/automake/automake-1.16.1.tar.gz" "83cc2463a4080efd46a72ba2c9f6b8f5"
download "https://github.com/curl/curl/releases/download/curl-7_60_0/curl-7.60.0.tar.gz" "48eb126345d3b0f0a71a486b7f5d0307"
download "https://github.com/libexpat/libexpat/archive/R_2_2_5.tar.gz" "0411599b3a407b318900f7c5886a0e74" "expat-2.2.5.tar.gz"
download "https://ftp.gnu.org/gnu/gettext/gettext-0.19.8.1.tar.gz" "97e034cf8ce5ba73a28ff6c3c0638092"
download "http://ftp.riken.jp/Linux/kernel.org/software/scm/git/git-2.16.2.tar.gz" "c2ed191d40692f3b595dc38374a11146"
download "https://ftp.gnu.org/gnu/libtool/libtool-2.4.6.tar.gz" "addf44b646ddb4e3919805aa88fa7c5e"
download "https://ftp.gnu.org/gnu/m4/m4-1.4.18.tar.gz" "a077779db287adf4e12a035029002d28"
download "https://ftp.openssl.org/source/openssl-1.0.2o.tar.gz" "44279b8557c3247cbe324e2322ecd114"
download "https://github.com/Homebrew/homebrew-portable-ruby/releases/download/2.3.7/portable-ruby-2.3.7.x86_64_linux.bottle.tar.gz" "6c6540c56565eff2a51484f102fc5b99"
download "https://zlib.net/zlib-1.2.11.tar.gz" "1c9f62f0778697a09d36121ead88e08e"
