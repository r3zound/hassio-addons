
#FROM docker.m.daocloud.io/library/ubuntu:latest
FROM ubuntu:latest
COPY owjdxb /owjdxb
RUN chmod +x "/owjdxb/bin/owjdxb"
WORKDIR /owjdxb/bin/
CMD ["./owjdxb", "-s", "--store=/data"]


