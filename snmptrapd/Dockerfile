FROM otechlabs/base
# TARGET_IMAGE_NAME snmptrapd:0.1

MAINTAINER Oleksandr Bezpalko <obezpalko@gmail.com>
RUN apt-get update
# Update base images.
RUN $APT_INSTALL libsnmp-dev libsnmp-base libsnmp-perl libnet-snmp-perl \
    snmp-mibs-downloader snmpd

RUN apt-get -y autoclean autoremove && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

EXPOSE 162/udp

COPY files/*.mib /usr/share/snmp/mibs/
COPY files/zabbix_trap_receiver.pl /usr/sbin/zabbix_trap_receiver.pl
RUN /bin/echo -e 'authCommunity execute public\nperl do "/usr/sbin/zabbix_trap_receiver.pl";' >> /etc/snmp/snmptrapd.conf

VOLUME ["/var/log/snmptt"]
CMD ["/usr/sbin/snmptrapd","-f"]
