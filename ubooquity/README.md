# 家庭助手附加组件：Ubooquity

[![捐赠][donation-badge]](https://www.buymeacoffee.com/alexbelgium)
[![捐赠][paypal-badge]](https://www.paypal.com/donate/?hosted_button_id=DZFULJZTP3UQA)

![版本](https://img.shields.io/badge/dynamic/json?label=Version&query=%24.version&url=https%3A%2F%2Fraw.githubusercontent.com%2Falexbelgium%2Fhassio-addons%2Fmaster%2Fubooquity%2Fconfig.json)
![入口](https://img.shields.io/badge/dynamic/json?label=Ingress&query=%24.ingress&url=https%3A%2F%2Fraw.githubusercontent.com%2Falexbelgium%2Fhassio-addons%2Fmaster%2Fubooquity%2Fconfig.json)
![架构](https://img.shields.io/badge/dynamic/json?color=success&label=Arch&query=%24.arch&url=https%3A%2F%2Fraw.githubusercontent.com%2Falexbelgium%2Fhassio-addons%2Fmaster%2Fubooquity%2Fconfig.json)

[![Codacy徽章](https://app.codacy.com/project/badge/Grade/9c6cf10bdbba45ecb202d7f579b5be0e)](https://www.codacy.com/gh/alexbelgium/hassio-addons/dashboard?utm_source=github.com&utm_medium=referral&utm_content=alexbelgium/hassio-addons&utm_campaign=Badge_Grade)
[![GitHub Super-Linter](https://img.shields.io/github/actions/workflow/status/alexbelgium/hassio-addons/weekly-supelinter.yaml?label=Lint%20code%20base)](https://github.com/alexbelgium/hassio-addons/actions/workflows/weekly-supelinter.yaml)
[![构建器](https://img.shields.io/github/actions/workflow/status/alexbelgium/hassio-addons/onpush_builder.yaml?label=Builder)](https://github.com/alexbelgium/hassio-addons/actions/workflows/onpush_builder.yaml)

[donation-badge]: https://img.shields.io/badge/Buy%20me%20a%20coffee%20(no%20paypal)-%23d32f2f?logo=buy-me-a-coffee&style=flat&logoColor=white
[paypal-badge]: https://img.shields.io/badge/Buy%20me%20a%20coffee%20with%20Paypal-0070BA?logo=paypal&style=flat&logoColor=white

_感谢所有给我的仓库加星的人！要加星，请点击下面的图片，然后它将显示在右上角。谢谢！_

[![@alexbelgium/hassio-addons的星标名单](https://raw.githubusercontent.com/alexbelgium/hassio-addons/master/.github/stars2.svg)](https://github.com/alexbelgium/hassio-addons/stargazers)

![下载演变](https://raw.githubusercontent.com/alexbelgium/hassio-addons/master/ubooquity/stats.png)

## 关于

---

[Ubooquity by vaemendis](https://vaemendis.net/ubooquity/) 是一个免费的、轻量级的易于使用的家庭服务器，用于管理你的漫画和电子书。该附加组件基于来自 [linuxserver.io](https://www.linuxserver.io/) 的 [docker 镜像](https://github.com/linuxserver/docker-ubooquity)。

Ubooquity 支持多种类型的文件，优先考虑 ePUB、CBZ、CBR 和 PDF 文件。还支持来自库管理软件 Calibre 和 ComicRack 的元数据。Ubooquity 可以让你创建用户帐户并设置每个共享文件夹的访问权限。

该附加组件具有多个可配置选项：

- 允许从附加组件安装本地外部驱动器或 smb 共享（会降低性能）
- **非常重要，可能会导致系统崩溃**：设置 Java 的最大 RAM 使用量。分配给 Ubooquity 的内存量取决于你运行它的硬件。如果这个数量过小，当执行内存密集型操作时，你可能会饱和内存，从而出现 "java.lang.OutOfMemoryError: Java heap space errors"。如果分配的数量对于你的系统来说过高，它将崩溃家庭助手，你需要手动重启。值是以兆字节表示的数字（只需输入一个数字，不带 MB）。

建议从选项中启用 OPDS 服务器，这样你可以通过移动应用连接到你的漫画/电子书服务器（我在 iOS 上使用 [Chunky](https://apps.apple.com/fr/app/chunky-comic-reader/id663567628)（付费），在 Android 上使用 [Kuboo](https://play.google.com/store/apps/details?id=com.sethchhim.kuboo&hl=fr&gl=US)（免费））

## 安装

安装该附加组件非常简单，与安装任何其他 Hass.io 附加组件没有区别。

1. [将我的 Hass.io 附加组件库][repository]添加到你的 Hass.io 实例中。
1. 安装该附加组件。
1. 点击 `保存` 按钮以存储你的配置。
1. 启动附加组件。
1. 检查附加组件的日志以查看是否一切正常。
1. 打开 webUI，设置管理员密码并调整管理选项。

## 配置

---

默认用户名/密码：在启动日志中描述。
配置可以通过应用程序的 webUI 完成，除了以下选项：

网络磁盘挂载到 /mnt/share 名称

```yaml
PGID: user # https://docs.linuxserver.io/general/understanding-puid-and-pgid
GPID: user # https://docs.linuxserver.io/general/understanding-puid-and-pgid
maxmem: 200 # 重要，见上文。200 是 rpi3b+ 的默认值；如果 RAM 超过 2GB，建议设置为 512。
networkdisks: "<//SERVER/SHARE>" # 要挂载的 smbv2/3 服务器列表（可选）
cifsusername: "username" # smb 用户名（可选）
cifspassword: "password" # smb 密码（可选）
smbv1: false # 是否应该使用 smbv1 而不是 2.1+？
```

## 支持

在 [仓库的 GitHub][repository]上创建一个问题，或在 [家庭助手帖子](https://community.home-assistant.io/t/home-assistant-addon-ubooquity/283811)上询问。

## 插图

---

![替代文本](https://vaemendis.net/ubooquity/data/images/screenshots/books_library.jpg)

[repository]: https://github.com/alexbelgium/hassio-addons