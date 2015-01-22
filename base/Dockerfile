FROM ubuntu:14.04
MAINTAINER Sergey Shkolin <sergey.shkolin@me.com>

RUN apt-get update -qq ; \
    apt-get -yqq upgrade

RUN apt-get install -y software-properties-common vim unzip wget curl

RUN apt-get autoremove -y ; \
    apt-get clean install
