#!/bin/bash
appname=`basename $0 | sed s,\.sh$,,`
dirname=`dirname $0`
tmp="${dirname#?}"

if [ "${dirname%$tmp}" != "/" ]; then
  dirname=$PWD/$dirname
fi
# 以下信息请勿大规模外传，更严禁用于商业用途或其他破坏各国法律的行为
$dirname/ss-local -f $dirname/ss1.pid -s 54.241.100.182 -p 51280 -l 58111 -k qwersdSERsdf -m rc4
$dirname/ss-local -f $dirname/ss2.pid -s 54.235.31.183 -p 51280 -l 58112 -k qwersdSERsdf -m rc4
$dirname/ss-local -f $dirname/ss3.pid -s 54.216.38.67 -p 51280 -l 58113 -k qwersdSERsdf -m rc4
$dirname/ss-local -f $dirname/ss4.pid -s 54.248.202.250 -p 51280 -l 58114 -k qwersdSERsdf -m rc4
$dirname/ss-local -f $dirname/ss5.pid -s 46.137.233.181 -p 51280 -l 58115 -k qwersdSERsdf -m rc4 
$dirname/ss-local -f $dirname/ss6.pid -s 192.3.18.91 -p 23333 -l 58110 -k shadowsocks.netASA -m aes-256-cfb
$dirname/ss-local -f $dirname/ss7.pid -s p.galdb.net -p 8020 -l 58109 -k qazwsx -m aes-256-cfb
$dirname/ss-local -f $dirname/ss8.pid -s ss.jybox.net -p 65535 -l 58108 -k "6Zi/54u45Za1" -m aes-256-cfb
$dirname/ss-local -f $dirname/ss9.pid -s 65.181.120.20 -p 56902 -l 58107 -k AkumAngel -m rc2-cfb
$dirname/ss-local -f $dirname/ss10.pid -s 5.231.62.198 -p 8981 -l 58106 -k justforfun -m aes-256-cfb
$dirname/haproxy -f $dirname/haproxy.cfg -p $dirname/haproxy.pid
$dirname/cow -rc="$dirname/cowrc" &
echo "Please add file://$(pwd)/ladder.pac into your browser/system connection settings." 
