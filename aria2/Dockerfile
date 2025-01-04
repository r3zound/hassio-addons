FROM alpine:3.21.0

# Add env
ENV LANG C.UTF-8

# Setup base
RUN apk add --no-cache -U --virtual .build-deps \
        git \
        wget \
 && apk add --no-cache -U aria2 darkhttpd jq \
 && mkdir /webui \
 && git clone https://github.com/ziahamza/webui-aria2.git /tmp_webui \
 && mv /tmp_webui/docs /webui/webui-aria2 \
 && rm -rf /tmp_webui \
 && apk del .build-deps

COPY run.sh /
RUN chmod a+x /run.sh

CMD [ "/run.sh" ]
