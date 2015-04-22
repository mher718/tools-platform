FROM otechlabs/base
# TARGET_IMAGE_NAME snmptrapd:0.3

MAINTAINER Oleksandr Bezpalko <obezpalko@gmail.com>
RUN apt-get update
# Update base images.
RUN $APT_INSTALL libsnmp-dev libsnmp-base libsnmp-perl libnet-snmp-perl \
    snmp-mibs-downloader snmpd libconfig-inifiles-perl

RUN apt-get -y autoclean autoremove && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN curl -L http://sourceforge.net/projects/snmptt/files/latest/download | \
    tar xzf - -C /tmp && \
    cp /tmp/snmptt_*/snmptt /usr/sbin/ && chmod +x /usr/sbin/snmptt && \
    rm -rf /tmp/snmptt_*

EXPOSE 162/udp

COPY files/*.mib /usr/share/snmp/mibs/
RUN ln -sf /etc/zabbix/snmp/snmptrapd.conf /etc/snmp/snmptrapd.conf ; \
    ln -sf /etc/zabbix/snmp/snmptt.conf /etc/snmp/snmptt.conf ; \
    ln -sf /etc/zabbix/snmp/snmptt.ini /etc/snmp/snmptt.ini

ENV MIBDIRS /usr/share/snmp/mibs:/etc/zabbix/snmp/mibs
ENV MIBS +ALL

VOLUME ["/var/log/snmptt","/etc/zabbix"]
CMD ["/usr/sbin/snmptrapd","-f","-Lo","-n", "-M+/etc/zabbix/snmp/mibs", "-m+ALL"]
