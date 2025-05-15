## &#9888; 开放请求 : [✨ [REQUEST] immich 和 Nextcloud 入口支持 (开启于 2025-03-15)](https://github.com/alexbelgium/hassio-addons/issues/1812) 由 [@bessertristan09](https://github.com/bessertristan09)
## &#9888; 开放问题 : [🐛 [Nextcloud] 无法上传大文件 (开启于 2025-05-15)](https://github.com/alexbelgium/hassio-addons/issues/1866) 由 [@HaltingSleuth42](https://github.com/HaltingSleuth42)
# Home Assistant 插件: Nextcloud

[![捐赠][donation-badge]](https://www.buymeacoffee.com/alexbelgium)
[![捐赠][paypal-badge]](https://www.paypal.com/donate/?hosted_button_id=DZFULJZTP3UQA)

![版本](https://img.shields.io/badge/dynamic/json?label=Version&query=%24.version&url=https%3A%2F%2Fraw.githubusercontent.com%2Falexbelgium%2Fhassio-addons%2Fmaster%2Fnextcloud%2Fconfig.json)
![入口](https://img.shields.io/badge/dynamic/json?label=Ingress&query=%24.ingress&url=https%3A%2F%2Fraw.githubusercontent.com%2Falexbelgium%2Fhassio-addons%2Fmaster%2Fnextcloud%2Fconfig.json)
![架构](https://img.shields.io/badge/dynamic/json?color=success&label=Arch&query=%24.arch&url=https%3A%2F%2Fraw.githubusercontent.com%2Falexbelgium%2Fhassio-addons%2Fmaster%2Fnextcloud%2Fconfig.json)

[![Codacy 徽章](https://app.codacy.com/project/badge/Grade/9c6cf10bdbba45ecb202d7f579b5be0e)](https://www.codacy.com/gh/alexbelgium/hassio-addons/dashboard?utm_source=github.com&utm_medium=referral&utm_content=alexbelgium/hassio-addons&utm_campaign=Badge_Grade)
[![GitHub 超级 Linter](https://img.shields.io/github/actions/workflow/status/alexbelgium/hassio-addons/weekly-supelinter.yaml?label=Lint%20code%20base)](https://github.com/alexbelgium/hassio-addons/actions/workflows/weekly-supelinter.yaml)
[![构建器](https://img.shields.io/github/actions/workflow/status/alexbelgium/hassio-addons/onpush_builder.yaml?label=Builder)](https://github.com/alexbelgium/hassio-addons/actions/workflows/onpush_builder.yaml)

[donation-badge]: https://img.shields.io/badge/Buy%20me%20a%20coffee%20(no%20paypal)-%23d32f2f?logo=buy-me-a-coffee&style=flat&logoColor=white
[paypal-badge]: https://img.shields.io/badge/Buy%20me%20a%20coffee%20with%20Paypal-0070BA?logo=paypal&style=flat&logoColor=white

![使用 Elasticsearch][elasticsearch-shield]

_感谢所有为我的代码库点星的人！要给它点星，请点击下面的图片，然后它会位于右上角。谢谢！_

[![@alexbelgium/hassio-addons 的星标用户](https://raw.githubusercontent.com/alexbelgium/hassio-addons/master/.github/stars2.svg)](https://github.com/alexbelgium/hassio-addons/stargazers)

![下载演变](https://raw.githubusercontent.com/alexbelgium/hassio-addons/master/nextcloud/stats.png)

## 关于

各种调整和配置选项的添加。
最初的分叉版本 : https://github.com/haberda/hassio_addons
该插件基于来自 linuxserver.io 的 [docker 镜像](https://github.com/linuxserver/docker-nextcloud)。

## 配置

### 自定义脚本

/config/addons_autoscripts/nextcloud-ocr.sh 将在启动时执行。
要在启动时运行自定义命令，可以尝试以下代码：
```bash
#!/usr/bin/with-contenv bashio
# shellcheck shell=bash

#################
# 代码注入器 #
#################

# 本 bash 脚本中编写的任何命令将在插件启动时执行
# 请参见此指南 : https://github.com/alexbelgium/hassio-addons/wiki/Add%E2%80%90ons-feature-:-customisation

# 仅在初始化完成后运行
# shellcheck disable=SC2128
mkdir -p /scripts
if [ ! -f /app/www/public/occ ]; then cp /config/addons_autoscripts/"$(basename "${BASH_SOURCE}")" /scripts/ && exit 0; fi

echo "扫描文件"
sudo -u abc php /app/www/public/occ files:scan --all
echo "完成！"
```

### 插件选项

```yaml
default_phone_region: CN # 根据 https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2#Officially_assigned_code_elements 定义默认电话区域
disable_updates: Prevent automatic apps updating along addon
additional_apps: vim,nextcloud # 指定要安装的额外 apk 文件；用逗号分隔
PGID/PUID: 1000 # 允许设置用户。
trusted_domains: your-domain.com # 允许选择受信任的域。未在此列表中的域将被移除，除非是初始配置中使用的第一个域。
OCR: false # 设置为 true 以安装 tesseract-ocr 功能。
OCRLANG: fra,eng # 可以从此页面设置任何语言（始终使用三个字母）[这里](https://tesseract-ocr.github.io/tessdoc/Data-Files#data-files-for-version-400-november-29-2016)。
data_directory: 主数据目录的路径。默认为 `/config/data`。仅用于设置权限和预填充初始安装模板。一旦初始安装完成，它不能更改。
enable_thumbnails: true/false # 启用媒体文件的缩略图生成（在旧系统中禁用）
use_own_certs: true/false # 如果为 true，使用指定的 certfile 和 keyfile
certfile: fullchain.pem # ssl 证书，必须位于 /ssl 中
keyfile: privkey.pem # ssl 密钥文件，必须位于 /ssl 中
localdisks: sda1 # 输入要挂载的驱动器的硬件名称，用逗号分隔，或其标签。例如 sda1, sdb1, MYNAS...
networkdisks: "//SERVER/SHARE" # 可选，挂载的 smbv2/3 服务器列表，用逗号分隔
cifsusername: "username" # 可选，smb 用户名，所有 smb 共享相同
cifspassword: "password" # 可选，smb 密码，所有 smb 共享相同
env_memory_limit: nextcloud 可用的内存限制（默认是 512M）
env_post_max_size: nextcloud post 大小（默认是 512M）
env_upload_max_filesize: nextcloud 上传大小（默认是 512M）
```

Webui 可以在 `<你的-ip>:端口` 找到。

### 更改临时文件夹以避免在 HA 系统上膨胀 emmc（感谢 @senna1992）

参考 ; https://github.com/alexbelgium/hassio-addons/discussions/1370

### 使用 mariadb 作为主要数据库（感谢 @amaciuc）

如果您在第一次运行 `webui` 时注意到以下警告：

```bash
性能警告
您选择了 SQLite 作为数据库。
SQLite 应仅用于最小和开发实例。对于生产，我们建议使用不同的数据库后端。
如果您使用文件同步客户端，强烈建议不要使用 SQLite。
```

并且您想要解决此问题，请按照以下步骤操作：

- 1. 安装 `mariadb` 插件，用一些随机信息进行配置并启动它。成功启动至关重要，以便在网络中被 `nextcloud` 看到。
- 2. 安装 `nextcloud` 插件（如果已经安装，请重新启动），查看日志，直到您注意到以下 `警告`：

  ```bash
  警告：发现 MariaDB 插件！由于 Nextcloud 的工作方式，它不能自动配置，但您可以在首次运行 web UI 时手动配置，使用以下值：
  数据库用户 : service
  数据库密码 : Eangohyuchae6aif7saich2nies8xaivaejaNgaev6gi3yohy8ha2aexaetei6oh
  数据库名称 : nextcloud
  主机名 : core-mariadb:3306
  ```

- 3. 回到 `mariadb` 插件，使用上述凭据进行配置并重新启动。确保插件正在创建 `nextcloud` 数据库。
- 4. 进入 webui 并填写所有必需的信息。您可以查看示例：

![image](https://user-images.githubusercontent.com/19391765/207888717-50b43002-a5e2-4782-b5c9-1f582309df2b.png)

## 安装

该插件的安装非常简单，与安装其他 Hass.io 插件没有区别。

1. [将我的 Hass.io 插件库][repository] 添加到您的 Hass.io 实例。
1. 安装此插件。
1. 点击 `保存` 按钮以保存您的配置。
1. 启动插件。
1. 检查插件的日志，查看一切是否正常。
1. 转到 webui，创建您的用户名、密码和数据库（如果使用 mariadb，信息在日志中）。
1. 重新启动插件，以应用应应用的任何选项。

## HA 集成

请参见此组件 : https://www.home-assistant.io/integrations/nextcloud/

[repository]: https://github.com/alexbelgium/hassio-addons
[elasticsearch-shield]: https://img.shields.io/badge/Elasticsearch-optional-blue.svg?logo=elasticsearch