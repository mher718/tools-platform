FROM otechlabs/jenkins-base

ENV JENKINS_VERSION 1.554.3
ENV JENKINS_HOME /home/jenkins

RUN useradd -d "$JENKINS_HOME" -m -s /bin/bash jenkins

RUN mkdir -p /opt/jenkins && \
    wget -O /opt/jenkins/jenkins.war http://mirrors.jenkins-ci.org/war-stable/$JENKINS_VERSION/jenkins.war

EXPOSE 8080 50000

USER jenkins

CMD ["java", "-Djava.awt.headless=true -Xmx4096m -XX:MaxPermSize=1024m", "-jar", "/opt/jenkins/jenkins.war"]