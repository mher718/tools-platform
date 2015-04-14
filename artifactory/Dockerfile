FROM otechlabs/base
MAINTAINER Aleksandr Bezpalko <a.bezpalko@external.oberthur.com>

RUN apt-get update -qq && \
    apt-get install -y --no-install-recommends curl openjdk-7-jdk

RUN curl -L -o /opt/artifactiry-dl.zip https://store.artifactoryonline.com/addons/download?license=d98d5c2683b8b46e3467c35b5b41965ccb6c72de && \
    unzip /opt/artifactory-dl.zip -d /opt/ && \
    mv /opt/artifactory-powerpack-* /opt/artifactory && \
    rm -f /opt/artifactory-dl.zip

RUN wget -O /opt/artifactory/tomcat/lib/mysql-connector-java-5.1.34.jar http://repo.jfrog.org/artifactory/remote-repos/mysql/mysql-connector-java/5.1.34/mysql-connector-java-5.1.34.jar

COPY src/run.sh /etc/service/artifactory/run

EXPOSE 8081
