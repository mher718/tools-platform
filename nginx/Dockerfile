FROM otechlabs/base

RUN echo "deb http://nginx.org/packages/mainline/ubuntu/ trusty nginx" >> /etc/apt/sources.list && \
    echo "deb-src http://nginx.org/packages/mainline/ubuntu/ trusty nginx" >> /etc/apt/sources.list

RUN wget http://nginx.org/keys/nginx_signing.key && \
    apt-key add nginx_signing.key

RUN apt-get update -qq && \
    apt-get install -y --no-install-recommends nginx

RUN echo "\ndaemon off;" >> /etc/nginx/nginx.conf

EXPOSE 443 80

CMD ["/usr/sbin/nginx", "-c", "/etc/nginx/nginx.conf"]
