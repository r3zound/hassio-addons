# Home Assistant 插件：Epic Games 免费

[![Donate][donation-badge]](https://www.buymeacoffee.com/alexbelgium)
[![Donate][paypal-badge]](https://www.paypal.com/donate/?hosted_button_id=DZFULJZTP3UQA)

![版本](https://img.shields.io/badge/dynamic/json?label=Version&query=%24.version&url=https%3A%2F%2Fraw.githubusercontent.com%2Falexbelgium%2Fhassio-addons%2Fmaster%2Fepicgamesfree%2Fconfig.json)
![Ingress](https://img.shields.io/badge/dynamic/json?label=Ingress&query=%24.ingress&url=https%3A%2F%2Fraw.githubusercontent.com%2Falexbelgium%2Fhassio-addons%2Fmaster%2Fepicgamesfree%2Fconfig.json)
![Arch](https://img.shields.io/badge/dynamic/json?color=success&label=Arch&query=%24.arch&url=https%3A%2F%2Fraw.githubusercontent.com%2Falexbelgium%2Fhassio-addons%2Fmaster%2Fepicgamesfree%2Fconfig.json)

[![Codacy Badge](https://app.codacy.com/project/badge/Grade/9c6cf10bdbba45ecb202d7f579b5be0e)](https://www.codacy.com/gh/alexbelgium/hassio-addons/dashboard?utm_source=github.com&utm_medium=referral&utm_content=alexbelgium/hassio-addons&utm_campaign=Badge_Grade)
[![GitHub Super-Linter](https://img.shields.io/github/actions/workflow/status/alexbelgium/hassio-addons/weekly-supelinter.yaml?label=Lint%20code%20base)](https://github.com/alexbelgium/hassio-addons/actions/workflows/weekly-supelinter.yaml)
[![Builder](https://img.shields.io/github/actions/workflow/status/alexbelgium/hassio-addons/onpush_builder.yaml?label=Builder)](https://github.com/alexbelgium/hassio-addons/actions/workflows/onpush_builder.yaml)

[donation-badge]: https://img.shields.io/badge/Buy%20me%20a%20coffee%20(no%20paypal)-%23d32f2f?logo=buy-me-a-coffee&style=flat&logoColor=white
[paypal-badge]: https://img.shields.io/badge/Buy%20me%20a%20coffee%20with%20Paypal-0070BA?logo=paypal&style=flat&logoColor=white

_感谢所有关注我的仓库的人！要关注它，请点击下面的图像，然后它将出现在右上角。谢谢！_

[![Stargazers repo roster for @alexbelgium/hassio-addons](https://raw.githubusercontent.com/alexbelgium/hassio-addons/master/.github/stars2.svg)](https://github.com/alexbelgium/hassio-addons/stargazers)

![下载情况演变](https://raw.githubusercontent.com/alexbelgium/hassio-addons/master/epicgamesfree/stats.png)

## 关于

[Epic Games Store 每周免费游戏](https://github.com/claabs/epicgames-freegames-node)：自动登录并从 Epic Games Store 兑换促销免费游戏。处理多个账户、两步验证、验证码绕过、验证码通知和定时运行。
此插件基于 docker 镜像 https://hub.docker.com/r/charlocharlie/epicgames-freegames

## 配置

Webui 可以在 <http://homeassistant:PORT> 找到。

没有插件选项。所有配置文件以 json 格式（config 和 cookies）必须根据此处的文档手动添加到 /config/addons_config/epicgamesfree/（https://github.com/claabs/epicgames-freegames-node#json-configuration）和 cookies（https://github.com/claabs/epicgames-freegames-node#cookie-import）

如果该文件不存在，将在首次启动时创建。

最后发布的更新日志提到，由于 Epic 对自动化检测的改进，现在无法进行自动兑换。兑换链接会发送到您首选的通知方式，而不是自动化（感谢 @Shiroe93）

## 安装

此插件的安装非常简单，与安装其他插件没有区别。

1. 将我的插件库添加到您的 Home Assistant 实例中（在主管插件商店的右上角，或如果您已配置我的 HA，请点击下面按钮）
   [![打开您的 Home Assistant 实例并显示添加插件库对话框，特定库 URL 预填充。](https://my.home-assistant.io/badges/supervisor_add_addon_repository.svg)](https://my.home-assistant.io/redirect/supervisor_add_addon_repository/?repository_url=https%3A%2F%2Fgithub.com%2Falexbelgium%2Fhassio-addons)
2. 安装此插件。
3. 单击 `保存` 按钮以存储您的配置。
4. 设置插件选项为您的偏好
5. 启动插件。
6. 检查插件的日志以查看是否一切正常。
7. 打开 webUI 并调整软件选项。

## 支持

### 超时错误

请尝试将 `"browserNavigationTimeout": 300000,` 添加到您的 config.json 中（https://github.com/alexbelgium/hassio-addons/issues/675#issuecomment-1407675351）

### 其他错误

在 GitHub 上创建一个问题

[repository]: https://github.com/alexbelgium/hassio-addons