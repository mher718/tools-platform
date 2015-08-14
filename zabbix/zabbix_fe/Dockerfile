FROM otechlabs/zabbix:common-2.4.6-1
# TARGET_IMAGE_NAME otechlabs/zabbix:frontend-2.4.6-1

MAINTAINER Oleksandr Bezpalko <obezpalko@gmail.com>

RUN $APT_INSTALL mysql-common apache2-bin php5 php5-mysql php5-snmp php5-ldap  \
    zabbix-frontend-php snmp-mibs-downloader 

RUN echo 'date.timezone = UTC' > /etc/zabbix/zabbix.ini && \
    ln -sf /etc/zabbix/httpd_zabbix.conf /etc/apache2/sites-enabled/zabbix.conf && \
    a2dissite 000-default
RUN locale-gen fr_FR.UTF-8 ru_RU.UTF-8 uk_UA.UTF-8 en_US.UTF-8

RUN apt-get autoremove -y && apt-get autoclean -y\
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

COPY files/*.mib /usr/share/snmp/mibs/

EXPOSE 80

VOLUME ["/etc/zabbix"]

CMD ["/usr/sbin/apache2ctl", "-DFOREGROUND"]
