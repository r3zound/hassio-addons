# Start of Selection
FROM alpine:latest


# 安装 Python3、pip 和必要的系统依赖
RUN apk add --no-cache python3 py3-pip python3-dev gcc libffi-dev musl-dev openssl-dev tzdata \
    && cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
    && echo "Asia/Shanghai" > /etc/timezone \
    && python3 -m venv /venv \
    && . /venv/bin/activate \
    && pip install --upgrade pip \
    && pip install --no-cache-dir werobot zhipuai \
    && apk del tzdata  # Optional: remove tzdata to keep the image slim



# 设置 PATH 环境变量，让系统识别虚拟环境中的 Python 和 pip
ENV PATH="/opt/venv/bin:$PATH"


COPY docker-entrypoint.sh /docker-entrypoint.sh 
COPY config.ini /config.ini 
COPY Wechat_Robot.py /Wechat_Robot.py 
RUN chmod +x /docker-entrypoint.sh 

ENTRYPOINT [ "/docker-entrypoint.sh" ]


