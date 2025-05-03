# Home assistant 插件: Photoprism

[![Donate][donation-badge]](https://www.buymeacoffee.com/alexbelgium)
[![Donate][paypal-badge]](https://www.paypal.com/donate/?hosted_button_id=DZFULJZTP3UQA)

![版本](https://img.shields.io/badge/dynamic/json?label=Version&query=%24.version&url=https%3A%2F%2Fraw.githubusercontent.com%2Falexbelgium%2Fhassio-addons%2Fmaster%2Fphotoprism%2Fconfig.json)
![Ingress](https://img.shields.io/badge/dynamic/json?label=Ingress&query=%24.ingress&url=https%3A%2F%2Fraw.githubusercontent.com%2Falexbelgium%2Fhassio-addons%2Fmaster%2Fphotoprism%2Fconfig.json)
![架构](https://img.shields.io/badge/dynamic/json?color=success&label=Arch&query=%24.arch&url=https%3A%2F%2Fraw.githubusercontent.com%2Falexbelgium%2Fhassio-addons%2Fmaster%2Fphotoprism%2Fconfig.json)

[![Codacy 徽章](https://app.codacy.com/project/badge/Grade/9c6cf10bdbba45ecb202d7f579b5be0e)](https://www.codacy.com/gh/alexbelgium/hassio-addons/dashboard?utm_source=github.com&utm_medium=referral&utm_content=alexbelgium/hassio-addons&utm_campaign=Badge_Grade)
[![GitHub Super-Linter](https://img.shields.io/github/actions/workflow/status/alexbelgium/hassio-addons/weekly-supelinter.yaml?label=Lint%20code%20base)](https://github.com/alexbelgium/hassio-addons/actions/workflows/weekly-supelinter.yaml)
[![构建器](https://img.shields.io/github/actions/workflow/status/alexbelgium/hassio-addons/onpush_builder.yaml?label=Builder)](https://github.com/alexbelgium/hassio-addons/actions/workflows/onpush_builder.yaml)

[donation-badge]: https://img.shields.io/badge/Buy%20me%20a%20coffee%20(no%20paypal)-%23d32f2f?logo=buy-me-a-coffee&style=flat&logoColor=white
[paypal-badge]: https://img.shields.io/badge/Buy%20me%20a%20coffee%20with%20Paypal-0070BA?logo=paypal&style=flat&logoColor=white

最低配置要求: 2 个核心和 4 GB 内存

_感谢所有给我的仓库点星的人！要点星，请点击下面的图像，然后在右上角即可。谢谢！_

[![Stargazers repo roster for @alexbelgium/hassio-addons](https://raw.githubusercontent.com/alexbelgium/hassio-addons/master/.github/stars2.svg)](https://github.com/alexbelgium/hassio-addons/stargazers)

![下载演变](https://raw.githubusercontent.com/alexbelgium/hassio-addons/master/photoprism/stats.png)

## 关于

一个基于服务器的应用程序，用于浏览、组织和分享您的个人照片集合。

项目主页 : https://github.com/photoprism/photoprism

基于 docker 镜像 : https://hub.docker.com/r/photoprism/photoprism

## 安装

这个插件的安装非常简单，与安装其他 Hass.io 插件没有区别。

1. [将我的 Hass.io 插件仓库][repository] 添加到您的 Hass.io 实例。
1. 安装此插件。
1. 点击 `保存` 按钮以保存您的配置。
1. 启动插件。
1. 检查插件的日志以查看是否一切正常。
1. 根据您的偏好仔细配置插件，具体请参见官方文档。

## 配置

默认用户 : admin
默认密码 : 请更改密码

要访问 webdav，使用的 URL : http://local-ip:addon-port/api/hassio.../originals
第二部分 (/api.../originals) 在启动插件时的日志中描述

选项可以通过两种方式进行配置：

- 插件选项

```yaml
ssl: true/false
certfile: fullchain.pem #ssl 证书，必须位于 /ssl
keyfile: privkey.pem #ssl 私钥文件，必须位于 /ssl
DB_TYPE: "list(sqlite|mariadb_addon|external)" # 如果安装了 mariadb 插件，则自动配置，sqlite 不需要配置
localdisks: sda1 # 输入您要挂载的驱动器的硬件名称，多个名称用逗号分隔，或其标签。比如：sda1, sdb1, MYNAS...
networkdisks: "//SERVER/SHARE" # 可选，要挂载的 smb 服务器列表，用逗号分隔
cifsusername: "username" # 可选，smb 用户名，所有 smb 共享相同
cifspassword: "password" # 可选，smb 密码
cifsdomain: "domain" # 可选，允许设置 smb 共享域
ingress_disable: false # 可选，如果为真，则禁用 ingress 并简化使用 IP:port 访问的 URL
UPLOAD_NSFW: "true" 允许上传可能冒犯的内容
STORAGE_PATH: "/share/photoprism/storage" # 缓存、数据库和侧边文件的存储路径
ORIGINALS_PATH: "/share/photoprism/originals" # 包含您的照片和视频收藏的原始路径
IMPORT_PATH: "/share/photoprism/import" # 导入文件到原始的路径
BACKUP_PATH: "/share/photoprism/backup" # 备份存储路径
CONFIG_LOCATION: "/config/addons_config/config.yaml" # 设置 config.yaml 的位置（见下文）
```

- Config.yaml

通过自定义位于 /config/addons_config/config.yaml 的 config.yaml 进行配置

完整的选项列表请见这里 : https://github.com/photoprism/photoprism/blob/develop/docker-compose.yml

- 外部数据库设置 (@wesleygas)

允许使用外部数据库。这可以通过正确设置 addons_config/photoprism/config.yaml 中的以下选项来完成：

```yaml
PHOTOPRISM_DATABASE_DRIVER: "mysql"
PHOTOPRISM_DATABASE_SERVER: "IP:PORT"
PHOTOPRISM_DATABASE_NAME: "photoprism"
PHOTOPRISM_DATABASE_USER: "USERNAME"
PHOTOPRISM_DATABASE_PASSWORD: "PASSWORD"
```
## 使用 Photoprism 命令行界面

Photoprism 还提供了命令行界面：

https://docs.photoprism.app/getting-started/docker-compose/#command-line-interface

可以通过 portainer 插件访问，或通过 _ssh_ 执行 `docker exec -it <photoprism container id> bash`。

:warning: 请勿使用 `docker exec <photoprism container id> photoprism`，因为这将导致不可预测的行为。

## 插图

![1622396210_840_560](https://user-images.githubusercontent.com/44178713/127819841-2281ac79-ea96-4b41-9704-522957c5b9c3.jpg)

## 支持

在 Github 上创建一个 issue

[repository]: https://github.com/alexbelgium/hassio-addons