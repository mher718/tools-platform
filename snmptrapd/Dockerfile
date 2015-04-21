FROM otechlabs/base
# TARGET_IMAGE_NAME snmptrapd:0.2

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
    cp /tmp/snmptt_*/snmptthandler /usr/sbin/ && chmod +x /usr/sbin/snmptthandler && \
    cp /tmp/snmptt_*/snmptt.ini /etc/snmp/ && \
    cp /tmp/snmptt_*/examples/snmptt.conf.generic /etc/snmp/snmptt.conf && \
    rm -rf /tmp/snmptt_*

EXPOSE 162/udp

COPY files/*.mib /usr/share/snmp/mibs/
RUN /bin/echo -e 'authCommunity log,execute,net public\ntraphandle default /usr/sbin/snmptt --debug=2' >> /etc/snmp/snmptrapd.conf
RUN  sed -i 's/syslog_enable.*/syslog_enable = 0/; \
        s/^log_system_enable.*/log_system_enable = 1/; \
        s/^unknown_trap_log_enable.*/unknown_trap_log_enable = 1/; \
        s/^net_snmp_perl_enable.*/net_snmp_perl_enable = 1/; \
        s/^translate_log_trap_oid.*/translate_log_trap_oid = 2/' \
        /etc/snmp/snmptt.ini 
RUN /bin/echo -e 'EVENT general .* "General event" Normal\nFORMAT ZBXTRAP $aA $E $O severity: $s $*' > /etc/snmp/snmptt.conf

ENV MIBDIRS /usr/share/snmp/mibs
ENV MIBS +ALL

VOLUME ["/var/log/snmptt"]
CMD ["/usr/sbin/snmptrapd","-f","-Lo","-n", "-M+ALL", "-m+ALL"]
