FROM otechlabs/base

MANTAINER Oleksandr Bezpalko <obezpalko@gmail.com>

ENV DEBIAN_FRONTEND noninteractive
ENV APT_INSTALL apt-get install -y -qq --no-install-recommends
ENV LOGSTASH 1.4.2-1-2c0f5a1_all

WORKDIR /opt/downloads
ADD https://download.elasticsearch.org/logstash/logstash/packages/debian/logstash_${LOGSTASH}.deb /opt/downloads/

RUN ${APT_INSTALL} software-properties-common && \
    add-apt-repository ppa:webupd8team/java && \
    apt-get update -qq && \
    /bin/echo oracle-java7-installer shared/accepted-oracle-license-v1-1 select true | \
    /usr/bin/debconf-set-selections && \
    ${APT_INSTALL} oracle-java7-installer oracle-java7-set-default && \
    /usr/bin/dpkg -i /opt/downloads/logstash_${LOGSTASH}.deb && \
    rm /opt/downloads/logstash_${LOGSTASH}.deb && \
    apt-get autoremove -y && apt-get clean install

VOLUME ["/var/log/logstash/", "/etc/logstash/"]

EXPOSE 514/tcp 514/udp

CMD ["/opt/logstash/bin/logstash", "agent", "-f/etc/logstash/conf.d", "-l/var/log/logstash/logstash.log"]
