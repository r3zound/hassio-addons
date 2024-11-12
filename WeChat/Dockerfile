# Start from Alpine
FROM alpine:latest

# Install Python3, pip, and system dependencies
RUN apk add --no-cache python3 py3-pip python3-dev \
    && apk add --no-cache gcc libffi-dev musl-dev openssl-dev

# Create and activate a virtual environment, then install Python packages
RUN python3 -m venv /opt/venv \
    && . /opt/venv/bin/activate \
    && /opt/venv/bin/python3 -m pip install --upgrade pip \
    && pip install --no-cache-dir werobot zhipuai

# Set PATH to include the virtual environment's binaries
ENV PATH="/opt/venv/bin:$PATH"

# Copy application and entrypoint script
COPY Wechat_Robot.py /Wechat_Robot.py
COPY docker-entrypoint.sh /docker-entrypoint.sh

# Ensure entrypoint script is executable
RUN chmod +x /docker-entrypoint.sh

# Set the working directory
WORKDIR /config/addons_config/wechat-server

# Use docker-entrypoint.sh as the entrypoint, which will set environment variables
ENTRYPOINT ["/docker-entrypoint.sh"]
