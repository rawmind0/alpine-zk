FROM rawmind/alpine-jvm8:1.8.74
MAINTAINER Raul Sanchez <rawmind@gmail.com>

ENV SERVICE_NAME=zk \
    SERVICE_HOME=/opt/zk \
    SERVICE_VERSION=3.4.8 \
    PATH=/opt/zk/bin:${PATH}

# Install service software
RUN SERVICE_RELEASE=zookeeper-${SERVICE_VERSION} \
  && curl -sS -k http://apache.rediris.es/zookeeper/${SERVICE_RELEASE}/${SERVICE_RELEASE}.tar.gz | gunzip -c - | tar -xf - -C /opt \
  && mv /opt/zookeeper-* ${SERVICE_HOME} \
  && mkdir -p ${SERVICE_HOME}/logs ${SERVICE_HOME}/data \
  && chmod +x ${SERVICE_HOME}/bin/*.sh 
ADD root /
RUN chmod +x ${SERVICE_HOME}/bin/*.sh

WORKDIR $SERVICE_HOME

