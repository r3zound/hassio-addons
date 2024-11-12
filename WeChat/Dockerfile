# Start of Selection
FROM alpine:latest


# 安装 Python3、pip 和必要的系统依赖
RUN apk add --no-cache python3 py3-pip python3-dev \
    && apk add --no-cache gcc libffi-dev musl-dev openssl-dev

# 创建并激活虚拟环境，然后安装 Python 包
RUN python3 -m venv /opt/venv \
    && . /opt/venv/bin/activate \
    && /opt/venv/bin/python3 -m pip install --upgrade pip \
    && pip install --no-cache-dir werobot zhipuai



# 设置 PATH 环境变量，让系统识别虚拟环境中的 Python 和 pip
ENV PATH="/opt/venv/bin:$PATH"

# 设置启动命令



COPY Wechat_Robot.py /config/addon_config/wechat-server/Wechat_Robot.py
COPY config.ini /config/addon_config/wechat-server/config.ini
RUN chmod a+x /config/addon_config/wechat-server/Wechat_Robot.py



# Install pip and required packages

CMD [ "python", "/config/addon_config/wechat-server/Wechat_Robot.py" ]