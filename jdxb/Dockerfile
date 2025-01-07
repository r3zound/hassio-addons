
#FROM docker.m.daocloud.io/library/ubuntu:latest
FROM ubuntu:latest
COPY owjdxb /owjdxb
RUN chmod +x "/owjdxb/bin/owjdxb"
COPY run.sh /run.sh
RUN chmod +x /run.sh

ENTRYPOINT ["/bin/sh", "/run.sh"]

