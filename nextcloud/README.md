## &#9888; 开放请求 : [✨ [请求] immich 和 Nextcloud 入口支持 (打开于 2025-03-15)](https://github.com/alexbelgium/hassio-addons/issues/1812) 由 [@bessertristan09](https://github.com/bessertristan09)
## &#9888; 开放问题 : [🐛 [Nextcloud] 无法上传大文件 (打开于 2025-05-15)](https://github.com/alexbelgium/hassio-addons/issues/1866) 由 [@HaltingSleuth42](https://github.com/HaltingSleuth42)
# Home Assistant 插件: Nextcloud

[![捐赠][donation-badge]](https://www.buymeacoffee.com/alexbelgium)
[![捐赠][paypal-badge]](https://www.paypal.com/donate/?hosted_button_id=DZFULJZTP3UQA)

![版本](https://img.shields.io/badge/dynamic/json?label=Version&query=%24.version&url=https%3A%2F%2Fraw.githubusercontent.com%2Falexbelgium%2Fhassio-addons%2Fmaster%2Fnextcloud%2Fconfig.json)
![入口](https://img.shields.io/badge/dynamic/json?label=Ingress&query=%24.ingress&url=https%3A%2F%2Fraw.githubusercontent.com%2Falexbelgium%2Fhassio-addons%2Fmaster%2Fnextcloud%2Fconfig.json)
![架构](https://img.shields.io/badge/dynamic/json?color=success&label=Arch&query=%24.arch&url=https%3A%2F%2Fraw.githubusercontent.com%2Falexbelgium%2Fhassio-addons%2Fmaster%2Fnextcloud%2Fconfig.json)

[![Codacy 徽章](https://app.codacy.com/project/badge/Grade/9c6cf10bdbba45ecb202d7f579b5be0e)](https://www.codacy.com/gh/alexbelgium/hassio-addons/dashboard?utm_source=github.com&utm_medium=referral&utm_content=alexbelgium/hassio-addons&utm_campaign=Badge_Grade)
[![GitHub Super-Linter](https://img.shields.io/github/actions/workflow/status/alexbelgium/hassio-addons/weekly-supelinter.yaml?label=Lint%20code%20base)](https://github.com/alexbelgium/hassio-addons/actions/workflows/weekly-supelinter.yaml)
[![构建器](https://img.shields.io/github/actions/workflow/status/alexbelgium/hassio-addons/onpush_builder.yaml?label=Builder)](https://github.com/alexbelgium/hassio-addons/actions/workflows/onpush_builder.yaml)

[donation-badge]: https://img.shields.io/badge/Buy%20me%20a%20coffee%20(no%20paypal)-%23d32f2f?logo=buy-me-a-coffee&style=flat&logoColor=white
[paypal-badge]: https://img.shields.io/badge/Buy%20me%20a%20coffee%20with%20Paypal-0070BA?logo=paypal&style=flat&logoColor=white

![使用 Elasticsearch][elasticsearch-shield]

_感谢所有为我的仓库点星的人！要点星，请点击下面的图片，然后它会在右上角。谢谢！_

[![@alexbelgium/hassio-addons 的星标者仓库名单](https://raw.githubusercontent.com/alexbelgium/hassio-addons/master/.github/stars2.svg)](https://github.com/alexbelgium/hassio-addons/stargazers)

![下载演变](https://raw.githubusercontent.com/alexbelgium/hassio-addons/master/nextcloud/stats.png)

## 关于

各种调整和配置选项的添加。
初始派生版本来自 : https://github.com/haberda/hassio_addons
此插件基于 linuxserver.io 的 [docker 镜像](https://github.com/linuxserver/docker-nextcloud)。

## 配置

### 自定义脚本

/config/addons_autoscripts/nextcloud-ocr.sh 将在启动时执行。
要在启动时运行自定义命令，您可以尝试类似以下代码：
```bash
#!/usr/bin/with-contenv bashio
# shellcheck shell=bash

#################
# 代码注入器 #
#################

# 在此 bash 脚本中写的任何命令将在插件启动时执行
# 请参见此处的指南 : https://github.com/alexbelgium/hassio-addons/wiki/Add%E2%80%90ons-feature-:-customisation

# 初始化完成后仅运行
# shellcheck disable=SC2128
mkdir -p /scripts
if [ ! -f /app/www/public/occ ]; then cp /config/addons_autoscripts/"$(basename "${BASH_SOURCE}")" /scripts/ && exit 0; fi

echo "扫描文件"
sudo -u abc php /app/www/public/occ files:scan --all
echo "完成！"
```

### 插件选项

```yaml
default_phone_region: CN # 根据 https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2#Officially_assigned_code_elements 定义默认的手机区域
disable_updates: 防止插件自动更新应用程序
additional_apps: vim,nextcloud # 指定要安装的额外 apk 文件；用逗号分隔
PGID/PUID: 1000 # 允许设置用户。
trusted_domains: your-domain.com # 允许选择受信任的域。未在此列表中的域将被移除，除了初始配置中使用的第一个域。
OCR: false # 设置为 true 以安装 tesseract-ocr 功能。
OCRLANG: fra,eng # 可以从此页面设置任何语言（始终为三个字母）[在这里](https://tesseract-ocr.github.io/tessdoc/Data-Files#data-files-for-version-400-november-29-2016)。
data_directory: 主数据目录的路径。默认值为 `/config/data`。仅用于设置权限和预填初始安装模板。一次初始安装完成后无法更改。
enable_thumbnails: true/false # 为媒体文件启用缩略图生成（对于较旧的系统可以禁用）
use_own_certs: true/false # 如果为真，则使用指定的 certfile 和 keyfile
certfile: fullchain.pem # ssl 证书，必须位于 /ssl 中
keyfile: privkey.pem # ssl 密钥文件，必须位于 /ssl 中
localdisks: sda1 # 将您要挂载的驱动器的硬件名称用逗号分隔放入，或其标签。例如 sda1, sdb1, MYNAS...
networkdisks: "//SERVER/SHARE" # 可选，待挂载的 smbv2/3 服务器列表，用逗号分隔
cifsusername: "用户名" # 可选，smb 用户名，所有 smb 共享相同
cifspassword: "密码" # 可选，smb 密码，所有 smb 共享相同
env_memory_limit: nextcloud 可用内存限制（默认值为 512M）
env_post_max_size: nextcloud post 尺寸（默认值为 512M）
env_upload_max_filesize; nextcloud 上传大小（默认值为 512M）
```

Webui 可以在 `<your-ip>:port` 找到。

### 更改临时文件夹以避免在 HA 系统上占用嵌入式存储（感谢 @senna1992）

请参见 ; https://github.com/alexbelgium/hassio-addons/discussions/1370

### 使用 MariaDB 作为主数据库（感谢 @amaciuc）

如果您在首次运行 `webui` 时注意到以下警告：

```bash
性能警告
您选择了 SQLite 作为数据库。
SQLite 应仅用于最小和开发实例。对于生产，我们建议使用其他数据库后端。
如果您使用文件同步客户端，非常不推荐使用 SQLite。
```

并且您希望克服此问题，请按照以下步骤操作：

- 1. 安装 `mariadb` 插件，用一些随机信息配置它并启动。重要的是要成功启动它，以便在网络中被 `nextcloud` 看到。
- 2. 安装 `nextcloud` 插件（如果已安装则重新启动），查看日志，直到您注意到以下 `警告`：

  ```bash
  警告: 找到了 MariaDB 插件！无法自动配置，因为 Nextcloud 的工作方式，但您可以在首次运行 Web UI 时手动配置，使用以下值：
  数据库用户 : service
  数据库密码 : Eangohyuchae6aif7saich2nies8xaivaejaNgaev6gi3yohy8ha2aexaetei6oh
  数据库名称 : nextcloud
  主机名 : core-mariadb:3306
  ```

- 3. 返回 `mariadb` 插件，使用上述凭据进行配置并重启它。确保插件正在创建 `nextcloud` 数据库。
- 4. 进入 webui 并填写所有必需的信息。您可以查看以下示例：

![image](https://user-images.githubusercontent.com/19391765/207888717-50b43002-a5e2-4782-b5c9-1f582309df2b.png)

## 安装

此插件的安装非常简单，与安装任何其他 Hass.io 插件没有区别。

1. [将我的 Hass.io 插件库][repository] 添加到您的 Hass.io 实例中。
1. 安装此插件。
1. 单击 `保存` 按钮以存储您的配置。
1. 启动插件。
1. 检查插件的日志以查看一切是否正常。
1. 转到 webui，在那里您将创建您的用户名、密码和数据库（如果使用 mariadb，信息在日志中）。
1. 重启插件，以应用应应用的任何选项

## HA 集成

请参见此组件 : https://www.home-assistant.io/integrations/nextcloud/

[repository]: https://github.com/alexbelgium/hassio-addons
[elasticsearch-shield]: https://img.shields.io/badge/Elasticsearch-optional-blue.svg?logo=elasticsearch