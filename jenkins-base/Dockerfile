FROM otechlabs/base

RUN apt-get -qq update ; \
    apt-get install -y --no-install-recommends python-software-properties 

RUN mkdir /opt/jdk

# Java 1.6
RUN wget --no-check-certificate --no-cookies - --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/6u45-b06/jdk-6u45-linux-x64.bin ; \
    chmod +x /jdk-6u45-linux-x64.bin ; \
    /jdk-6u45-linux-x64.bin ; \
    mv /jdk1.6.0_45 /opt/jdk/ ; \
    rm -f /jdk-6u45-linux-x64.bin

# Java 1.7
RUN wget --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/7u67-b01/jdk-7u67-linux-x64.tar.gz ; \
    mkdir -p /opt/jdk ; \
    tar -zxf jdk-7u67-linux-x64.tar.gz -C /opt/jdk ; \
    rm -f jdk-7u67-linux-x64.tar.gz

# Java 1.8
RUN wget --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u11-b12/jdk-8u11-linux-x64.tar.gz ; \
    mkdir -p /opt/jdk ; \
    tar -zxf jdk-8u11-linux-x64.tar.gz -C /opt/jdk ; \
    rm -f jdk-8u11-linux-x64.tar.gz

# Set the default java version to 1.7
RUN update-alternatives --install /usr/bin/java java /opt/jdk/jdk1.7.0_67/bin/java 100 ; \
    update-alternatives --install /usr/bin/javac javac /opt/jdk/jdk1.7.0_67/bin/javac 100

# Cleanup
RUN apt-get -qq clean ; \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

