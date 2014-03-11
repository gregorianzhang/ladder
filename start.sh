#!/bin/bash
./ss-local -f ./ss1.pid -s 54.241.100.182 -p 51280 -l 58111 -k qwersdSERsdf -m rc4
./ss-local -f ./ss2.pid -s 54.235.31.183 -p 51280 -l 58112 -k qwersdSERsdf -m rc4
./ss-local -f ./ss3.pid -s 54.216.38.67 -p 51280 -l 58113 -k qwersdSERsdf -m rc4
./ss-local -f ./ss4.pid -s 54.248.202.250 -p 51280 -l 58114 -k qwersdSERsdf -m rc4
./ss-local -f ./ss5.pid -s 46.137.233.181 -p 51280 -l 58115 -k qwersdSERsdf -m rc4 
./haproxy -f ./haproxy.cfg -p ./haproxy.pid
./cow &
echo "Please add file://$(pwd)/ladder.pac into your browser/system connection settings." 
