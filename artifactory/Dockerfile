FROM otechlabs/base
MAINTAINER Aleksandr Bezpalko <a.bezpalko@external.oberthur.com>

RUN apt-get update -qq && \
    apt-get install -y --no-install-recommends openjdk-7-jdk

COPY src/artifactory-powerpack-3.5.3.zip /opt/artifactory-powerpack-3.5.3.zip

RUN unzip /opt/artifactory-powerpack-3.5.3.zip -d /opt/ && \
    mv /opt/artifactory-powerpack-3.5.3 /opt/artifactory && \
    rm -f /opt/artifactory-powerpack-3.5.3.zip

RUN wget -O /opt/artifactory/tomcat/lib/mysql-connector-java-5.1.34.jar http://repo.jfrog.org/artifactory/remote-repos/mysql/mysql-connector-java/5.1.34/mysql-connector-java-5.1.34.jar

COPY src/run.sh /etc/service/artifactory/run

EXPOSE 8081
