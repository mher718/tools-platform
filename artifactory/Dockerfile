FROM otechlabs/base

RUN apt-get update -qq && \
    apt-get install -y --no-install-recommends openjdk-7-jdk

RUN wget -qO- -O /opt/artifactory-powerpack-3.4.2.zip "https://store.artifactoryonline.com/addons/download?license=b40898cc8ec8fa7ec891bb9d10943de60acfd67f" && \
    unzip /opt/artifactory-powerpack-3.4.2.zip -d /opt/ && \
    mv /opt/artifactory-powerpack-3.4.2 /opt/artifactory && \
    rm -f /opt/artifactory-powerpack-3.4.2.zip

RUN wget -O /opt/artifactory/tomcat/lib/mysql-connector-java-5.1.34.jar http://repo.jfrog.org/artifactory/remote-repos/mysql/mysql-connector-java/5.1.34/mysql-connector-java-5.1.34.jar

EXPOSE 8081

CMD ["/bin/bash", "/opt/artifactory/bin/artifactory.sh"]
