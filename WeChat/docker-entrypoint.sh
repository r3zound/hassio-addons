#!/bin/sh



mkdir -p /config/addons_config/wechat-server 
cd /config/addons_config/wechat-server 



if [ ! -f /config/addons_config/wechat-server/config.ini ]; then
    cp /config.ini /config/addons_config/wechat-server/config.ini
fi


python /Wechat_Robot.py

