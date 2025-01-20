API_PORT=$(jq -r '.api_port' /data/options.json)
WEB_PORT=$(jq -r '.web_port' /data/options.json)
/ac -p $API_PORT -mp $WEB_PORT -f /data/upload/ -dbpath /data -token 1 -lang zh -https 0 -isonlyoneprot 0