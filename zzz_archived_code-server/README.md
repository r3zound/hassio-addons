# Home Assistant 插件: code-server

# ⚠️ 建议使用官方插件 (https://github.com/hassio-addons/addon-vscode)，而不是这个分支。这个分支唯一的好处是自动发布，现在在官方插件中已实现。⚠️

[![捐赠][donation-badge]](https://www.buymeacoffee.com/alexbelgium)
[![捐赠][paypal-badge]](https://www.paypal.com/donate/?hosted_button_id=DZFULJZTP3UQA)

![版本](https://img.shields.io/badge/dynamic/json?label=Version&query=%24.version&url=https%3A%2F%2Fraw.githubusercontent.com%2Falexbelgium%2Fhassio-addons%2Fmaster%2Fcode-server%2Fconfig.json)
![入口](https://img.shields.io/badge/dynamic/json?label=Ingress&query=%24.ingress&url=https%3A%2F%2Fraw.githubusercontent.com%2Falexbelgium%2Fhassio-addons%2Fmaster%2Fcode-server%2Fconfig.json)
![架构](https://img.shields.io/badge/dynamic/json?color=success&label=Arch&query=%24.arch&url=https%3A%2F%2Fraw.githubusercontent.com%2Falexbelgium%2Fhassio-addons%2Fmaster%2Fcode-server%2Fconfig.json)

[![Codacy 等级徽章](https://app.codacy.com/project/badge/Grade/9c6cf10bdbba45ecb202d7f579b5be0e)](https://www.codacy.com/gh/alexbelgium/hassio-addons/dashboard?utm_source=github.com&utm_medium=referral&utm_content=alexbelgium/hassio-addons&utm_campaign=Badge_Grade)
[![GitHub 超级代码检查工具](https://img.shields.io/github/actions/workflow/status/alexbelgium/hassio-addons/weekly-supelinter.yaml?label=Lint%20code%20base)](https://github.com/alexbelgium/hassio-addons/actions/workflows/weekly-supelinter.yaml)
[![构建器](https://img.shields.io/github/actions/workflow/status/alexbelgium/hassio-addons/onpush_builder.yaml?label=Builder)](https://github.com/alexbelgium/hassio-addons/actions/workflows/onpush_builder.yaml)

[donation-badge]: https://img.shields.io/badge/Buy%20me%20a%20coffee%20(no%20paypal)-%23d32f2f?logo=buy-me-a-coffee&style=flat&logoColor=white
[paypal-badge]: https://img.shields.io/badge/Buy%20me%20a%20coffee%20with%20Paypal-0070BA?logo=paypal&style=flat&logoColor=white

_感谢大家对我的仓库的点赞！要给它点赞，请点击下面的图片，然后它会在右上角。谢谢！_

[![@alexbelgium/hassio-addons 的星标用户](https://raw.githubusercontent.com/alexbelgium/hassio-addons/master/.github/stars2.svg)](https://github.com/alexbelgium/hassio-addons/stargazers)

![下载演变](https://raw.githubusercontent.com/alexbelgium/hassio-addons/master/code-server/stats.png)

## 关于

Code-server 是在远程服务器上运行的 VS Code，可以通过浏览器访问。

该插件基于来自 linuxserver.io 的 [docker 镜像](https://github.com/linuxserver/code-server)。

## 配置

Webui 可以在 `<your-ip>:8443` 找到。

```yaml
PGID: user
GPID: user
TZ: timezone
localdisks: sda1 # 将要挂载的驱动器的硬件名称以逗号分隔，或其标签。例：sda1，sdb1，MYNAS...
networkdisks: "//SERVER/SHARE" # 可选，待挂载的 smbv2/3 服务器列表，以逗号分隔
cifsusername: "username" # 可选，smb 用户名，所有 smb 共享使用相同用户名
cifspassword: "password" # 可选，smb 密码，所有 smb 共享使用相同密码
```

## 安装

安装此插件非常简单，与安装其他 Hass.io 插件没有区别。

1. [将我的 Hass.io 插件仓库][repository] 添加到你的 Hass.io 实例。
2. 安装此插件。
3. 点击 `保存` 按钮以保存你的配置。
4. 启动插件。
5. 检查插件的日志以查看一切是否正常。
6. 根据你的喜好仔细配置插件，具体请参见官方文档。

[repository]: https://github.com/alexbelgium/hassio-addons