FROM otechlabs/elasticsearch_base

MANTAINER Oleksandr Bezpalko <obezpalko@gmail.com>

ENV DEBIAN_FRONTEND noninteractive
ENV APT_INSTALL apt-get install -y -qq --no-install-recommends
ENV ELASTICSEARCH elasticsearch-1.3.2

WORKDIR /opt/downloads
ADD https://download.elasticsearch.org/elasticsearch/elasticsearch/${ELASTICSEARCH}.deb /opt/downloads/

RUN /usr/bin/dpkg -i /opt/downloads/${ELASTICSEARCH}.deb && \
    rm /opt/downloads/${ELASTICSEARCH}.deb 

#Elasticsearch
VOLUME ["/var/log/logstash/", "/etc/logstash/", "/var/lib/elasticsearch/"]

EXPOSE 514/tcp 514/udp

CMD ["/opt/logstash/bin/logstash", "agent", "-f/etc/logstash/conf.d", "-l/var/log/logstash/logstash.log"]
