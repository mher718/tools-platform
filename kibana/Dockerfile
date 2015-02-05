FROM otechlabs/base

MAINTAINER Oleksandr Bezpalko <obezpalko@gmail.com>

ENV DEBIAN_FRONTEND noninteractive
ENV APT_INSTALL apt-get install -y -qq --no-install-recommends
ENV KIBANA kibana-3.1.0
ENV KIBANA_VHOST /etc/apache2/sites-available/0-kibana.conf
ADD https://download.elasticsearch.org/kibana/kibana/${KIBANA}.tar.gz /opt/downloads/

RUN ${APT_INSTALL} apache2
RUN echo '#' > ${KIBANA_VHOST} && \
    echo '<VirtualHost *:80>' >> ${KIBANA_VHOST} && \
    echo '  ServerAdmin webmaster@localhost' >> ${KIBANA_VHOST} && \
    echo '  DocumentRoot /home/kibana/html' >> ${KIBANA_VHOST} && \
    echo '  ErrorLog ${APACHE_LOG_DIR}/kibana-error.log' >> ${KIBANA_VHOST} && \
    echo '  CustomLog ${APACHE_LOG_DIR}/kibana-access.log combined' >> ${KIBANA_VHOST} && \
    echo '  <Directory /home/kibana/html>' >> ${KIBANA_VHOST} && \
    echo '    Require all granted' >> ${KIBANA_VHOST} && \
    echo '    AllowOverride all' >> ${KIBANA_VHOST} && \
    echo '  </Directory>' >> ${KIBANA_VHOST} && \
    echo '</VirtualHost>' >> ${KIBANA_VHOST} && \
    /usr/sbin/a2dissite 000-default && \
    /usr/sbin/a2ensite 0-kibana && \
    /usr/sbin/groupadd kibana && \
    /usr/sbin/useradd -d /home/kibana -g kibana -G www-data -m -s /usr/sbin/nologin kibana && \
    /bin/tar -C /home/kibana -xzf /opt/downloads/${KIBANA}.tar.gz && \
    mv /home/kibana/${KIBANA} /home/kibana/html && \
    chown -R kibana:www-data /home/kibana/html && \
    sed -i 's#^\(\s*elasticsearch: \).*$#\1"http://elasticsearch.otlabs.fr:9200",#g' /home/kibana/html/config.js && \
    /usr/sbin/apache2ctl configtest

VOLUME ["/home/kibana/html/config.js"]

EXPOSE 80/tcp

CMD ["/usr/sbin/apache2ctl", "-DFOREGROUND"]
