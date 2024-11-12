#!/usr/bin/with-contenv bashio

# Export options from configuration as environment variables
export DATA_PATH=$(bashio::config 'data_path')
export TOKEN=$(bashio::config 'TOKEN')
export HOST=$(bashio::config 'HOST')
export APP_ID=$(bashio::config 'APP_ID')
export ENCODING_AES_KEY=$(bashio::config 'ENCODING_AES_KEY')
export ZHIPUAI_KEY=$(bashio::config 'ZhipuAI')



mkdir -p /config/addons_config/wechat-server 
cd /config/addons_config/wechat-server 
if [ ! -f "/config/addons_config/wechat-server/Wechat_Robot.py" ]; then
cp /Wechat_Robot.py /config/addons_config/wechat-server/Wechat_Robot.py
fi


python /config/addons_config/wechat-server/Wechat_Robot.py

