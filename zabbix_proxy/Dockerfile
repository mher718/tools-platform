FROM otechlabs/base
# TARGET_IMAGE_NAME zabbix_proxy:1.1

MAINTAINER Oleksandr Bezpalko <obezpalko@gmail.com>

RUN apt-get update && \
    $APT_INSTALL libsnmp-dev libsnmp-base snmp-mibs-downloader \
    zabbix-proxy-sqlite3 fping 

RUN sed -i 's/START=.*$/START=yes/' /etc/default/zabbix-proxy && \
    sed -i 's#DBName=.*$#DBName=/var/lib/zabbix/zabbix.sqlite3# \
            ; s#Server=.*$#Server=zabbix.otlabs.fr# \
            ; /^Hostname=/d \
            ; /^#/d; /^$/d ' /etc/zabbix/zabbix_proxy.conf && \
    echo 'StartDiscoverers=5' >> /etc/zabbix/zabbix_proxy.conf && \
    /bin/echo -e 'DebugLevel=0\nExternalScripts=/etc/zabbix/scripts\nTimeout=30\nCacheSize=32M\n' >> /etc/zabbix/zabbix_proxy.conf && \
    /bin/echo -e 'HistoryCacheSize=32M\nHistoryTextCacheSize=32M\n' >> /etc/zabbix/zabbix_proxy.conf && \
    /bin/echo -e 'StartDiscoverers=5\nStartPingers=5\nStartPollersUnreachable=5\nStartPollers=25\n' >> /etc/zabbix/zabbix_proxy.conf && \
    /bin/echo -e 'StartTrappers=15\nStartHTTPPollers=5\nProxyOfflineBuffer=5\n' >> /etc/zabbix/zabbix_proxy.conf && \
    /bin/echo -e 'SNMPTrapperFile=/var/log/snmptt/snmptt.log\nStartSNMPTrapper=1\n' >> /etc/zabbix/zabbix_proxy.conf && \
    [ -d /etc/zabbix/scripts ] || mkdir /etc/zabbix/scripts && \
    [ -d /etc/zabbix/scripts ] || mkdir -p /var/run/zabbix && chown zabbix /var/run/zabbix

COPY zabbix_proxy_run /etc/service/zabbix_proxy/run


RUN apt-get -y autoclean autoremove && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

EXPOSE 10051
VOLUME ["/var/log/snmptt"]
