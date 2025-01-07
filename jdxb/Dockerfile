
#FROM docker.m.daocloud.io/library/ubuntu:latest
FROM ubuntu:latest
COPY owjdxb /owjdxb
COPY run.sh /run.sh
RUN chmod +x /run.sh

ENTRYPOINT ["/bin/sh", "/run.sh"]
