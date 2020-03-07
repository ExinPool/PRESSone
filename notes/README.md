# PRESSone Notes

> PRESSone Notes.

[![License](http://img.shields.io/:license-mit-blue.svg?style=flat-square)](http://badges.mit-license.org)

## Table of Contents

- [Notes](Notes)
- [Contributing](#contributing)
- [Team](#team)
- [FAQ](#faq)
- [Support](#support)
- [License](#license)

## Notes

Q: 服务器系统有推荐的吗？

> A: 建议使用 Ubuntu 16.04 以上的系统。

Q: 服务器配置文件包下载地址？

> A: http://sc1.code2048.com/prsnode/yourbpname.tar.gz

``` bash
把 yourbpname 替换为您的节点，比如我们是 ExinPool，下载地址是

http://sc1.code2048.com/prsnode/exinpool.tar.gz

可以使用 wget http://sc1.code2048.com/prsnode/exinpool.tar.gz 下载。
```

Q: Error: message authentication code mismatch

> A: 密码错误。还有可能是密码没错，复制到 SSH 客户端带了特殊字符，可以尝试关闭 SSH 客户端再打开操作。

Q: cleos 命令哪里来？

> A: 参考 [https://github.com/EOSIO/eos/blob/master/README.md](https://github.com/EOSIO/eos/blob/master/README.md).

``` bash
# Ubuntu 18.04 Package Install
$ wget https://github.com/eosio/eos/releases/download/v2.0.3/eosio_2.0.3-1-ubuntu-18.04_amd64.deb
$ sudo apt install ./eosio_2.0.3-1-ubuntu-18.04_amd64.deb

# Mac OS X Brew Install
$ brew tap eosio/eosio
$ brew install eosio
```

Q: Docker 启动节点后，如何检测节点状态。

> A: 首先确保安装好 cleos，然后多次执行如下命令，如果 head_block_num 一直在变化，证明节点在同步数据中。

``` bash
$ cleos -u http://127.0.0.1:8888 get info
```

Q: `cleos -u http://127.0.0.1:8888 get info` chain_id 不同，head_block_num 为 1。

> A: 正确的 chain_id 为 `3e862a165d4576aef33af5fec649073dc51362a97d8df43fc6a4331fc1c6764f`。使用这个 [genesis.json](http://sc1.code2048.com/prsnode0306/genesis.json) 覆盖，然后重启 Docker。

Q: 抵押余额没有增加。

> A: 支付超时，耐心等待处理。

Q: 100W PRS 抵押未完成，可以启动节点吗？

> A: 可以，100W PRS 未完全抵押，只影响节点出块，不影响同步数据。

Q: 防火墙开放哪些端口？

> A: 出站全开放，入站开放增加 8888、9876。当然不能把 SSH 端口删掉了。

Q: sudo: ./runservice.sh: command not found

> A: chmod +x runservice.sh，将文件改成可执行。

Q: Docker 基本操作。

``` bash
# 查看进程
$ sudo docker ps -a

# 查看日志
$ sudo docker logs -f $CONTAINER_ID

# 重启 CONTAINER
$ sudo docker restart $CONTAINER_ID

# 关闭 CONTAINER
$ sudo docker stop $CONTAINER_ID
```

## Contributing

To be continued.

## Team

@ExinPool

## FAQ

To be continued.

## Support

Reach out to us at one of the following places!

- Website at <a href="https://exinpool.com" target="_blank">`exinpool.com`</a>
- Twitter at <a href="http://twitter.com/ExinPool" target="_blank">`@ExinPool`</a>
- Email at `robin@exin.one`

## License

[![License](http://img.shields.io/:license-mit-blue.svg?style=flat-square)](http://badges.mit-license.org)

- **[MIT license](https://opensource.org/licenses/mit-license.php)**
- Copyright 2019 © <a href="https://exinpool.com" target="_blank">ExinPool</a>.