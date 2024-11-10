#!/bin/sh

#uid=${UID:=$(id -u)}
#gid=${GID:=$(id -g)}
#admin_user=${ADMIN_USER:="admin"}
#admin_password=${ADMIN_PASSWORD:="123456"}
#domain=${DOMAIN:=""}
#
#if test ! -z $domain; then
#  sed -i "s/# domain = .*\$/domain = \"$domain\"/ig" /home/wechat-server/config/config.toml
#fi
#
#if grep -q "name = \"$admin_user\"" /home/wechat-server/config/config.toml; then
#cat <<EOT >> /home/wechat-server/config/config.toml
#[[user]]
#name = "$admin_user"
#password = "$admin_password"
#email = "$admin_user@$domain"
#is_admin = true
#EOT
#fi

cd /config/addons_config/wechat-server 


cp ~/Wechat_Robot.py /config/addons_config/wechat-server/Wechat_Robot.py




python3 Wechat_Robot.py

