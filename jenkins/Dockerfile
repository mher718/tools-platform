FROM otechlabs/jenkins-base
# TARGET_IMAGE_NAME jenkins:1.602

MAINTAINER Oleksandr Bezpalko <obezpalko@gmail.com>

ENV JENKINS_VERSION 1.602
ENV JENKINS_USER jenkins
ENV JENKINS_HOME /home/$JENKINS_USER

RUN $APT_INSTALL git openssh-client

RUN useradd -d "$JENKINS_HOME" -m -s /bin/bash $JENKINS_USER

RUN mkdir -p /opt/jenkins && \
    wget -O /opt/jenkins/jenkins.war http://mirrors.jenkins-ci.org/war/$JENKINS_VERSION/jenkins.war

RUN mkdir -p /etc/service/jenkins && \
    echo "#!/bin/sh" > /etc/service/jenkins/run && \
    echo "/sbin/setuser $JENKINS_USER java -Djava.awt.headless=true -Xmx4096m -XX:MaxPermSize=1024m -jar /opt/jenkins/jenkins.war" >> /etc/service/jenkins/run && \
    chmod +x /etc/service/jenkins/run

RUN apt-get autoremove -y && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

EXPOSE 8080 50000
