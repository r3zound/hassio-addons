#!/usr/bin/with-contenv bashio

# Export options from configuration as environment variables
export DATA_PATH=$(bashio::config 'data_path')
export TOKEN=$(bashio::config 'TOKEN')
export HOST=$(bashio::config 'HOST')
export APP_ID=$(bashio::config 'APP_ID')
export ENCODING_AES_KEY=$(bashio::config 'ENCODING_AES_KEY')
export ZHIPUAI_KEY=$(bashio::config 'ZhipuAI')

# Optionally, print variables for debugging (remove in production)
echo "DATA_PATH=$DATA_PATH"
echo "TOKEN=$TOKEN"
echo "HOST=$HOST"
echo "APP_ID=$APP_ID"
echo "ENCODING_AES_KEY=$ENCODING_AES_KEY"
echo "ZHIPUAI_KEY=$ZHIPUAI_KEY"



mkdir -p /config/addons_config/wechat-server 
cd /config/addons_config/wechat-server 

cp /Wechat_Robot.py /config/addons_config/wechat-server/Wechat_Robot.py

python /config/addons_config/wechat-server/Wechat_Robot.py

