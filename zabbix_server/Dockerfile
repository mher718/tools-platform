FROM otechlabs/base
# TARGET_IMAGE_NAME zabbix_server:0.4

MAINTAINER Oleksandr Bezpalko <obezpalko@gmail.com>

# Update base images.
RUN apt-get update -q && \
    apt-get -y -q --no-install-recommends install libsnmp-dev libsnmp-base libsnmp-perl libnet-snmp-perl \
    librrds-perl mysql-common passwd libjson-perl pwgen \
    zabbix-server-mysql monit fping && \
    apt-get -y autoclean autoremove 

RUN mkdir -p     /var/run/zabbix /etc/zabbix/zabbix_server.conf.d /etc/zabbix/scripts && \
    chown zabbix /var/run/zabbix /etc/zabbix/zabbix_server.conf.d /etc/zabbix/scripts && \
    echo > /etc/monitrc && \
    echo "set init" >> /etc/monitrc && \
    echo "set daemon 15" >> /etc/monitrc && \
    echo "set httpd" >> /etc/monitrc && \
    echo "  port 2812" >> /etc/monitrc && \
    echo "  allow myuser:`pwgen 10 1`" >> /etc/monitrc && \
    echo "check process zabbix-server with pidfile /var/run/zabbix/zabbix_server.pid" >> /etc/monitrc && \
    echo '  start program = "/usr/sbin/service zabbix-server start"' >> /etc/monitrc && \
    echo '  stop program = "/usr/sbin/service zabbix-server stop"' >> /etc/monitrc && \
    chmod 0600 /etc/monitrc && \
    sed -i 's/START=.*$/START=yes/' /etc/default/zabbix-server

RUN sed -i '/^#/d; /^$/d; /^DB/d' /etc/zabbix/zabbix_server.conf

EXPOSE 10051 2812
VOLUME ["/etc/zabbix/zabbix_server.conf", "/etc/zabbix/zabbix_server.conf.d", "/etc/zabbix/scripts"]

CMD ["/usr/bin/monit", "-I", "-c/etc/monitrc" ]
