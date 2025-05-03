# 家庭助手插件：Lidarr

[![捐赠][donation-badge]](https://www.buymeacoffee.com/alexbelgium)
[![捐赠][paypal-badge]](https://www.paypal.com/donate/?hosted_button_id=DZFULJZTP3UQA)

![版本](https://img.shields.io/badge/dynamic/json?label=%E7%89%88%E6%9C%AC&query=%24.version&url=https%3A%2F%2Fraw.githubusercontent.com%2Falexbelgium%2Fhassio-addons%2Fmaster%2Flidarr%2Fconfig.json)
![入口](https://img.shields.io/badge/dynamic/json?label=%E5%85%A5%E5%8F%A3&query=%24.ingress&url=https%3A%2F%2Fraw.githubusercontent.com%2Falexbelgium%2Fhassio-addons%2Fmaster%2Flidarr%2Fconfig.json)
![架构](https://img.shields.io/badge/dynamic/json?color=success&label=%E6%9E%B6%E6%9E%84&query=%24.arch&url=https%3A%2F%2Fraw.githubusercontent.com%2Falexbelgium%2Fhassio-addons%2Fmaster%2Flidarr%2Fconfig.json)

[![Codacy 徽章](https://app.codacy.com/project/badge/Grade/9c6cf10bdbba45ecb202d7f579b5be0e)](https://www.codacy.com/gh/alexbelgium/hassio-addons/dashboard?utm_source=github.com&utm_medium=referral&utm_content=alexbelgium/hassio-addons&utm_campaign=Badge_Grade)
[![GitHub Super-Linter](https://img.shields.io/github/actions/workflow/status/alexbelgium/hassio-addons/weekly-supelinter.yaml?label=%E6%96%87%E4%BB%B6%E6%A6%82%E7%8A%B6)](https://github.com/alexbelgium/hassio-addons/actions/workflows/weekly-supelinter.yaml)
[![构建者](https://img.shields.io/github/actions/workflow/status/alexbelgium/hassio-addons/onpush_builder.yaml?label=%E6%9E%84%E5%BB%BA%E8%80%85)](https://github.com/alexbelgium/hassio-addons/actions/workflows/onpush_builder.yaml)

[donation-badge]: https://img.shields.io/badge/%E8%B4%9D%E9%9B%85%E4%BF%AE%E6%94%B6%E5%AE%9A%EF%BC%88%E6%9C%AA%E5%BE%97paypal%EF%BC%89-%23d32f2f?logo=buy-me-a-coffee&style=flat&logoColor=white
[paypal-badge]: https://img.shields.io/badge/%E8%B4%9D%E9%9B%85%E4%BF%AE%E6%94%B6%E5%AE%9A%E4%BD%86%E7%94%A8PayPal-0070BA?logo=paypal&style=flat&logoColor=white

_感谢所有给我的仓库加星的人！要加星，请点击下方的图片，然后它会出现在右上角。谢谢！_

[![@alexbelgium/hassio-addons 的明星用户列表](https://raw.githubusercontent.com/alexbelgium/hassio-addons/master/.github/stars2.svg)](https://github.com/alexbelgium/hassio-addons/stargazers)

![下载演变](https://raw.githubusercontent.com/alexbelgium/hassio-addons/master/lidarr/stats.png)

## 关于

---

[Lidarr](https://lidarr.audio/) 是一个用于 Usenet 和 BitTorrent 用户的音乐收藏管理器。它可以监控多个 RSS 源，以获取您喜爱艺术家的新专辑，并与客户端和索引器进行交互，以抓取、排序和重命名这些专辑。它还可以配置为在库中存在更高质量格式时，自动升级现有文件的质量。
该插件基于Docker镜像 https://github.com/linuxserver/docker-lidarr

## 安装

---

这个插件的安装非常简单，和安装其他插件没有区别。

1. 将我的插件库添加到您的家庭助手实例中（在监督器插件商店右上角，或如果您已配置我的HA，请点击下方按钮）
   [![打开您的 Home Assistant 实例并显示添加插件库对话框，特定库 URL 预填。](https://my.home-assistant.io/badges/supervisor_add_addon_repository.svg)](https://my.home-assistant.io/redirect/supervisor_add_addon_repository/?repository_url=https%3A%2F%2Fgithub.com%2Falexbelgium%2Fhassio-addons)
2. 安装此插件。
3. 点击 `保存` 按钮以存储您的配置。
4. 根据您的偏好设置插件选项。
5. 启动插件。
6. 检查插件的日志以查看一切是否顺利。
7. 打开 WebUI 并调整软件选项。

## 配置

---

Webui 可以在 <http://homeassistant:PORT> 找到。
默认用户名/密码：在启动日志中描述。
通过应用的 WebUI 可以进行配置，除以下选项外：

```yaml
PGID: user
GPID: user
TZ: timezone
localdisks: sda1 # 填写您要挂载的驱动器的硬件名称，用逗号分隔，或其标签。例如：sda1, sdb1, MYNAS...
networkdisks: "//SERVER/SHARE" # 可选，挂载的 smb 服务器列表，用逗号分隔
cifsusername: "username" # 可选，smb 用户名，所有 smb 共享相同
cifspassword: "password" # 可选，smb 密码
```

## 支持

在 GitHub 上创建一个问题

## 说明

---

![说明](https://www.geekzone.fr/wp-content/uploads/2018/05/lidarr_1.png)

[仓库]: https://github.com/alexbelgium/hassio-addons