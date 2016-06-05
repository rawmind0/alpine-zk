FROM rawmind/alpine-jvm8:1.8.74-1
MAINTAINER Raul Sanchez <rawmind@gmail.com>

ENV SERVICE_NAME=zk \
    SERVICE_HOME=/opt/zk \
    SERVICE_VERSION=3.4.8 \
    SERVICE_USER=zookeeper \
    SERVICE_UID=10002 \
    SERVICE_GROUP=zookeeper \
    SERVICE_GID=10002 \
    PATH=/opt/zk/bin:${PATH}

# Install service software
RUN SERVICE_RELEASE=zookeeper-${SERVICE_VERSION} \
  && curl -sS -k http://apache.rediris.es/zookeeper/${SERVICE_RELEASE}/${SERVICE_RELEASE}.tar.gz | gunzip -c - | tar -xf - -C /opt \
  && mv /opt/zookeeper-* ${SERVICE_HOME} \
  && mkdir -p ${SERVICE_HOME}/logs ${SERVICE_HOME}/data \
  && ln -sf /proc/1/fd/1 /opt/zk/logs/zookeeper.out \
  && chmod +x ${SERVICE_HOME}/bin/*.sh \
  && addgroup -g ${SERVICE_GID} ${SERVICE_GROUP} \
  && adduser -g "${SERVICE_NAME} user" -D -h ${SERVICE_HOME} -G ${SERVICE_GROUP} -s /sbin/nologin -u ${SERVICE_UID} ${SERVICE_USER} 
ADD root /
RUN chmod +x ${SERVICE_HOME}/bin/*.sh \
  && chown -R ${SERVICE_USER}:${SERVICE_GROUP} ${SERVICE_HOME} /opt/monit

USER $SERVICE_USER
WORKDIR $SERVICE_HOME

EXPOSE 2181 2888 3888