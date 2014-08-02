#!/bin/bash
appname=`basename $0 | sed s,\.sh$,,`
dirname=`dirname $0`
tmp="${dirname#?}"

if [ "${dirname%$tmp}" != "/" ]; then
  dirname=$PWD/$dirname
fi
# 以下信息请勿大规模外传，更严禁用于商业用途或其他破坏各国法律的行为
$dirname/ss-local -f $dirname/ss01.pid -s 46.137.233.181 -p 51280 -l 58115 -k qwersdSERsdf -m rc4 
$dirname/ss-local -f $dirname/ss02.pid -s 54.248.202.250 -p 51280 -l 58114 -k qwersdSERsdf -m rc4
$dirname/ss-local -f $dirname/ss03.pid -s 54.216.38.67 -p 51280 -l 58113 -k qwersdSERsdf -m rc4
$dirname/ss-local -f $dirname/ss04.pid -s 54.235.31.183 -p 51280 -l 58112 -k qwersdSERsdf -m rc4
$dirname/ss-local -f $dirname/ss05.pid -s 54.241.100.182 -p 51280 -l 58111 -k qwersdSERsdf -m rc4
#$dirname/ss-local -f $dirname/ss06.pid -s 192.227.232.252 -p 8234 -l 58110 -k !renrufei! -m BF-CFB
#$dirname/ss-local -f $dirname/ss07.pid -s 69.163.37.148 -p 443 -l 58109 -k WOcaoNIMAdeGFW -m AES-256-CFB
#$dirname/ss-local -f $dirname/ss08.pid -s 23.226.224.215 -p 443 -l 58108 -k 0604 -m AES-256-CFB
#$dirname/ss-local -f $dirname/ss09.pid -s 23.245.26.112 -p 8090 -l 58107 -k helloworld2014 -m AES-256-CFB
#$dirname/ss-local -f $dirname/ss10.pid -s 199.180.252.39 -p 63210 -l 58106 -k h314159az -m AES-256-CFB
#$dirname/ss-local -f $dirname/ss11.pid -s 198.199.93.248 -p 8123 -l 58105 -k publish! -m AES-256-CFB
#$dirname/ss-local -f $dirname/ss12.pid -s 107.150.5.180 -p 8080 -l 58104 -k cielpy5 -m AES-256-CFB
$dirname/ss-local -f $dirname/ss13.pid -s 192.243.116.154 -p 443 -l 58103 -k freeworld -m AES-256-CFB
#$dirname/ss-local -f $dirname/ss14.pid -s 192.184.88.98 -p 443 -l 58102 -k ShadowSocks.NET  -m AES-256-CFB
#$dirname/ss-local -f $dirname/ss15.pid -s 23.227.161.57 -p 443 -l 58101 -k 8NXR4eY6bhXG -m AES-128-CFB
#$dirname/ss-local -f $dirname/ss16.pid -s 54.200.212.215 -p 8388 -l 58100 -k free1234 -m AES-256-CFB
#$dirname/ss-local -f $dirname/ss17.pid -s 107.181.153.26 -p 12321 -l 58099 -k !fuck_gfw! -m AES-128-CFB
#$dirname/ss-local -f $dirname/ss18.pid -s 27.120.120.134 -p 945 -l 58098 -k v2Ex -m AES-256-CFB
$dirname/haproxy -f $dirname/haproxy.cfg -p $dirname/haproxy.pid
$dirname/cow -rc="$dirname/cowrc" &
echo "Please add file://$(pwd)/ladder.pac into your browser/system connection settings." 
