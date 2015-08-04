FROM otechlabs/base
# TARGET_IMAGE_NAME zabbix_frontend:0.9

MAINTAINER Oleksandr Bezpalko <obezpalko@gmail.com>

RUN apt-get update

RUN $APT_INSTALL mysql-common apache2-bin php5 php5-mysql php5-snmp php5-ldap  \
    zabbix-frontend-php snmp-mibs-downloader && \
    apt-get -y autoclean autoremove && apt-get -y clean

RUN echo 'date.timezone = UTC' > /etc/zabbix/zabbix.ini && \
    ln -sf /etc/zabbix/httpd_zabbix.conf /etc/apache2/sites-enabled/zabbix.conf && \
    a2dissite 000-default
RUN locale-gen fr_FR.UTF-8 ru_RU.UTF-8 uk_UA.UTF-8 en_US.UTF-8

RUN apt-get autoremove -y && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

COPY files/*.mib /usr/share/snmp/mibs/

EXPOSE 80

VOLUME ["/etc/zabbix"]

CMD ["/usr/sbin/apache2ctl", "-DFOREGROUND"]
