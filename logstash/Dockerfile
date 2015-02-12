FROM otechlabs/base

MAINTAINER Oleksandr Bezpalko <obezpalko@gmail.com>


ENV DEBIAN_FRONTEND noninteractive
ENV APT_INSTALL apt-get install -y -qq --no-install-recommends
ENV LOGSTASH logstash_1.4.2-1-2c0f5a1_all

ADD https://download.elasticsearch.org/logstash/logstash/packages/debian/${LOGSTASH}.deb /opt/downloads/
ADD http://geolite.maxmind.com/download/geoip/database/GeoLiteCity.dat.gz /etc/

RUN ${APT_INSTALL} software-properties-common && \
    add-apt-repository ppa:webupd8team/java && \
    apt-get update -qq && \
    /bin/echo oracle-java7-installer shared/accepted-oracle-license-v1-1 select true | \
    /usr/bin/debconf-set-selections && \
    ${APT_INSTALL} oracle-java7-installer oracle-java7-set-default && \
    apt-get autoremove -y && apt-get clean install

RUN  /usr/bin/dpkg -i /opt/downloads/${LOGSTASH}.deb && \
    /bin/gzip -d /etc/GeoLiteCity.dat && \
    rm /opt/downloads/${LOGSTASH}.deb

VOLUME ["/etc/logstash"]

WORKDIR /etc/logstash
EXPOSE 514/tcp 514/udp

CMD ["/opt/logstash/bin/logstash", "agent", "-f/etc/logstash/conf.d", "-l/var/log/logstash/logstash.log"]
