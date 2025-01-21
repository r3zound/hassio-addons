ARG BUILD_FROM
FROM $BUILD_FROM
#VOLUME [ "/data" ]
EXPOSE 80

#RUN mkdir -p /data/usr && \
#    cp -a /usr/ /data/usr/ && \
##    rm -rf /usr && \
#    ln -s /data/usr /usr && \
#    mkdir -p /data/etc && \
#    cp -a /etc/ /data/etc/ && \
#    rm -rf /etc && \
#    ln -s /data/etc /etc

RUN mkdir /var/lock && \
    opkg update && \
    opkg install uhttpd-mod-lua block-mount && \
    uci set uhttpd.main.interpreter='.lua=/usr/bin/lua' && \
    uci commit uhttpd 



#COPY entrypoint.sh /entrypoint.sh
#RUN chmod +x /entrypoint.sh
    
    
USER root
ENTRYPOINT ["/sbin/init"]
# using exec format so that /sbin/init is proc 1 (see procd docs)