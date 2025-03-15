# Home Assistant 插件：Piwigo

[![捐赠][donation-badge]](https://www.buymeacoffee.com/alexbelgium)
[![捐赠][paypal-badge]](https://www.paypal.com/donate/?hosted_button_id=DZFULJZTP3UQA)

![版本](https://img.shields.io/badge/dynamic/json?label=Version&query=%24.version&url=https%3A%2F%2Fraw.githubusercontent.com%2Falexbelgium%2Fhassio-addons%2Fmaster%2Fpiwigo%2Fconfig.json)
![入口](https://img.shields.io/badge/dynamic/json?label=Ingress&query=%24.ingress&url=https%3A%2F%2Fraw.githubusercontent.com%2Falexbelgium%2Fhassio-addons%2Fmaster%2Fpiwigo%2Fconfig.json)
![架构](https://img.shields.io/badge/dynamic/json?color=success&label=Arch&query=%24.arch&url=https%3A%2F%2Fraw.githubusercontent.com%2Falexbelgium%2Fhassio-addons%2Fmaster%2Fpiwigo%2Fconfig.json)

[![Codacy 徽章](https://app.codacy.com/project/badge/Grade/9c6cf10bdbba45ecb202d7f579b5be0e)](https://www.codacy.com/gh/alexbelgium/hassio-addons/dashboard?utm_source=github.com&utm_medium=referral&utm_content=alexbelgium/hassio-addons&utm_campaign=Badge_Grade)
[![GitHub Super-Linter](https://img.shields.io/github/actions/workflow/status/alexbelgium/hassio-addons/weekly-supelinter.yaml?label=Lint%20code%20base)](https://github.com/alexbelgium/hassio-addons/actions/workflows/weekly-supelinter.yaml)
[![构建器](https://img.shields.io/github/actions/workflow/status/alexbelgium/hassio-addons/onpush_builder.yaml?label=Builder)](https://github.com/alexbelgium/hassio-addons/actions/workflows/onpush_builder.yaml)

[donation-badge]: https://img.shields.io/badge/Buy%20me%20a%20coffee%20(no%20paypal)-%23d32f2f?logo=buy-me-a-coffee&style=flat&logoColor=white
[paypal-badge]: https://img.shields.io/badge/Buy%20me%20a%20coffee%20with%20Paypal-0070BA?logo=paypal&style=flat&logoColor=white

_感谢每一个给我的仓库加星的人！要给我加星，请点击下面的图片，然后会在右上角显示。谢谢！_

[![@alexbelgium/hassio-addons 的 Stargazers 仓库名单](https://raw.githubusercontent.com/alexbelgium/hassio-addons/master/.github/stars2.svg)](https://github.com/alexbelgium/hassio-addons/stargazers)

![下载演变](https://raw.githubusercontent.com/alexbelgium/hassio-addons/master/piwigo/stats.png)

## 关于

Piwigo 是一个用于 Web 的照片画廊软件。
此插件基于 linuxserver.io 的 [docker 镜像](https://github.com/linuxserver/piwigo)。

## 安装

此插件的安装非常简单，与安装任何其他 Hass.io 插件没有区别。

1. [将我的 Hass.io 插件库][repository] 添加到你的 Hass.io 实例。
1. 安装此插件。
1. 点击 `保存` 按钮以保存你的配置。
1. 启动插件。
1. 检查插件的日志以查看一切是否正常。
1. 仔细配置插件以满足你的需求，具体请参见官方文档。

## 配置

1. 你必须为 Piwigo 在 mysql/mariadb 服务器上创建一个用户和数据库。
1. 在数据库的设置页面中，使用 IP 地址而不是主机名。
1. 基本的 nginx 配置文件可以在 /config/piwigo/nginx/site-confs 中找到，编辑该文件以启用 ssl（默认端口 443），设置服务器名称等。
1. 自签名的密钥在第一次运行容器时生成，可以在 /data/keys 中找到，如果需要，你可以用自己的密钥替换。
1. 编辑配置文件最简单的方法是进入 /config/piwigo，使用 Home Assistant 的本地文件编辑器配置电子邮件设置等。

Web 界面可以通过 <http://homeassistant:81> 访问。

```yaml
PGID: user
GPID: user
localdisks: sda1 #输入要挂载的硬盘的硬件名称，用逗号分隔，或其标签。例：sda1, sdb1, MYNAS...
networkdisks: "<//SERVER/SHARE>" # 要挂载的 smbv2/3 服务器列表（可选）
cifsusername: "username" # smb 用户名（可选）
cifspassword: "password" # smb 密码（可选）
```

[repository]: https://github.com/alexbelgium/hassio-addons