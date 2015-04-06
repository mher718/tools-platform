FROM otechlabs/base
# TARGET_IMAGE_NAME zabbix_server:0.6

MAINTAINER Oleksandr Bezpalko <obezpalko@gmail.com>

# Update base images.
RUN echo 'deb http://archive.ubuntu.com/ubuntu/ trusty multiverse' >> /etc/apt/sources.list && \
    apt-get update -q && \
    apt-get -y -q --no-install-recommends install libsnmp-dev libsnmp-base libsnmp-perl libnet-snmp-perl \
    librrds-perl mysql-common passwd libjson-perl pwgen \
    zabbix-server-mysql snmp-mibs-downloader monit fping && \
    apt-get -y autoclean autoremove 

RUN mkdir -p     /var/run/zabbix /etc/zabbix/zabbix_server.conf.d /etc/zabbix/scripts && \
    chown zabbix /var/run/zabbix /etc/zabbix/zabbix_server.conf.d /etc/zabbix/scripts && \
    sed -i '/^#/d; /^$/d; /^DB/d' /etc/zabbix/zabbix_server.conf

EXPOSE 10051

COPY zabbix_server.py /etc/service/zabbix_server/run

VOLUME ["/etc/zabbix/zabbix_server.conf", "/etc/zabbix/zabbix_server.conf.d", "/etc/zabbix/scripts"]

