FROM otechlabs/base

MAINTAINER Sergii Shkolin <s.shkolin@oberthur.com>

ENV SONAR_VERSION 5.2
ENV SONARQUBE_HOME /opt/sonarqube

# Install the python script required for "add-apt-repository"
RUN apt-get update && apt-get install -y software-properties-common

# Sets language to UTF8
ENV LANG en_US.UTF-8
RUN locale-gen $LANG 

# Setup the openjdk 8 repo
RUN add-apt-repository ppa:openjdk-r/ppa

# Install java8
RUN apt-get update && apt-get install -y openjdk-8-jdk

# Setup JAVA_HOME, this is useful for docker commandline 
ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64/ 
RUN export JAVA_HOME

# pub   2048R/D26468DE 2015-05-25
#       Key fingerprint = F118 2E81 C792 9289 21DB  CAB4 CFCA 4A29 D264 68DE
# uid                  sonarsource_deployer (Sonarsource Deployer) <infra@sonarsource.com>
# sub   2048R/06855C1D 2015-05-25
RUN gpg --keyserver ha.pool.sks-keyservers.net --recv-keys F1182E81C792928921DBCAB4CFCA4A29D26468DE

RUN set -x \
    && cd /opt \
    && curl -o sonarqube.zip -fSL https://sonarsource.bintray.com/Distribution/sonarqube/sonarqube-$SONAR_VERSION.zip \
    && curl -o sonarqube.zip.asc -fSL https://sonarsource.bintray.com/Distribution/sonarqube/sonarqube-$SONAR_VERSION.zip.asc \
    && gpg --verify sonarqube.zip.asc \
    && unzip sonarqube.zip \
    && mv sonarqube-$SONAR_VERSION sonarqube \
    && rm sonarqube.zip* \
    && rm -rf $SONARQUBE_HOME/bin/*

RUN wget -O /opt/sonarqube/extensions/plugins/sonar-ldap-plugin-1.5.1.jar https://sonarsource.bintray.com/Distribution/sonar-ldap-plugin/sonar-ldap-plugin-1.5.1.jar
EXPOSE 9000

WORKDIR $SONARQUBE_HOME
COPY run.sh $SONARQUBE_HOME/bin/
ENTRYPOINT ["./bin/run.sh"]
