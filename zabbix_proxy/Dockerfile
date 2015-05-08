FROM otechlabs/base
# TARGET_IMAGE_NAME zabbix_proxy:0.9

MAINTAINER Oleksandr Bezpalko <obezpalko@gmail.com>

RUN $APT_INSTALL libsnmp-dev libsnmp-base snmp-mibs-downloader \
    zabbix-proxy-sqlite3 fping && \
    apt-get -y autoclean autoremove

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
    [ -d /etc/zabbix/scripts ] || mkdir /etc/zabbix/scripts && \
    mkdir -p /var/run/zabbix && chown zabbix /var/run/zabbix && \
    ln -sf /etc/zabbix/service/zabbix_proxy /etc/service/zabbix_proxy

RUN apt-get autoremove -y && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

EXPOSE 10051
