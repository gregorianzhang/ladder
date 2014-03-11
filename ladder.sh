#!/bin/bash
#########################################################################
# File Name: ladder.sh
# Author: Fan Yang
# mail: missdeer@dfordsoft.com
# Created Time: 二  3/11 19:50:39 2014
#########################################################################
wget http://haproxy.1wt.eu/download/1.5/src/snapshot/haproxy-ss-LATEST.tar.gz 
tar xzvf haproxy-ss-LATEST.tar.gz 
cd $(ls haproxy* | grep -o "haproxy\-ss\-[0-9]\{8,8\}")
os=`uname -s`
case $os in
    "FreeBSD")
        make USE_OPENSSL=1 TARGET=freebsd
        ;;
    "OpenBSD")
        make USE_OPENSSL=1 TARGET=openbsd
        ;;
    "Cygwin")
        make USE_OPENSSL=1 TARGET=cygwin
        ;;
    "Linux")
        make USE_OPENSSL=1 TARGET=linux2628
        ;;
    *)
        make USE_OPENSSL=1 TARGET=generic
        ;;
esac
cd ..
git clone https://github.com/madeye/shadowsocks-libev.git
cd shadowsocks-libev
./configure && make
cd ..
version=0.9.1
arch=`uname -m`
case $arch in
    "x86_64")
        arch="64"
        ;;
    "i386" | "i586" | "i486" | "i686")
        arch="32"
        ;;
    "armv5tel" | "armv6l" | "armv7l")
        arch="-$arch"
        ;;
    *)
        echo "$arch currently has no precompiled binary"
        ;;
esac

case $os in
    "Darwin")
        os="mac"
        ;;
    "Linux")
        os="linux"
        ;;
    *)
        echo "$os currently has no precompiled binary"
        exit 1
esac
bin=cow-$os$arch-$version
binary_url="http://dl.chenyufei.info/cow/$bin.gz"
wget -t0 -T10 -O./cow.gz "$binary_url"
gunzip cow.gz 
chmod a+x cow 
cp shadowsocks-libev/src/ss-local ./
cp $(ls haproxy* | grep -o "haproxy\-ss\-[0-9]\{8,8\}")/haproxy ./
rm -rf haproxy-ss-* shadowsocks-libev/
mkdir $HOME/.cow
wget -O $HOME/.cow/rc https://raw.github.com/missdeer/ladder/master/cowrc
wget -O ./haproxy.cfg https://raw.github.com/missdeer/ladder/master/haproxy.cfg
wget -O ladder.pac https://raw.github.com/missdeer/ladder/master/ladder.pac
