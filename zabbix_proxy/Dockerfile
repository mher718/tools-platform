FROM otechlabs/base
# TARGET_IMAGE_NAME zabbix_proxy:1.2

MAINTAINER Oleksandr Bezpalko <obezpalko@gmail.com>

RUN apt-get update && \
    $APT_INSTALL libsnmp-dev libsnmp-base snmp-mibs-downloader \
    zabbix-proxy-sqlite3 fping 

RUN sed -i 's/START=.*$/START=yes/' /etc/default/zabbix-proxy
RUN [ -d /etc/zabbix/scripts ] || mkdir /etc/zabbix/scripts
RUN [ -d /var/run/zabbix ] || mkdir -p /var/run/zabbix && chown zabbix /var/run/zabbix

COPY bg2fg /usr/local/bin/bg2fg

RUN apt-get -y autoclean && apt-get -y autoremove && apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

EXPOSE 10051
VOLUME ["/var/log/snmptt", "/var/log/zabbix-proxy"]
