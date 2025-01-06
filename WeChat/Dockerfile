#FROM $BUILD_FROM

FROM docker.m.daocloud.io/library/python:3.13.1-alpine3.21

#RUN apk add --no-cache python3 py-pip \
RUN python3 -m venv /opt/venv \
    && . /opt/venv/bin/activate \
    && /opt/venv/bin/python3 -m pip install --no-cache-dir --upgrade pip \
    && pip install --no-cache-dir werobot zhipuai

# 设置 PATH 环境变量，让系统识别虚拟环境中的 Python 和 pip
ENV PATH="/opt/venv/bin:$PATH"

# 复制脚本和配置文件
COPY docker-entrypoint.sh /docker-entrypoint.sh
COPY Wechat_Robot.py /Wechat_Robot.py

# 给入口脚本添加执行权限
RUN chmod +x /docker-entrypoint.sh

# 设置容器启动时执行的入口点
CMD ["python", "/Wechat_Robot.py"]
