# Start of Selection
FROM python:3.12.7-slim

# Install pip and required packages
RUN apt-get update && apt-get install -y python3-pip && \
    pip3 install zhipuai && \
    apt-get clean && rm -rf /var/lib/apt/lists/*
# End of Selection