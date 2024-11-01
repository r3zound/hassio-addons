#FROM alpine as certs
#RUN apk update && apk add ca-certificates

FROM busybox
RUN mkdir -p /addon_configs/vocechat-server
#COPY --from=certs /etc/ssl/certs /etc/ssl/certs

#COPY vocechat-server /home/vocechat-server/vocechat-server

#COPY vocechat-server /addon_configs/vocechat-server/vocechat-server

#COPY config /home/vocechat-server/config

#COPY config /addon_configs/vocechat-server/config
COPY docker-entrypoint.sh /
RUN chmod +x /docker-entrypoint.sh
#ENV VOCECHAT_FCM_PROJECT_ID=""\
#    VOCECHAT_FCM_PRIVATE_KEY=""\
##    VOCECHAT_FCM_CLIENT_EMAIL=""\
#    VOCECHAT_FCM_TOKEN_URI="https://oauth2.googleapis.com/token"
EXPOSE 3000
WORKDIR /addon_configs/vocechat-server
ENTRYPOINT ["/docker-entrypoint.sh"]