FROM otechlabs/base

RUN apt-get -qq update && \
    apt-get install -y --no-install-recommends bind9 && \
    mkdir -p /var/run/named && \
    chown bind:bind /var/run/named

EXPOSE 53/udp

CMD ["/usr/sbin/named", "-u", "bind", "-g"]
