FROM probezy/cpolar:3.3.18


ENV LANG C.UTF-8
RUN apk add --no-cache jq
COPY run.sh /
RUN chmod a+x /run.sh


WORKDIR /data

EXPOSE 9200

CMD [ "/run.sh" ]
