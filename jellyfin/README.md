## &#9888; 开放问题 : [🐛 [Jellyfin] 最近更改后无法找到元数据 (打开于2025-02-24)](https://github.com/alexbelgium/hassio-addons/issues/1787) by [@ve6rah](https://github.com/ve6rah)
# Home Assistant 插件: Jellyfin

[![捐赠][donation-badge]](https://www.buymeacoffee.com/alexbelgium)
[![捐赠][paypal-badge]](https://www.paypal.com/donate/?hosted_button_id=DZFULJZTP3UQA)

![版本](https://img.shields.io/badge/dynamic/json?label=Version&query=%24.version&url=https%3A%2F%2Fraw.githubusercontent.com%2Falexbelgium%2Fhassio-addons%2Fmaster%2Fjellyfin%2Fconfig.json)
![入口](https://img.shields.io/badge/dynamic/json?label=Ingress&query=%24.ingress&url=https%3A%2F%2Fraw.githubusercontent.com%2Falexbelgium%2Fhassio-addons%2Fmaster%2Fjellyfin%2Fconfig.json)
![架构](https://img.shields.io/badge/dynamic/json?color=success&label=Arch&query=%24.arch&url=https%3A%2F%2Fraw.githubusercontent.com%2Falexbelgium%2Fhassio-addons%2Fmaster%2Fjellyfin%2Fconfig.json)

[![Codacy Badge](https://app.codacy.com/project/badge/Grade/9c6cf10bdbba45ecb202d7f579b5be0e)](https://www.codacy.com/gh/alexbelgium/hassio-addons/dashboard?utm_source=github.com&utm_medium=referral&utm_content=alexbelgium/hassio-addons&utm_campaign=Badge_Grade)
[![GitHub Super-Linter](https://img.shields.io/github/actions/workflow/status/alexbelgium/hassio-addons/weekly-supelinter.yaml?label=Lint%20code%20base)](https://github.com/alexbelgium/hassio-addons/actions/workflows/weekly-supelinter.yaml)
[![构建器](https://img.shields.io/github/actions/workflow/status/alexbelgium/hassio-addons/onpush_builder.yaml?label=Builder)](https://github.com/alexbelgium/hassio-addons/actions/workflows/onpush_builder.yaml)

[donation-badge]: https://img.shields.io/badge/Buy%20me%20a%20coffee%20(no%20paypal)-%23d32f2f?logo=buy-me-a-coffee&style=flat&logoColor=white
[paypal-badge]: https://img.shields.io/badge/Buy%20me%20a%20coffee%20with%20Paypal-0070BA?logo=paypal&style=flat&logoColor=white

_感谢每一个关注我代码库的人！要关注，请点击下面的图片，然后它将出现在右上角。谢谢！_

[![关注者仓库名单 @alexbelgium/hassio-addons](https://raw.githubusercontent.com/alexbelgium/hassio-addons/master/.github/stars2.svg)](https://github.com/alexbelgium/hassio-addons/stargazers)

![下载演变](https://raw.githubusercontent.com/alexbelgium/hassio-addons/master/jellyfin/stats.png)

## 关于

[jellyfin](https://jellyfin.org/) 组织个人媒体库中的视频、音乐、直播电视和照片，并将其流式传输到智能电视、流媒体盒和移动设备。这个容器被打包为一个独立的 jellyfin 媒体服务器。

这个插件基于来自 linuxserver.io 的 [docker 镜像](https://github.com/linuxserver/docker-jellyfin)。

## 配置

### 插件配置

Webui 可在 `<your-ip>:8096` 找到。

```yaml
PGID: user
GPID: user
TZ: timezone
localdisks: sda1 # 将要挂载的驱动器的硬件名称以逗号分隔，或其标签。例：sda1, sdb1, MYNAS...
networkdisks: "//SERVER/SHARE" # 可选，要挂载的 smb 服务器列表，以逗号分隔
cifsusername: "username" # 可选，smb 用户名，所有 smb 共享相同
cifspassword: "password" # 可选，smb 密码
cifsdomain: "domain" # 可选，允许设置 smb 共享的域
DOCKER_MODS: linuxserver/mods:jellyfin-opencl-intel|linuxserver/mods:jellyfin-amd|linuxserver/mods:jellyfin-rffmpeg # 安装图形驱动程序
```

### 启用 SSL
#### 首先创建 PFX 证书文件
1. 这部分假设你已经使用 Let's Encrypt 插件拥有 PEM 格式的 SSL 证书。
2. 运行以下命令 `openssl pkcs12 -export -in fullchain.pem -inkey private_key.pem -passout pass: -out server.pfx`
3. 使用 `chmod 0700 server.pfx` 设置权限
> 注意:
> 上述命令创建一个没有密码的 PFX 文件，你可以用 `-passout pass:"your-password"` 填入一个密码
> 但也必须在 Jellyfin 的配置中提供 `your-password`

#### 自动化 PFX 证书

#### Jellyfin 配置
1. 从侧边栏点击 `Administration` -> `Dashboard`
2. 在 `Networking` 下，`Server Address Settings`，勾选 `Enable HTTPS`
3. 在 `HTTPS Settings` 下，勾选 `Require HTTPS`
4. 对于 `Custom SSL certificate path:`，指向你的 PFX 文件，并填写 `Certificate password` 如果需要的话
5. 滚动到底部并 `Save`

## 安装

安装此插件相当简单，与安装其他 Hass.io 插件没有区别。

1. [将我的 Hass.io 插件库][repository] 添加到你的 Hass.io 实例。
1. 安装此插件。
1. 点击 `Save` 按钮以存储你的配置。
1. 启动插件。
1. 检查插件的日志以查看是否一切顺利。
1. 仔细配置插件以符合你的喜好，具体见官方文档。

[repository]: https://github.com/alexbelgium/hassio-addons