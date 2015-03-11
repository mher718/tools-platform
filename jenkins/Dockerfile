FROM otechlabs/jenkins-base

ENV JENKINS_VERSION 1.602
ENV JENKINS_HOME /home/jenkins

RUN apt-get -qq update && \
    apt-get install -y --no-install-recommends git

RUN useradd -d "$JENKINS_HOME" -m -s /bin/bash jenkins

RUN mkdir -p /opt/jenkins && \
    wget -O /opt/jenkins/jenkins.war http://mirrors.jenkins-ci.org/war/$JENKINS_VERSION/jenkins.war

EXPOSE 8080 50000

USER jenkins

CMD ["java", "-Djava.awt.headless=true -Xmx4096m -XX:MaxPermSize=1024m", "-jar", "/opt/jenkins/jenkins.war"]