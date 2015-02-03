FROM otechlabs/base

MAINTAINER Oleksandr Bezpalko <obezpalko@gmail.com>

ENV DEBIAN_FRONTEND noninteractive
ENV APT_INSTALL apt-get install -y -qq --no-install-recommends

RUN ${APT_INSTALL} software-properties-common && \
    add-apt-repository ppa:webupd8team/java && \
    apt-get update -qq && \
    /bin/echo oracle-java7-installer shared/accepted-oracle-license-v1-1 select true | \
    /usr/bin/debconf-set-selections && \
    ${APT_INSTALL} oracle-java7-installer oracle-java7-set-default && \
    apt-get autoremove -y && apt-get clean install
