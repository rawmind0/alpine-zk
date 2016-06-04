#!/usr/bin/env bash

SERVICE_NAME=zk
SERVICE_HOME=${SERVICE_HOME:-"/opt/zk"}

ZK_DATA_DIR=${ZK_DATA_DIR:"/opt/zk/data"}
ZK_INIT_LIMIT=${ZK_INIT_LIMIT:-"10"}
ZK_MAX_CLIENT_CXNS=${ZK_MAX_CLIENT_CXNS:"500"}
ZK_SYNC_LIMIT=${ZK_SYNC_LIMIT:-"5"}
ZK_TICK_TIME=${ZK_TICK_TIME:-"2000"}

function log {
        echo `date` $ME - $@
}

function serviceDefault {
    log "[ Applying default ${SERVICE_NAME} configuration... ]"
    ${SERVICE_HOME}/bin/zoo.cfg.sh
}

function serviceConf {
    log "[ Applying dinamic ${SERVICE_NAME} configuration... ]"
    while [ ! -f ${SERVICE_HOME}/conf/zoo.cfg ]; do
        log "  Waiting for ${SERVICE_NAME} configuration..."
        sleep 3 
    done
}

function serviceCheck {
    log "[ Checking ${SERVICE_NAME} configuration... ]"

    if [ -d "/opt/tools" ]; then
        serviceConf
    else
        serviceDefault
    fi
}

function serviceStart {
    log "[ Starting ${SERVICE_NAME}... ]"
    serviceCheck
    ${SERVICE_HOME}/bin/zkServer.sh start
}

function serviceStop {
    log "[ Stoping ${SERVICE_NAME}... ]"
    ${SERVICE_HOME}/bin/zkServer.sh stop
}

function serviceRestart {
    log "[ Restarting ${SERVICE_NAME}... ]"
    serviceStop
    serviceStart
}

case "$1" in
        "start")
            serviceStart
        ;;
        "stop")
            serviceStop
        ;;
        "restart")
            serviceRestart
        ;;
        *) echo "Usage: $0 restart|start|stop"
        ;;

esac
