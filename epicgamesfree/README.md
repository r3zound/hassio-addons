# Home assistant 插件：Epic Games 免费

[![捐款][donation-badge]](https://www.buymeacoffee.com/alexbelgium)
[![捐款][paypal-badge]](https://www.paypal.com/donate/?hosted_button_id=DZFULJZTP3UQA)

![版本](https://img.shields.io/badge/dynamic/json?label=Version&query=%24.version&url=https%3A%2F%2Fraw.githubusercontent.com%2Falexbelgium%2Fhassio-addons%2Fmaster%2Fepicgamesfree%2Fconfig.json)
![请求](https://img.shields.io/badge/dynamic/json?label=Ingress&query=%24.ingress&url=https%3A%2F%2Fraw.githubusercontent.com%2Falexbelgium%2Fhassio-addons%2Fmaster%2Fepicgamesfree%2Fconfig.json)
![架构](https://img.shields.io/badge/dynamic/json?color=success&label=Arch&query=%24.arch&url=https%3A%2F%2Fraw.githubusercontent.com%2Falexbelgium%2Fhassio-addons%2Fmaster%2Fepicgamesfree%2Fconfig.json)

[![Codacy 勋章](https://app.codacy.com/project/badge/Grade/9c6cf10bdbba45ecb202d7f579b5be0e)](https://www.codacy.com/gh/alexbelgium/hassio-addons/dashboard?utm_source=github.com&utm_medium=referral&utm_content=alexbelgium/hassio-addons&utm_campaign=Badge_Grade)
[![GitHub 超级Lint检查器](https://img.shields.io/github/actions/workflow/status/alexbelgium/hassio-addons/weekly-supelinter.yaml?label=Lint%20code%20base)](https://github.com/alexbelgium/hassio-addons/actions/workflows/weekly-supelinter.yaml)
[![构建器](https://img.shields.io/github/actions/workflow/status/alexbelgium/hassio-addons/onpush_builder.yaml?label=Builder)](https://github.com/alexbelgium/hassio-addons/actions/workflows/onpush_builder.yaml)

[donation-badge]: https://img.shields.io/badge/Buy%20me%20a%20coffee%20(no%20paypal)-%23d32f2f?logo=buy-me-a-coffee&style=flat&logoColor=white
[paypal-badge]: https://img.shields.io/badge/Buy%20me%20a%20coffee%20with%20Paypal-0070BA?logo=paypal&style=flat&logoColor=white

_感谢每一个给我的仓库加星的人！如果想要加星，请点击下面的图片，然后它将出现在右上角。谢谢！_

[![Stargazers repo roster for @alexbelgium/hassio-addons](https://raw.githubusercontent.com/alexbelgium/hassio-addons/master/.github/stars2.svg)](https://github.com/alexbelgium/hassio-addons/stargazers)

![下载演变](https://raw.githubusercontent.com/alexbelgium/hassio-addons/master/epicgamesfree/stats.png)

## 关于

[Epic Games Store 每周免费游戏](https://github.com/claabs/epicgames-freegames-node) : 自动登录并领取Epic Games Store的促销免费游戏。支持多个账户、二次验证、验证码绕过、验证码通知和定时运行。
该插件基于docker镜像 https://hub.docker.com/r/charlocharlie/epicgames-freegames

## 配置

Web界面可以在 <http://homeassistant:PORT> 找到。

没有插件选项。所有配置文件（配置和cookie）必须按照此处的文档（https://github.com/claabs/epicgames-freegames-node#json-configuration 和 https://github.com/claabs/epicgames-freegames-node#cookie-import）手动添加到/config/addons_config/epicgamesfree/中。

如果该文件不存在，首次启动时将创建该文件。

最后的版本更新日志提到，由于Epic提高了自动化检测，自动领取不再可能。领取链接将发送到您首选的通知方式，而不是自动化处理（感谢@Shiroe93）。

## 安装

该插件的安装非常简单，与安装任何其他插件没有区别。

1. 将我的插件库添加到您的home assistant实例中（在超级用户插件商店右上角，或者如果您已配置我的HA，则单击下面的按钮）
   [![打开您的Home Assistant实例，并显示带有特定仓库URL预填充的添加插件库对话框。](https://my.home-assistant.io/badges/supervisor_add_addon_repository.svg)](https://my.home-assistant.io/redirect/supervisor_add_addon_repository/?repository_url=https%3A%2F%2Fgithub.com%2Falexbelgium%2Fhassio-addons)
2. 安装该插件。
3. 单击 `保存` 按钮以存储您的配置。
4. 根据您的偏好设置插件选项。
5. 启动插件。
6. 检查插件的日志以查看是否一切正常。
7. 打开webUI并调整软件选项。

## 支持

### 超时错误

请尝试在您的config.json中添加 `"browserNavigationTimeout": 300000,` （https://github.com/alexbelgium/hassio-addons/issues/675#issuecomment-1407675351）。

### 其他错误

在GitHub上创建一个问题。

[仓库]: https://github.com/alexbelgium/hassio-addons