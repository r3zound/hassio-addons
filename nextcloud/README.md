## &#9888; 开放问题 : [🐛 [Nextcloud] NTFS支持 (打开于2025-02-27)](https://github.com/alexbelgium/hassio-addons/issues/1789) 由 [@Nidalone29](https://github.com/Nidalone29)
# 家庭助理插件：Nextcloud

[![捐赠][donation-badge]](https://www.buymeacoffee.com/alexbelgium)
[![捐赠][paypal-badge]](https://www.paypal.com/donate/?hosted_button_id=DZFULJZTP3UQA)

![版本](https://img.shields.io/badge/dynamic/json?label=Version&query=%24.version&url=https%3A%2F%2Fraw.githubusercontent.com%2Falexbelgium%2Fhassio-addons%2Fmaster%2Fnextcloud%2Fconfig.json)
![入口](https://img.shields.io/badge/dynamic/json?label=Ingress&query=%24.ingress&url=https%3A%2F%2Fraw.githubusercontent.com%2Falexbelgium%2Fhassio-addons%2Fmaster%2Fnextcloud%2Fconfig.json)
![架构](https://img.shields.io/badge/dynamic/json?color=success&label=Arch&query=%24.arch&url=https%3A%2F%2Fraw.githubusercontent.com%2Falexbelgium%2Fhassio-addons%2Fmaster%2Fnextcloud%2Fconfig.json)

[![Codacy徽章](https://app.codacy.com/project/badge/Grade/9c6cf10bdbba45ecb202d7f579b5be0e)](https://www.codacy.com/gh/alexbelgium/hassio-addons/dashboard?utm_source=github.com&utm_medium=referral&utm_content=alexbelgium/hassio-addons&utm_campaign=Badge_Grade)
[![GitHub超级Linter](https://img.shields.io/github/actions/workflow/status/alexbelgium/hassio-addons/weekly-supelinter.yaml?label=Lint%20code%20base)](https://github.com/alexbelgium/hassio-addons/actions/workflows/weekly-supelinter.yaml)
[![构建者](https://img.shields.io/github/actions/workflow/status/alexbelgium/hassio-addons/onpush_builder.yaml?label=Builder)](https://github.com/alexbelgium/hassio-addons/actions/workflows/onpush_builder.yaml)

[donation-badge]: https://img.shields.io/badge/Buy%20me%20a%20coffee%20(no%20paypal)-%23d32f2f?logo=buy-me-a-coffee&style=flat&logoColor=white
[paypal-badge]: https://img.shields.io/badge/Buy%20me%20a%20coffee%20with%20Paypal-0070BA?logo=paypal&style=flat&logoColor=white

![使用elasticsearch][elasticsearch-shield]

_感谢所有为我的仓库点过⭐的人！要点星，请点击下面的图片，然后它将在右上角。谢谢！_

[![为@alexbelgium/hassio-addons的星际者仓库名单](https://raw.githubusercontent.com/alexbelgium/hassio-addons/master/.github/stars2.svg)](https://github.com/alexbelgium/hassio-addons/stargazers)

![下载演变](https://raw.githubusercontent.com/alexbelgium/hassio-addons/master/nextcloud/stats.png)

## 关于

各种调整和配置选项的添加。
最初的分叉版本： https://github.com/haberda/hassio_addons
此插件基于来自linuxserver.io的[docker镜像](https://github.com/linuxserver/docker-nextcloud)。

## 配置

### 自定义脚本

/config/addons_autoscripts/nextcloud-ocr.sh将在启动时执行。
要在启动时运行自定义命令，您可以尝试以下代码：
```bash
#!/usr/bin/with-contenv bashio
# shellcheck shell=bash

#################
# 代码注入器 #
#################

# 此bash脚本中编写的任何命令将在插件启动时执行
# 参见此指南： https://github.com/alexbelgium/hassio-addons/wiki/Add%E2%80%90ons-feature-:-customisation

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
default_phone_region: CN # 根据 https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2#Officially_assigned_code_elements 定义默认电话号码区域
disable_updates: 防止自动应用更新
additional_apps: vim,nextcloud #指定要安装的其他apk文件；以逗号分隔
PGID/PUID: 1000 #允许设置用户。
trusted_domains: your-domain.com #允许选择受信任的域。未列入此列表的域将被移除，除非是初始配置中使用的第一个域。
OCR: false #设置为true以安装tesseract-ocr功能。
OCRLANG: fra,eng #可以从此页面设置任何语言（始终为三个字母） [这里](https://tesseract-ocr.github.io/tessdoc/Data-Files#data-files-for-version-400-november-29-2016).
data_directory: 主要数据目录的路径。默认为`/config/data`。仅用于设置权限和预填初始安装模板。一旦初始安装完成，无法更改
enable_thumbnails: true/false # 启用生成媒体文件的缩略图（对旧系统禁用）
use_own_certs: true/false #如果为真，使用指定的证书文件和密钥文件
certfile: fullchain.pem #ssl证书，必须位于/ssl中
keyfile: privkey.pem #ssl密钥文件，必须位于/ssl中
localdisks: sda1 #将要挂载的磁盘的硬件名称以逗号分隔，或其标签。例如：sda1，sdb1，MYNAS...
networkdisks: "//SERVER/SHARE" # 可选，要挂载的smbv2/3服务器列表，以逗号分隔
cifsusername: "username" # 可选，smb用户名，所有smb共享相同
cifspassword: "password" # 可选，smb密码，所有smb共享相同
env_memory_limit: nextcloud可用内存限制（默认值为512M）
env_post_max_size: nextcloud post大小（默认值为512M）
env_upload_max_filesize; nextcloud上传大小（默认值为512M）
```

Webui可以在`<your-ip>:port`找到。

### 更改临时文件夹以避免在HA系统上膨胀EMMC（感谢@senna1992）

见： https://github.com/alexbelgium/hassio-addons/discussions/1370

### 使用mariadb作为主数据库（感谢@amaciuc）

如果您在首次运行`webui`时注意到以下警告：

```bash
性能警告
您选择了SQLite作为数据库。
SQLite仅应用于最小和开发实例。我们建议在生产中使用其他数据库后端。
如果您使用文件同步客户端，则强烈不建议使用SQLite。
```

并且您想克服这个问题，请按照以下步骤操作：

- 1. 安装`mariadb`插件，使用一些随机信息进行配置并启动。成功启动它以便被`nextcloud`在网络中识别非常重要。
- 2. 安装`nextcloud`插件（如果已安装则重启），观看日志直到您注意到以下`警告`：

  ```bash
  警告：发现MariaDB插件！由于Nextcloud的工作方式，它无法自动配置，但您可以在首次运行Web UI时使用以下值手动配置：
  数据库用户：service
  数据库密码：Eangohyuchae6aif7saich2nies8xaivaejaNgaev6gi3yohy8ha2aexaetei6oh
  数据库名称：nextcloud
  主机名：core-mariadb:3306
  ```

- 3. 返回`mariadb`插件，使用上述凭据进行配置并重新启动。确保该插件正在创建`nextcloud`数据库。
- 4. 进入webui并填写所有必填信息。您可以查看以下示例：

![image](https://user-images.githubusercontent.com/19391765/207888717-50b43002-a5e2-4782-b5c9-1f582309df2b.png)

## 安装

此插件的安装非常简单，与安装任何其他Hass.io插件没有区别。

1. [将我的Hass.io插件库][repository]添加到您的Hass.io实例中。
1. 安装此插件。
1. 点击`保存`按钮以存储您的配置。
1. 启动插件。
1. 检查插件的日志以查看是否一切正常。
1. 转到webui，在那里您将创建用户名、密码和数据库（如果使用mariadb，则信息在日志中）
1. 重新启动插件，以应用所有应应用的选项

## HA集成

参见此组件： https://www.home-assistant.io/integrations/nextcloud/

[repository]: https://github.com/alexbelgium/hassio-addons
[elasticsearch-shield]: https://img.shields.io/badge/Elasticsearch-optional-blue.svg?logo=elasticsearch