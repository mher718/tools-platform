FROM otechlabs/base
# TARGET_IMAGE_NAME zabbix_frontend:0.5

MAINTAINER Oleksandr Bezpalko <obezpalko@gmail.com>

# Update base images.
RUN echo 'deb http://archive.ubuntu.com/ubuntu/ trusty multiverse' >> /etc/apt/sources.list && \
    apt-get update -q && \
    apt-get -y -q --no-install-recommends install  \
    mysql-common apache2-bin php5 php5-mysql php5-snmp php5-ldap  \
    zabbix-frontend-php snmp-mibs-downloader && \
    apt-get -y autoclean autoremove 
RUN echo > /etc/zabbix/httpd_zabbix.conf && \
    echo 'date.timezone = UTC' > /etc/zabbix/zabbix.ini && \
    ln -sf /etc/zabbix/httpd_zabbix.conf /etc/apache2/sites-available/zabbix.conf && \
    a2dissite 000-default && \
    a2ensite zabbix

EXPOSE 80

VOLUME ["/etc/ssl/certs/ldap.pem", "/etc/ldap/ldap.conf", "/etc/zabbix/httpd_zabbix.conf", "/etc/zabbix/zabbix.conf.php"]

CMD ["/usr/sbin/apache2ctl", "-DFOREGROUND"]
