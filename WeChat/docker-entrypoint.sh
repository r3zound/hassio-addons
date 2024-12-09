#!/usr/bin/with-contenv bashio

export TOKEN=$(bashio::config 'TOKEN')
export HOST=$(bashio::config 'HOST')
export APP_ID=$(bashio::config 'APP_ID')
export APP_SECRET=$(bashio::config 'APP_SECRET')
export ENCODING_AES_KEY=$(bashio::config 'ENCODING_AES_KEY')
export ZhipuAI=$(bashio::config  'ZhipuAI')


mkdir -p /config/addons_config/wechat-server 
cd /config/addons_config/wechat-server 



if [ ! -f /config/addons_config/wechat-server/config.ini ]; then
    cp /config.ini /config/addons_config/wechat-server/config.ini
fi


python /Wechat_Robot.py
