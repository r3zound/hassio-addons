API_PORT=$(jq -r '.api_port' /data/options.json)
DEBUG=$(jq -r '.debug // 1' /data/options.json)
TOKEN=$(jq -r '.token // 1' /data/options.json)
LANG=$(jq -r '.lang // "zh"' /data/options.json)
PASSWD=$(jq -r '.passwd // ""' /data/options.json)
SHOWTIP=$(jq -r '.showtip // 1' /data/options.json)

/ac -p $API_PORT -mp 8080 -f /data/upload/ -dbpath /data -token $TOKEN -lang $LANG -https 0 -isonlyoneprot 0 -debug $DEBUG -passwd "$PASSWD" -showtip $SHOWTIP