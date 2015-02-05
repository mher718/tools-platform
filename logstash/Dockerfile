FROM otechlabs/elasticsearch_base

MAINTAINER Oleksandr Bezpalko <obezpalko@gmail.com>

ENV DEBIAN_FRONTEND noninteractive
ENV APT_INSTALL apt-get install -y -qq --no-install-recommends
ENV LOGSTASH logstash_1.4.2-1-2c0f5a1_all

ADD https://download.elasticsearch.org/logstash/logstash/packages/debian/${LOGSTASH}.deb /opt/downloads/
ADD http://geolite.maxmind.com/download/geoip/database/GeoLiteCity.dat.gz /etc/

RUN  /usr/bin/dpkg -i /opt/downloads/${LOGSTASH}.deb && \
    /bin/gzip -d /etc/GeoLiteCity.dat && \
    rm /opt/downloads/${LOGSTASH}.deb

VOLUME ["/var/log/logstash", "/etc/logstash"]

WORKDIR /etc/logstash
EXPOSE 514/tcp 514/udp

CMD ["/opt/logstash/bin/logstash", "agent", "-f/etc/logstash/conf.d", "-l/var/log/logstash/logstash.log"]
