# Define build-time arguments
ARG BUILD_ARCH
ARG DOWNLOAD_URL

# Set base image
FROM docker.m.daocloud.io/library/alpine:3.21

# Set environment variables for use later in the Dockerfile
ENV BUILD_ARCH=$BUILD_ARCH
ENV DOWNLOAD_URL=$DOWNLOAD_URL

# Install necessary dependencies
RUN apk add --no-cache wget jq

# Download the file using the passed URL
RUN wget -O /ac "$DOWNLOAD_URL" && chmod +x /ac

# Copy and prepare the run script
COPY run.sh /run.sh
RUN chmod +x /run.sh

# Set default command
CMD ["/run.sh"]
