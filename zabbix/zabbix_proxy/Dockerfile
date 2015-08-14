FROM otechlabs/zabbix:common-2.4.6-1
# TARGET_IMAGE_NAME otechlabs/zabbix:proxy-2.4.6-1

MAINTAINER Oleksandr Bezpalko <obezpalko@gmail.com>

RUN $APT_INSTALL libsnmp-dev libsnmp-base snmp-mibs-downloader \
    zabbix-proxy-sqlite3 fping 

RUN [ -d /etc/zabbix/scripts ] || mkdir /etc/zabbix/scripts
RUN [ -d /var/run/zabbix ] || mkdir -p /var/run/zabbix && chown zabbix /var/run/zabbix

# COPY bg2fg /usr/local/bin/bg2fg

RUN apt-get -y autoclean && apt-get -y autoremove && apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

EXPOSE 20051
VOLUME ["/var/log/snmptt"]
