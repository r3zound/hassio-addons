ARG BUILD_FROM
FROM ${BUILD_FROM}

ENV PUID=0
ENV PGID=0
ENV UMASK=022

COPY docker-entrypoint.sh /docker-entrypoint.sh
RUN chmod +x /docker-entrypoint.sh
WORKDIR "/config/addons_config/Alist"

ENTRYPOINT ["/docker-entrypoint.sh"]