#!/bin/sh



mkdir -p /config/addons_config/wechat-server 
cd /config/addons_config/wechat-server 

cp /Wechat_Robot.py /config/addons_config/wechat-server/Wechat_Robot.py

echo "DATA_PATH=$data_path" > /config/addons_config/wechat-server/.env
echo "TOKEN=$TOKEN" >> /config/addons_config/wechat-server/.env
echo "HOST=$HOST" >> /config/addons_config/wechat-server/.env
echo "APP_ID=$APP_ID" >> /config/addons_config/wechat-server/.env
echo "ENCODING_AES_KEY=$ENCODING_AES_KEY" >> /config/addons_config/wechat-server/.env
echo "ZHIPUAI_KEY=$ZHIPUAI_KEY" >> /config/addons_config/wechat-server/.env
echo "PORT=$PORT" >> /config/addons_config/wechat-server/.env

# 载入 .env 文件中的环境变量
source /config/addons_config/wechat-server/.env

python /config/addons_config/wechat-server/Wechat_Robot.py

