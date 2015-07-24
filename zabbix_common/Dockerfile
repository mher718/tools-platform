FROM ubuntu:14.04
# TARGET_IMAGE_NAME zabbix_common:1.0

ENV LC_ALL C
ENV DEBIAN_FRONTEND noninteractive
ENV APT_INSTALL apt-get install -y --no-install-recommends
ENV TERM xterm
## Prevent initramfs updates from trying to run grub and lilo.
ENV INITRD no
RUN mkdir -p /etc/container_environment && \
    echo -n no > /etc/container_environment/INITRD

## Temporarily disable dpkg fsync to make building faster.
RUN echo force-unsafe-io > /etc/dpkg/dpkg.cfg.d/docker-apt-speedup

## Enable Ubuntu Universe and Multiverse.
RUN sed -i 's/^#\s*\(deb.*universe\)$/\1/g' /etc/apt/sources.list && \
    sed -i 's/^#\s*\(deb.*multiverse\)$/\1/g' /etc/apt/sources.list

RUN echo 'deb http://archive.ubuntu.com/ubuntu/ trusty multiverse' >> /etc/apt/sources.list

## Fix some issues with APT packages.
## See https://github.com/dotcloud/docker/issues/1024
## Replace the 'ischroot' tool to make it always return true.
## Prevent initscripts updates from breaking /dev/shm.
RUN dpkg-divert --local --rename --add /sbin/initctl && \
    dpkg-divert --local --rename --add /usr/bin/ischroot && \
    ln -sf /bin/true /sbin/initctl && \
    ln -sf /bin/true /usr/bin/ischroot

RUN apt-get update -qq && \
    apt-get -yqq upgrade && \
    apt-get dist-upgrade -y --no-install-recommends


RUN $APT_INSTALL software-properties-common vim unzip wget curl psmisc less runit language-pack-en && \
    locale-gen en_US.UTF-8 uk_UA.UTF-8 && \
    update-locale LANG=en_US.UTF-8 LC_CTYPE=en_US.UTF-8 && \
    echo -n en_US.UTF-8 > /etc/container_environment/LANG && \
    echo -n en_US.UTF-8 > /etc/container_environment/LC_CTYPE

COPY ./bin/my_init /sbin/my_init
COPY ./bin/setuser /sbin/setuser

RUN mkdir -p /etc/my_init.d /etc/container_environment && \
    touch /etc/container_environment.sh /etc/container_environment.json && \
    chmod 700 /etc/container_environment && \
    chmod 640 /etc/container_environment.sh /etc/container_environment.json && \
    ln -s /etc/container_environment.sh /etc/profile.d/

CMD ["/sbin/my_init"]
