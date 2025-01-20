ARG BUILD_FROM
FROM $BUILD_FROM

EXPOSE 80

# inside the Docker container
RUN mkdir /var/lock && \
    opkg update && \
    opkg install uhttpd-mod-lua block-mount && \
    uci set uhttpd.main.interpreter='.lua=/usr/bin/lua' && \
    uci commit uhttpd && \
    echo "config mount" >> /etc/config/fstab && \
    echo "    option target '/overlay'" >> /etc/config/fstab && \
    echo "    option device '/'" >> /etc/config/fstab && \
    echo "    option fstype 'overlayfs'" >> /etc/config/fstab && \
    echo "    option enabled '1'" >> /etc/config/fstab

USER root

# using exec format so that /sbin/init is proc 1 (see procd docs)
CMD ["/sbin/init"]