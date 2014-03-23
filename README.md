ladder
======

顾名思义，作用你懂的！

在UNIX like系统，包括Linux、Mac OS X甚至Windows下的Cygwin，在Terminal中运行命令：

* mkdir ladder
* cd ladder
* curl -L git.io/lddr | sh
* ./start.sh

注意，运行上面的命令前，需要确保你的系统中已经安装有基本工具curl，wget，bash，依赖库OpenSSL开发包，pthread开发包，以及开发工具gnu make，gcc等。

完成以上步骤后，你的系统中就已经有了3个代理端口，分别是：

* 127.0.0.1:58117 一个socks5代理端口，后端连接多个shadowsocks，并使用roundrobin负载均衡算法；
* 127.0.0.1:58118 一个http代理端口，可代理http和https协议，后端连接58117端口，如果能直接连通，则直连，在不能直接连接的时候走58117端口；
* 127.0.0.1:58119 一个http代理端口，可代理http协议，后端连接Google压缩代理；

推荐在浏览器代理设置中使用ladder.pac，此pac文件根据autoproxy项目的gfwlist列表，配置只有被墙的域名才走代理，http地址走58119端口，https地址走58118端口，其他地址直连。

# 感谢 
* [cow](https://github.com/cyfdecyf/cow)
* [shadowsocks-libev](https://github.com/madeye/shadowsocks-libev/)
* [haproxy](http://haproxy.1wt.eu/)
* [gfwlist2pac](https://github.com/clowwindy/gfwlist2pac/)
* 以及所有为anti gfw贡献过力量的人们
