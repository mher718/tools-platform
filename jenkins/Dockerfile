FROM otechlabs/jenkins-base

ENV JENKINS_HOME /home/jenkins

RUN useradd -d "$JENKINS_HOME" -m -s /bin/bash jenkins

RUN mkdir -p /opt/jenkins && \
    curl -L http://mirrors.jenkins-ci.org/war-stable/1.554.3/jenkins.war -o /opt/jenkins/jenkins.war

EXPOSE 8080 50000

USER jenkins

CMD ["java", "-Djava.awt.headless=true -Xmx4096m -XX:MaxPermSize=1024m", "-jar", "/opt/jenkins/jenkins.war"]