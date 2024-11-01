FROM alpine as certs
RUN apk update && apk add ca-certificates

FROM busybox
COPY --from=certs /etc/ssl/certs /etc/ssl/certs
COPY vocechat-server /config/addon_config/vocechat-server/vocechat-server
COPY config /config/addon_config/vocechat-server/config
COPY docker-entrypoint.sh /
RUN chmod +x /docker-entrypoint.sh
#
#    VOCECHAT_FCM_PRIVATE_KEY=""\
#    VOCECHAT_FCM_CLIENT_EMAIL=""\
#    VOCECHAT_FCM_TOKEN_URI="https://oauth2.googleapis.com/token"
EXPOSE 3000
WORKDIR /config/addon_config/vocechat-server
ENTRYPOINT ["/docker-entrypoint.sh"]