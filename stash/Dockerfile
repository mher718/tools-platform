FROM ubuntu:14.04

RUN apt-get update && \
	apt-get install -y --no-install-recommends git-core openssh-server supervisor curl

RUN mkdir /var/run/sshd && \
	mkdir -p /var/log/supervisor

# Install Java 7
RUN DEBIAN_FRONTEND=noninteractive apt-get install --no-install-recommends -y software-properties-common && \
	DEBIAN_FRONTEND=noninteractive apt-add-repository ppa:webupd8team/java -y && \
	apt-get update && \
	echo oracle-java7-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections  && \
	DEBIAN_FRONTEND=noninteractive apt-get install oracle-java7-installer -y

# Install Stash
RUN curl -Lks http://downloads.atlassian.com/software/stash/downloads/atlassian-stash-3.10.0.tar.gz -o /root/stash.tar.gz  && \
	mkdir -p /opt/stash  && \
	tar zxf /root/stash.tar.gz --strip=1 -C /opt/stash  && \
	mkdir -p /opt/stash-home

WORKDIR /opt/stash-home
ENV STASH_HOME /opt/stash-home

ADD supervisord.conf /etc/supervisor/conf.d/supervisord.conf
ADD mysql-connector-java-5.1.35-bin.jar /opt/stash-home/lib/

EXPOSE 7990 8433 22

CMD ["/usr/bin/supervisord"]
