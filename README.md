[![](https://images.microbadger.com/badges/image/rawmind/alpine-zk.svg)](https://microbadger.com/images/rawmind/alpine-zk "Get your own image badge on microbadger.com")

alpine-zk 
==============

This image is the zookeeper base. It comes from [alpine-jvm8][alpine-jvm8].
[![](https://imagelayers.io/badge/rawmind/alpine-zk:3.4.8-13.svg)](https://imagelayers.io/?images=rawmind/alpine-zk:3.4.8-13 'Get your own badge on imagelayers.io')

## Build

```
docker build -t rawmind/alpine-zk:<version> .
```

## Versions

- `3.4.9-2` [(Dockerfile)](https://github.com/rawmind0/alpine-zk/blob/3.4.9-2/Dockerfile)
- `3.4.8-16` [(Dockerfile)](https://github.com/rawmind0/alpine-zk/blob/3.4.8-16/Dockerfile)
- `3.4.6-1` [(Dockerfile)](https://github.com/rawmind0/alpine-zk/blob/3.4.6-1/Dockerfile)

## Configuration

This image runs [zookeeper][zookeeper] with monit. Zookeeper is started with user and group "zookeeper".

Besides, you can customize the configuration in several ways:

### Default Configuration

zookeeper is installed with the default configuration and some parameters can be overrided with env variables:

- ZK_DATA_DIR="/opt/zk/data"
- ZK_INIT_LIMIT="10"
- ZK_MAX_CLIENT_CXNS="500"
- ZK_SYNC_LIMIT="5"
- ZK_TICK_TIME="2000"
- ZK_SERVER="127.0.0.1"

 
### Custom Configuration

Zookeeper is installed under /opt/zk and make use of /opt/zk/conf/myid and /opt/zk/conf/zoo.cfg.

You can edit this files in order customize configuration

You could also include FROM rawmind/alpine-zk at the top of your Dockerfile, and add your custom config.

### Rancher

If you are running it in rancher, you could run [rancher-zk][rancher-zk] as a sidekick to get dynamic configuration.

### k8s

If you are running it in k8s, you could run [k8s-zk][k8s-zk] at the same pod to get dynamic configuration.

## Example

See [rancher-example][rancher-example], rancher catalog package that runs zookeeper in a cattle environment with dynamic configuration.

See [k8s-example][k8s-example], rancher catalog package that runs zookeeper in a k8s environment with dynamic configuration.


[alpine-jvm8]: https://github.com/rawmind0/alpine-jvm8/
[zookeeper]: https://zookeeper.apache.org
[rancher-zk]: https://hub.docker.com/r/rawmind/rancher-zk/
[k8s-zk]: https://hub.docker.com/r/rawmind/k8s-zk/
[rancher-example]: https://github.com/rawmind0/alpine-zk/tree/master/rancher
[k8s-example]: https://github.com/rawmind0/alpine-zk/tree/master/k8s
