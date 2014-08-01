#!/bin/bash
#########################################################################
# File Name: ladder.sh
# Author: Fan Yang
# mail: missdeer@dfordsoft.com
# Created Time: 二  3/11 19:50:39 2014
#########################################################################
wget http://hp.codefast.tk/download/1.5/src/snapshot/haproxy-ss-LATEST.tar.gz 
tar xzvf haproxy-ss-LATEST.tar.gz 
cd $(ls haproxy* | grep -o "haproxy\-ss\-[0-9]\{8,8\}")
os=`uname -s`
case $os in
    "FreeBSD")
        gmake USE_OPENSSL=1 TARGET=freebsd
        ;;
    "OpenBSD")
        make USE_OPENSSL=1 TARGET=openbsd
        ;;
    "CYGWIN_NT-6.1" | "CYGWIN_NT-6.0" | "CYGWIN_NT-7.0")
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
version=0.9.2
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

postfix="gz"
case $os in
    "Darwin")
        os="mac"
        ;;
    "Linux")
        os="linux"
        ;;
    *)
        os="win"
        postfix="zip"
        ;;
esac
cp shadowsocks-libev/src/ss-local* ./
cp $(ls haproxy* | grep -o "haproxy\-ss\-[0-9]\{8,8\}")/haproxy* ./
rm -rf haproxy-ss-* shadowsocks-libev/
curl -3 -L -o ./cowrc https://github.com/missdeer/ladder/raw/master/cowrc
curl -3 -L -o ./haproxy.cfg https://github.com/missdeer/ladder/raw/master/haproxy.cfg
curl -3 -L -o ./ladder.pac https://github.com/missdeer/ladder/raw/master/ladder.pac
curl -3 -L -o ./start.sh https://github.com/missdeer/ladder/raw/master/start.sh
chmod a+x ./start.sh
curl -3 -L -o ./stop.sh https://github.com/missdeer/ladder/raw/master/stop.sh
chmod a+x ./stop.sh
bin=cow-$os$arch-$version
binary_url="http://dl.chenyufei.info/cow/$bin.$postfix"
if [[ "$os" == "win" ]]
then
    haproxy -f ./haproxy.cfg -p ./haproxy.pid
    wget -t0 -T10 -e http-proxy=127.0.0.1:58119 -O./cow.$postfix "$binary_url"
    taskkill /F /IM haproxy.exe /T
    unzip cow.$postfix 
    curl -3 -L -o ./start.bat https://github.com/missdeer/ladder/raw/master/start.bat
    curl -3 -L -o ./stop.bat https://github.com/missdeer/ladder/raw/master/stop.bat
else
    $(pwd)/haproxy -f $(pwd)/haproxy.cfg -p $(pwd)/haproxy.pid
    wget -t0 -T10 -e http-proxy=127.0.0.1:58119 -O./cow.$postfix "$binary_url"
    killall haproxy
    gunzip cow.$postfix 
    chmod a+x cow 
fi
