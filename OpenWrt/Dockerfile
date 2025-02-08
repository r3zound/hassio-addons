ARG BUILD_FROM
FROM $BUILD_FROM
#VOLUME [ "/data" ]
#EXPOSE 80

RUN rm -rf /overylay && \
    ln -s /data /overlay

RUN mkdir /var/lock && \
    opkg update && \
    opkg install uhttpd-mod-lua block-mount && \
    uci set uhttpd.main.interpreter='.lua=/usr/bin/lua' && \
    uci commit uhttpd
#    chmod +x /etc/init.d/overlay_setup && \
#    /etc/init.d/overlay_setup enable && \
#    /etc/init.d/overlay_setup start 

USER root
ENTRYPOINT [ "/sbin/init" ]
# using exec format so that /sbin/init is proc 1 (see procd docs)