# Start of Selection
FROM python:3.12.7-alpine3.20

# 设置时区为上海
RUN cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
    && echo "Asia/Shanghai" > /etc/timezone \
    && python3 -m venv /opt/venv \
    && . /opt/venv/bin/activate \
    && /opt/venv/bin/python3 -m pip install --upgrade pip \
    && pip install --no-cache-dir paho-mqtt

COPY EZVIZ.py /EZVIZ.py

# 给入口脚本添加执行权限
RUN chmod +x /docker-entrypoint.sh

# 设置容器启动时执行的入口点
# Start of Selection
CMD ["python", "/EZVIZ.py"]
