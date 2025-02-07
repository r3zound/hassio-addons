ARG BUILD_FROM
FROM $BUILD_FROM
#VOLUME [ "/data" ]
#EXPOSE 80

#RUN mkdir -p /data/usr && \
#    cp -a /usr/ /data/usr/ && \
##    rm -rf /usr && \
#    ln -s /data/usr /usr && \
#    mkdir -p /data/etc && \
#    cp -a /etc/ /data/etc/ && \
#    rm -rf /etc && \
#    ln -s /data/etc /etc
#COPY overlay_setup /etc/init.d/overlay_setup
RUN mkdir /var/lock && \
    opkg update && \
    opkg install uhttpd-mod-lua && \
    uci set uhttpd.main.interpreter='.lua=/usr/bin/lua' && \
    uci commit uhttpd
#    chmod +x /etc/init.d/overlay_setup && \
#    /etc/init.d/overlay_setup enable && \
#    /etc/init.d/overlay_setup start 

USER root
ENTRYPOINT [ "/sbin/init" ]
# using exec format so that /sbin/init is proc 1 (see procd docs)