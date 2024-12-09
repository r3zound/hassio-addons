# Start of Selection
FROM python:3.13.1-alpine3.20

# 设置时区为上海
RUN cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
    && echo "Asia/Shanghai" > /etc/timezone

# 安装必要的系统依赖
#RUN apk add --no-cache gcc libffi-dev musl-dev openssl-dev

# 创建虚拟环境并安装 Python 包
RUN python3 -m venv /opt/venv \
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
