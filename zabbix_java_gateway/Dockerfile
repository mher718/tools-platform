FROM otechlabs/base
# TARGET_IMAGE_NAME zabbix_java_gateway:0.1

MAINTAINER Oleksandr Bezpalko <obezpalko@gmail.com>
#RUN rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
RUN apt-get update
# Update base images.
RUN $APT_INSTALL zabbix-java-gateway && \
    apt-get -y autoclean autoremove && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN mkdir -p /var/run/zabbix /var/log/zabbix-java-gateway && \
    chown zabbix /var/log/zabbix-java-gateway && \
    ln -sf /etc/zabbix/service /etc/service/zabbix_java_gateway

EXPOSE 10052

VOLUME ["/etc/zabbix"]
