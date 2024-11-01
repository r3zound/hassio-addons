ARG BUILD_FROM
FROM $BUILD_FROM

# Setup base

# Copy data


COPY /etc/ssl/certs /etc/ssl/certs

COPY vocechat-server /home/vocechat-server/vocechat-server

COPY data /home/vocechat-server/data

COPY config /home/vocechat-server/config 
	
COPY docker-entrypoint.sh / 
	
RUN RUN chmod +x /docker-entrypoint.sh 


WORKDIR /home/vocechat-server