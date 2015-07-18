FROM otechlabs/base
# TARGET_IMAGE_NAME zabbix_java_gateway:0.2

MAINTAINER Oleksandr Bezpalko <obezpalko@gmail.com>
RUN apt-get update
# Update base images.
RUN $APT_INSTALL zabbix-java-gateway && \
    apt-get -y autoclean autoremove && \
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
