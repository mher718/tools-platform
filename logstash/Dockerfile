FROM otechlabs/elasticsearch_base

MANTAINER Oleksandr Bezpalko <obezpalko@gmail.com>

ENV DEBIAN_FRONTEND noninteractive
ENV APT_INSTALL apt-get install -y -qq --no-install-recommends
ENV LOGSTASH logstash_1.4.2-1-2c0f5a1_all

WORKDIR /opt/downloads
ADD https://download.elasticsearch.org/logstash/logstash/packages/debian/${LOGSTASH}.deb /opt/downloads/

RUN  /usr/bin/dpkg -i /opt/downloads/${LOGSTASH}.deb && \
    rm /opt/downloads/${LOGSTASH}.deb 

VOLUME ["/var/log/logstash/", "/etc/logstash/"]

EXPOSE 514/tcp 514/udp

CMD ["/opt/logstash/bin/logstash", "agent", "-f/etc/logstash/conf.d", "-l/var/log/logstash/logstash.log"]
