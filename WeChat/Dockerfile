# Start of Selection
FROM alpine:latest

# Set environment variable for the data path (from addon configuration)
ENV DATA_PATH ${data_path}
ENV TOKEN ${TOKEN}
ENV HOST ${HOST}
ENV APP_ID ${APP_ID}
ENV ENCODING_AES_KEY ${ENCODING_AES_KEY}
ENV ZHIPUAI_KEY ${ZHIPUAI_KEY}
ENV PORT ${PORT}

# 安装 Python3、pip 和必要的系统依赖
RUN apk add --no-cache python3 py3-pip python3-dev \
    && apk add --no-cache gcc libffi-dev musl-dev openssl-dev
# Install Bashio
RUN apk add --no-cache bash jq curl \
    && curl -L https://github.com/hassio-addons/bashio/archive/v0.16.2.tar.gz | tar xz \
    && mv bashio-0.16.2 /etc/bashio \
    && ln -s /etc/bashio/lib/bashio /usr/bin/bashio

# 创建并激活虚拟环境，然后安装 Python 包
RUN python3 -m venv /opt/venv \
    && . /opt/venv/bin/activate \
    && /opt/venv/bin/python3 -m pip install --upgrade pip \
    && pip install --no-cache-dir werobot zhipuai



# 设置 PATH 环境变量，让系统识别虚拟环境中的 Python 和 pip
ENV PATH="/opt/venv/bin:$PATH"

COPY  Wechat_Robot.py /Wechat_Robot.py

COPY docker-entrypoint.sh / 
RUN chmod +x /docker-entrypoint.sh 

WORKDIR /config/addons_config/wechat-server 
CMD [ "/docker-entrypoint.sh" ]


