FROM otechlabs/zabbix:common-2.4.6-1
# TARGET_IMAGE_NAME otechlabs/zabbix:server-2.4.6-1

MAINTAINER Oleksandr Bezpalko <obezpalko@gmail.com>
RUN apt-get update
# Update base images.
RUN $APT_INSTALL libsnmp-dev libsnmp-base libsnmp-perl libnet-snmp-perl \
    librrds-perl mysql-common passwd libjson-perl pwgen mysql-client
RUN $APT_INSTALL snmp-mibs-downloader fping
RUN $APT_INSTALL zabbix-server-mysql

RUN mkdir -p /var/run/zabbix /etc/zabbix/zabbix_server.conf.d /etc/zabbix/scripts /etc/service/zabbix_server && \
    chown zabbix /var/run/zabbix /etc/zabbix/zabbix_server.conf.d /etc/zabbix/scripts && \
    sed -i '/^#/d; /^$/d; /^DB/d' /etc/zabbix/zabbix_server.conf


RUN apt-get -y autoremove && \
    apt-get -y autoclean && \
    apt-get -y clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

EXPOSE 10051

COPY zabbix_server.py /etc/service/zabbix_server/run
COPY files/*.mib /usr/share/snmp/mibs/
COPY db_init.sh /sbin/db_init.sh

VOLUME ["/var/log/snmptt"]
