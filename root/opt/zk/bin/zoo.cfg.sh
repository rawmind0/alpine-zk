#!/usr/bin/env sh

cat << EOF > ${SERVICE_HOME}/conf/zoo.cfg
tickTime=${ZK_TICK_TIME}
initLimit=${ZK_INIT_LIMIT}
syncLimit=${ZK_SYNC_LIMIT}
dataDir=${ZK_DATA_DIR}
maxClientCnxns=${ZK_MAX_CLIENT_CXNS}
clientPort=2181
autopurge.snapRetainCount=3
autopurge.purgeInterval=1
server.0 = 127.0.0.1:2888:3888
EOF
