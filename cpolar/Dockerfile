FROM probezy/cpolar:3.3.18



COPY run.sh /
RUN chmod a+x /run.sh


WORKDIR /data

EXPOSE 9200

CMD [ "/run.sh" ]
