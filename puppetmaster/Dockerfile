FROM otechlabs/base

RUN apt-get -qq update ; \
    wget http://apt.puppetlabs.com/puppetlabs-release-trusty.deb ; \
    dpkg -i puppetlabs-release-trusty.deb ; \
    apt-get -qq update ; \
    apt-get install -y --no-install-recommends puppet ; \
    rm puppetlabs-release-trusty.deb

RUN wget https://forgeapi.puppetlabs.com/v3/files/puppetlabs-stdlib-3.2.1.tar.gz ; \
    tar zxf puppetlabs-stdlib-3.2.1.tar.gz ; \
    mkdir -p /usr/share/puppet/modules/ ; \
    mv puppetlabs-stdlib-3.2.1 /usr/share/puppet/modules/stdlib-3.2.1 ; \
    rm -rf puppetlabs-stdlib-3.2.1.tar.gz 

ADD ./puppet.conf /etc/puppet/puppet.conf

VOLUME ["/var/lib/puppet", "/opt/puppet"]

EXPOSE 8140

ENTRYPOINT [ "/usr/bin/puppet", "master", "--no-daemonize", "--verbose" ]
