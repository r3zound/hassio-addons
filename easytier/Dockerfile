# 使用基础镜像
FROM easytier/easytier:v2.2.2




RUN apk add --no-cache jq

COPY run.sh /run.sh
RUN chmod a+x /run.sh

# 设置容器启动时执行的命令
CMD ["/run.sh"]
