FROM otechlabs/java7

MAINTAINER Oleksandr Bezpalko <obezpalko@gmail.com>

ENV DEBIAN_FRONTEND noninteractive
ENV APT_INSTALL apt-get install -y -qq --no-install-recommends
ENV ELASTICSEARCH elasticsearch-1.3.2

WORKDIR /opt/downloads
ADD https://download.elasticsearch.org/elasticsearch/elasticsearch/${ELASTICSEARCH}.deb /opt/downloads/

RUN /usr/bin/dpkg -i /opt/downloads/${ELASTICSEARCH}.deb && \
    rm /opt/downloads/${ELASTICSEARCH}.deb

#Elasticsearch
VOLUME ["/var/log/elasticsearch/", "/etc/elasticsearch/", "/var/lib/elasticsearch/"]

EXPOSE 9200/tcp 9300/tcp

CMD ["/elasticsearch.sh"]
