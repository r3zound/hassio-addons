{
  "name": "Xunlei(迅雷)",
  "version": "1.0.0",
  "slug": "xunlei",
  "description": "迅雷下载器,测试中，勿安装",
  "url": "https://github.com/djhui/hassio-addons",
  "init": false,
  "arch": [
    "aarch64",
    "amd64"
  ],
  "boot": "manual",

  "startup": "services",
  "ingress": true,
  "ingress_port": 2345,
  "ports": {
    "2345/tcp": 2345
  },
  "webui": "http://[HOST]:[PORT:2345]/",
  "map": [
    "media:rw",
    "share:rw"
  ],
  "privileged": [
    "SYS_ADMIN"
  ],
  "options": {
    "XL_DASHBOARD_USERNAME": "",
    "XL_DASHBOARD_PASSWORD": "",
    "XL_DIR_DOWNLOAD": "/share/sda1"
  },
  "environment": {
    "XL_DASHBOARD_USERNAME": "${XL_DASHBOARD_USERNAME}",
    "XL_DASHBOARD_PASSWORD": "${XL_DASHBOARD_PASSWORD}",
    "XL_DIR_DOWNLOAD": "${XL_DIR_DOWNLOAD}",
    "XL_DIR_DATA": "/data",
    "XL_Debug": "1"
  },
  
  "schema": {
    "XL_DASHBOARD_USERNAME": "str",
    "XL_DASHBOARD_PASSWORD": "str",
    "XL_DIR_DOWNLOAD": "str"
  }
}
