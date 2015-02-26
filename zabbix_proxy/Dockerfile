FROM ubuntu:14.04
# TARGET_IMAGE_NAME zabbix_proxy:0.2

MAINTAINER Oleksandr Bezpalko <obezpalko@gmail.com>

# Update base images.
RUN echo 'deb http://archive.ubuntu.com/ubuntu/ trusty multiverse' >> /etc/apt/sources.list && \
    apt-get update -q && \ 
    apt-get -y -q --no-install-recommends install \
        libsnmp-dev libsnmp-base snmp-mibs-downloader \
        zabbix-proxy-sqlite3 fping monit && \
    apt-get -y autoclean autoremove && \
    sed -i 's/START=.*$/START=yes/' /etc/default/zabbix-proxy && \
    sed -i 's#DBName=.*$#DBName=/var/lib/zabbix/zabbix.sqlite3# \
            ; s#Server=.*$#Server=zabbix.otlabs.fr# \
            ; s#Hostname=.*#Hostname=unconfigured_proxy# \
            ; /^#/d; /^$/d ' /etc/zabbix/zabbix_proxy.conf && \
    echo 'StartDiscoverers=5' >> /etc/zabbix/zabbix_proxy.conf && \
    /bin/echo -e 'DebugLevel=0\nExternalScripts=/etc/zabbix/scripts' >> /etc/zabbix/zabbix_proxy.conf && \
    /bin/echo -e 'set init\nset daemon 10\nset logfile /var/log/monit.log\n'  > /etc/monitrc && \
    /bin/echo -e 'set httpd\n\tport 2812\n\tallow monitNak:NakMouwir0\n' >> /etc/monitrc && \
    /bin/echo -e 'check process zabbix-proxy with pidfile /var/run/zabbix/zabbix_proxy.pid' >> /etc/monitrc && \
    /bin/echo -e '\tstart program = "/usr/sbin/service zabbix-proxy start"' >> /etc/monitrc && \
    /bin/echo -e '\tstop program = "/usr/sbin/service zabbix-proxy stop"' >> /etc/monitrc && \
    chmod 0600 /etc/monitrc && \
    [ -d /etc/zabbix/scripts ] || mkdir /etc/zabbix/scripts 

EXPOSE 10051 2812

CMD ["/usr/bin/monit", "-I", "-c/etc/monitrc" ]
