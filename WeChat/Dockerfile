# Start of Selection
FROM python:3.13.1-alpine3.20

# 设置时区为上海
RUN cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
    && echo "Asia/Shanghai" > /etc/timezone \
# 安装必要的系统依赖
#RUN apk add --no-cache gcc libffi-dev musl-dev openssl-dev
    && mkdir -p /usr/src/bashio \
    && curl -L -f -s "https://github.com/hassio-addons/bashio/archive/v0.16.2.tar.gz" \
        | tar -xzf - --strip 1 -C /usr/src/bashio \
    && mv /usr/src/bashio/lib /usr/lib/bashio \
    && ln -s /usr/lib/bashio/bashio /usr/bin/bashio \
    && python3 -m venv /opt/venv \
    && . /opt/venv/bin/activate \
    && /opt/venv/bin/python3 -m pip install --upgrade pip \
    && pip install --no-cache-dir werobot zhipuai

# 设置 PATH 环境变量，让系统识别虚拟环境中的 Python 和 pip
ENV PATH="/opt/venv/bin:$PATH"

# 复制脚本和配置文件
COPY docker-entrypoint.sh /docker-entrypoint.sh
COPY config.ini /config.ini
COPY Wechat_Robot.py /Wechat_Robot.py

# 给入口脚本添加执行权限
RUN chmod +x /docker-entrypoint.sh

# 设置容器启动时执行的入口点
ENTRYPOINT ["/docker-entrypoint.sh"]
