#!/bin/sh

# 确保目录存在
# 只有在/data下没有对应目录时才执行初始化
if [ ! -d "/data/etc" ]; then
    mkdir -p /data/etc
    cp -a /etc/ /data/etc/
    rm -rf /etc
    ln -s /data/etc /etc
fi



if [ ! -d "/data/usr" ]; then
    mkdir -p /data/usr
    cp -a /usr/ /data/usr/
    rm -rf /usr
    ln -s /data/usr /usr
fi

# 启动主进程

