FROM otechlabs/zabbix:common-2.4.6-1
# TARGET_IMAGE_NAME otechlabs/zabbix:java_gateway-2.4.6-1

MAINTAINER Oleksandr Bezpalko <obezpalko@gmail.com>
# Update base images.
# RUN apt-get update
RUN $APT_INSTALL zabbix-java-gateway
RUN apt-get -y autoclean autoremove && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN mkdir -p /var/run/zabbix /var/log/zabbix-java-gateway && \
    chown zabbix /var/log/zabbix-java-gateway

EXPOSE 20052

CMD ["/usr/bin/java", "-Xmx256m", "-server", \
    "-Dzabbix.pidFile=/var/run/zabbix/zabbix_java_gateway.pid", \
    "-Dzabbix.listenPort=20052", \
    "-Dzabbix.startPollers=10", \
    "-Dlogback.configurationFile=/etc/zabbix/zabbix_java_gateway.logback.xml", \
    "-Djava.library.path=/usr/lib/jni", \
    "-jar", "/usr/sbin/zabbix-java-gateway.jar"]
