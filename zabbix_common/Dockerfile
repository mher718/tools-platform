FROM ubuntu:trusty
# TARGET_IMAGE_NAME otechlabs/zabbix:common-2.4.6-1

ENV LANG=C LC_ALL=C DEBIAN_FRONTEND=noninteractive APT_INSTALL="apt-get install -y --no-install-recommends" TERM=xterm INITRD=no 
RUN mkdir -p /etc/container_environment /etc/my_init.d && \
    echo -n no > /etc/container_environment/INITRD ; \
    echo force-unsafe-io > /etc/dpkg/dpkg.cfg.d/docker-apt-speedup && \
    touch /etc/container_environment.sh /etc/container_environment.json && \
    chmod 700 /etc/container_environment && \
    chmod 640 /etc/container_environment.sh /etc/container_environment.json && \
    ln -s /etc/container_environment.sh /etc/profile.d/

RUN $APT_INSTALL software-properties-common curl && curl http://repo.zabbix.com/zabbix-official-repo.key | sudo apt-key add -
RUN apt-add-repository http://repo.zabbix.com/zabbix/2.4/ubuntu ; \
    apt-add-repository multiverse ; apt-add-repository universe

#    apt-add-repository http://archive.ubuntu.com/ubuntu ; \
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


RUN $APT_INSTALL curl runit && \
    locale-gen en_US.UTF-8 && \
    update-locale LANG=en_US.UTF-8 LC_CTYPE=en_US.UTF-8 && \
    echo -n en_US.UTF-8 > /etc/container_environment/LANG && \
    echo -n en_US.UTF-8 > /etc/container_environment/LC_CTYPE
ENV LANG=en_US.UTF-8 LC_CTYPE=en_US.UTF-8 LC_ALL=en_US.UTF-8

RUN apt-get purge -y rsyslog wget eject initramfs-tools file ntpdate anacron xkb-data whiptail lsb-release \
    apt-utils xz-utils net-tools netbase netcat-openbsd linux-libc-dev udev fontconfig \
    libx11-6 libudev1 module-init-tools libxau6 cpio resolvconf kmod libdbus-1-3 keyboard-configuration busybox-initramfs

RUN apt-get -y autoremove ; apt-get -y autoclean

COPY ./bin/my_init /sbin/my_init
# COPY ./bin/setuser /sbin/setuser

CMD ["/sbin/my_init"]
