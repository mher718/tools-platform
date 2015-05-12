FROM otechlabs/base
# TARGET_IMAGE_NAME redis_cluster:0.1

MAINTAINER Oleksandr Bezpalko <obezpalko@gmail.com>

ENV REDIS_VERSION 3.0.1

RUN $APT_INSTALL build-essential libjemalloc1 libjemalloc-dev 

WORKDIR /tmp
RUN curl -q http://download.redis.io/releases/redis-${REDIS_VERSION}.tar.gz | tar xzf - -C /tmp && \
    cd /tmp/redis-${REDIS_VERSION}/deps && make && \
    cd .. && make && make install && \
    mkdir -p /var/lib/redis && \
    rm -rf /tmp/redis-${REDIS_VERSION}

RUN apt-get -y remove build-essential && \
    apt-get -y autoclean autoremove && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ADD redis.conf /etc/redis/redis.conf

EXPOSE 6379
EXPOSE 16379

CMD ["/usr/local/bin/redis-server", "/etc/redis/redis.conf"]
