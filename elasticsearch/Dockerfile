FROM otechlabs/elasticsearch_base

MANTAINER Oleksandr Bezpalko <obezpalko@gmail.com>

ENV DEBIAN_FRONTEND noninteractive
ENV APT_INSTALL apt-get install -y -qq --no-install-recommends
ENV ELASTICSEARCH elasticsearch-1.3.2

WORKDIR /opt/downloads
ADD https://download.elasticsearch.org/elasticsearch/elasticsearch/${ELASTICSEARCH}.deb /opt/downloads/

RUN /usr/bin/dpkg -i /opt/downloads/${ELASTICSEARCH}.deb && \
    rm /opt/downloads/${ELASTICSEARCH}.deb && \
    touch /var/run/elasticsearch.pid && \
    chown -R elasticsearch /var/run/elasticsearch.pid /var/log/elasticsearch /var/lib/elasticsearch

#Elasticsearch
VOLUME ["/var/log/elasticsearch/", "/etc/elasticsearch/", "/var/lib/elasticsearch/"]

EXPOSE 9200/tcp 9300/tcp

CMD ["/usr/bin/sudo", "-uelasticsearch", "/usr/share/elasticsearch/bin/elasticsearch", \
        "-p/var/run/elasticsearch.pid", \
        "-Des.default.config=/etc/elasticsearch/elasticsearch.yml", \
        "-Des.default.path.home=/usr/share/elasticsearch", \
        "-Des.default.path.logs=/var/log/elasticsearch", \
        "-Des.default.path.data=/var/lib/elasticsearch", \
        "-Des.default.path.work=/tmp/elasticsearch", \
        "-Des.default.path.conf=/etc/elasticsearch"]
