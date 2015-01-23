FROM otechlabs/base

ENV SONAR_VERSION 5.0

RUN apt-get update -qq ; \
    apt-get install -y --no-install-recommends openjdk-7-jdk

RUN wget -qO- -O /opt/sonarqube-$SONAR_VERSION.zip http://dist.sonar.codehaus.org/sonarqube-$SONAR_VERSION.zip ; \
    unzip /opt/sonarqube-$SONAR_VERSION.zip -d /opt/ ; \
    mv /opt/sonarqube-$SONAR_VERSION /opt/sonarqube ; \
    rm -f /opt/sonarqube-$SONAR_VERSION.zip

RUN wget -O /opt/sonarqube/extensions/plugins/sonar-ldap-plugin-1.4.jar http://repository.codehaus.org/org/codehaus/sonar-plugins/sonar-ldap-plugin/1.4/sonar-ldap-plugin-1.4.jar

EXPOSE 9000

CMD ["/opt/sonar/bin/linux-x86-64/sonar.sh", "console"]
