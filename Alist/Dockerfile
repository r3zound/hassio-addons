ARG BUILD_FROM
FROM ${BUILD_FROM}


COPY docker-entrypoint.sh /
RUN chmod +x /docker-entrypoint.sh
WORKDIR "/config/addons_config/Alist"

CMD ["/docker-entrypoint.sh"]