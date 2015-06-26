FROM ubuntu:14.04

ENV DEBIAN_FRONTEND noninteractive
ENV SWARM_VERSION=1.24

RUN apt-get update -qq && \
    apt-get install -y --no-install-recommends apt-transport-https ca-certificates software-properties-common
RUN echo "deb https://get.docker.com/ubuntu docker main" > /etc/apt/sources.list.d/docker.list && \
    echo "deb http://dl.bintray.com/sbt/debian /" > /etc/apt/sources.list.d/sbt.list && \
    apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 36A1D7869245C8950F966E92D8576A8BA88D21E9 && \
    echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | debconf-set-selections && \
    add-apt-repository ppa:webupd8team/java && \
    apt-get update -qq

RUN apt-get install -y --no-install-recommends \
    curl \
    lxc \
    iptables \
    oracle-java8-set-default \
    wget \
    unzip \
    lxc-docker \
    git \
    openssh-client

RUN apt-get install -y --force-yes --no-install-recommends sbt

ADD wrapdocker /usr/local/bin/wrapdocker
RUN chmod +x /usr/local/bin/wrapdocker
VOLUME /var/lib/docker

RUN groupadd -g 1000 jenkins && \
    useradd -d /home/jenkins -s /bin/bash -m jenkins -u 1000 -g jenkins && \ 
    usermod -a -G docker jenkins

RUN wget -O /home/jenkins/swarm-client-$SWARM_VERSION-jar-with-dependencies.jar http://maven.jenkins-ci.org/content/repositories/releases/org/jenkins-ci/plugins/swarm-client/$SWARM_VERSION/swarm-client-$SWARM_VERSON-jar-with-dependencies.jar

ADD jenkins-slave-run.sh /
CMD ["/jenkins-slave-run.sh"]
