# 使用基础镜像
FROM easytier/easytier:latest




RUN apk add --no-cache jq

COPY run.sh /run.sh
RUN chmod a+x /run.sh

# 设置容器启动时执行的命令
CMD ["/bin/ash" "/run.sh"]
