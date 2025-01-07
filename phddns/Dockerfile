
FROM docker.m.daocloud.io/library/ubuntu:latest
#FROM ubuntu:latest


RUN apt-get update && apt-get install -y wget \
    && wget -q "https://dl.oray.com/hsk/linux/phddns_5.3.0_amd64.deb" -O phddns_5.3.0_amd64.deb \
    && dpkg -i phddns_5.3.0_amd64.deb \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
    && rm phddns_5.3.0_amd64.deb

COPY run.sh /run.sh
RUN chmod +x /run.sh

ENTRYPOINT ["/bin/sh", "/run.sh"]


