# Home Assistant 附加组件: 文件浏览器

[![捐赠][donation-badge]](https://www.buymeacoffee.com/alexbelgium)
[![捐赠][paypal-badge]](https://www.paypal.com/donate/?hosted_button_id=DZFULJZTP3UQA)

![版本](https://img.shields.io/badge/dynamic/json?label=Version&query=%24.version&url=https%3A%2F%2Fraw.githubusercontent.com%2Falexbelgium%2Fhassio-addons%2Fmaster%2Ffilebrowser%2Fconfig.json)
![入口](https://img.shields.io/badge/dynamic/json?label=Ingress&query=%24.ingress&url=https%3A%2F%2Fraw.githubusercontent.com%2Falexbelgium%2Fhassio-addons%2Fmaster%2Ffilebrowser%2Fconfig.json)
![架构](https://img.shields.io/badge/dynamic/json?color=success&label=Arch&query=%24.arch&url=https%3A%2F%2Fraw.githubusercontent.com%2Falexbelgium%2Fhassio-addons%2Fmaster%2Ffilebrowser%2Fconfig.json)

[![Codacy Badge](https://app.codacy.com/project/badge/Grade/9c6cf10bdbba45ecb202d7f579b5be0e)](https://www.codacy.com/gh/alexbelgium/hassio-addons/dashboard?utm_source=github.com&utm_medium=referral&utm_content=alexbelgium/hassio-addons&utm_campaign=Badge_Grade)
[![GitHub Super-Linter](https://img.shields.io/github/actions/workflow/status/alexbelgium/hassio-addons/weekly-supelinter.yaml?label=Lint%20code%20base)](https://github.com/alexbelgium/hassio-addons/actions/workflows/weekly-supelinter.yaml)
[![构建器](https://img.shields.io/github/actions/workflow/status/alexbelgium/hassio-addons/onpush_builder.yaml?label=Builder)](https://github.com/alexbelgium/hassio-addons/actions/workflows/onpush_builder.yaml)

[donation-badge]: https://img.shields.io/badge/Buy%20me%20a%20coffee%20(no%20paypal)-%23d32f2f?logo=buy-me-a-coffee&style=flat&logoColor=white
[paypal-badge]: https://img.shields.io/badge/Buy%20me%20a%20coffee%20with%20Paypal-0070BA?logo=paypal&style=flat&logoColor=white

_感谢每一个给我的仓库加星的人！点击下面的图片给它加星，然后在右上角会看到。谢谢！_

[![给 @alexbelgium/hassio-addons 的 Stargazers 仓库名单](https://raw.githubusercontent.com/alexbelgium/hassio-addons/master/.github/stars2.svg)](https://github.com/alexbelgium/hassio-addons/stargazers)

![下载演变](https://raw.githubusercontent.com/alexbelgium/hassio-addons/master/filebrowser/stats.png)

## 关于

基于 Web 的 [文件浏览器](https://filebrowser.org/)。
该附加组件基于来自 filebrowser 的 [docker 镜像](https://hub.docker.com/r/filebrowser/filebrowser)。

## 配置

Web 界面可以在 <http://homeassistant:port> 找到，端口是您在附加组件选项中映射到 8080 的端口。
默认用户名: "admin" 和密码: "admin"

网络磁盘挂载到 `/share/storagecifs`。

```yaml
ssl: true/false
certfile: fullchain.pem #ssl 证书
keyfile: privkey.pem #ssl密钥文件
NoAuth: true/false #移除密码。更改时重置数据库。
disable_thumbnails : true/false (设置 disable_thumbnails 为 true 或 false ; 默认值为 true 以提高速度)
localdisks: sda1 #输入要挂载的驱动器的硬件名称，用逗号分隔，或其标签。例: sda1, sdb1, MYNAS...
networkdisks: "//SERVER/SHARE" # 可选，要挂载的 smbv2/3 服务器列表，用逗号分隔
cifsusername: "username" # 可选，smb 用户名，所有 smb 共享相同
cifspassword: "password" # 可选，smb 密码，所有 smb 共享相同
base_folder: root folder # 可选，默认值为 /
```

## 安装

安装此附加组件非常简单，与安装任何其他 Hass.io 附加组件没有不同。

1. [将我的 Hass.io 附加组件仓库][repository] 添加到您的 Hass.io 实例中。 [![在我的 Home Assistant 中添加仓库][repository-badge]][repository-url]
1. 安装此附加组件。
1. 点击 `保存` 按钮以存储您的配置。
1. 启动附加组件。
1. 检查附加组件的日志以查看一切是否正常。
1. 仔细配置附加组件以符合您的偏好，查看 [官方文档](https://filebrowser.org/configuration) 获取相关信息。

## 支持

在 GitHub 上创建一个问题，或者在 [Home Assistant 讨论区](https://community.home-assistant.io/t/home-assistant-addon-filebrowser/282108/3) 提问。

[repository]: https://github.com/alexbelgium/hassio-addons
[repository-badge]: https://img.shields.io/badge/Add%20repository%20to%20my-Home%20Assistant-41BDF5?logo=home-assistant&style=for-the-badge
[repository-url]: https://my.home-assistant.io/redirect/supervisor_add_addon_repository/?repository_url=https%3A%2F%2Fgithub.com%2Falexbelgium%2Fhassio-addons
[aarch64-shield]: https://img.shields.io/badge/aarch64-yes-green.svg
[amd64-shield]: https://img.shields.io/badge/amd64-yes-green.svg
[armv7-shield]: https://img.shields.io/badge/armv7-yes-green.svg