ARG BUILD_FROM
FROM $BUILD_FROM

EXPOSE 80

# inside the Docker container
RUN mkdir /var/lock && \
    opkg update && \
    opkg install uhttpd-mod-lua block-mount && \
    uci set uhttpd.main.interpreter='.lua=/usr/bin/lua' && \
    uci commit uhttpd 
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
    
    
USER root
ENTRYPOINT ["/entrypoint.sh"]
# using exec format so that /sbin/init is proc 1 (see procd docs)