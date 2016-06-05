alpine-zk 
==============

This image is the zookeeper base. It comes from rawmind/alpine-jvm8.

## Build

```
docker build -t rawmind/alpine-zk:<version> .
```

## Versions

- `3.4.8-1` [(Dockerfile)](https://github.com/rawmind0/alpine-zk/blob/3.4.8-1/Dockerfile)
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


### Custom Configuration

Zookeeper is installed under /opt/zk and make use of /opt/zk/conf/myid and /opt/zk/conf/zoo.cfg.

You can edit this files in order customize configuration

You could also include FROM rawmind/alpine-zk at the top of your Dockerfile, and add your custom config.

### Rancher

If you are running it in rancher, you could run [rancher-zk][rancher-zk] as a sidekick to get dynamic configuration.


## Example

See [rancher-example][rancher-example], that run zookeeper in a rancher system with dynamic configuration.



[zookeeper]: https://zookeeper.apache.org
[rancher-zk]: https://hub.docker.com/r/rawmind/rancher-zk/
[rancher-example]: https://github.com/rawmind0/alpine-zk/tree/master/rancher
