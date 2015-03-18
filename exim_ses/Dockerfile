FROM ubuntu:14.04
# TARGET_IMAGE_NAME exim_ses:0.1

MAINTAINER Oleksandr Bezpalko <obezpalko@gmail.com>

# Update base images.
RUN echo 'deb http://archive.ubuntu.com/ubuntu/ trusty multiverse' >> /etc/apt/sources.list && \
    apt-get update -q && \
    apt-get -y -q --no-install-recommends install exim4-base exim4-config exim4-daemon-light swaks && \
    apt-get -y autoclean autoremove

COPY ./config /etc/exim4/config

EXPOSE 25 465 587

VOLUME ["/etc/exim4"]

CMD ["/usr/sbin/exim4", "-C/etc/exim4/config", "-bdf"]
