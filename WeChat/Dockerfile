# Start of Selection
FROM python:3.12.7-slim
COPY Wechat_Robot.py ~/Wechat_Robot.py
# Install pip and required packages
RUN apt-get update && apt-get install -y python3-pip && \
    pip3 install zhipuai && \
    pip3 install werobot &&\
    apt-get clean && rm -rf /var/lib/apt/lists/*
# End of Selection