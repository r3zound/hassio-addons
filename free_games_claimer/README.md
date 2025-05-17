## &#9888; VNC在多个机器上无法工作。请使用config.env执行脚本

# 家庭助手插件：免费游戏领取器

[![捐赠][donation-badge]](https://www.buymeacoffee.com/alexbelgium)
[![捐赠][paypal-badge]](https://www.paypal.com/donate/?hosted_button_id=DZFULJZTP3UQA)

![版本](https://img.shields.io/badge/dynamic/json?label=Version&query=%24.version&url=https%3A%2F%2Fraw.githubusercontent.com%2Falexbelgium%2Fhassio-addons%2Fmaster%2Ffree_games_claimer%2Fconfig.json)
![入口](https://img.shields.io/badge/dynamic/json?label=Ingress&query=%24.ingress&url=https%3A%2F%2Fraw.githubusercontent.com%2Falexbelgium%2Fhassio-addons%2Fmaster%2Ffree_games_claimer%2Fconfig.json)
![架构](https://img.shields.io/badge/dynamic/json?color=success&label=Arch&query=%24.arch&url=https%3A%2F%2Fraw.githubusercontent.com%2Falexbelgium%2Fhassio-addons%2Fmaster%2Ffree_games_claimer%2Fconfig.json)

[![Codacy徽章](https://app.codacy.com/project/badge/Grade/9c6cf10bdbba45ecb202d7f579b5be0e)](https://www.codacy.com/gh/alexbelgium/hassio-addons/dashboard?utm_source=github.com&utm_medium=referral&utm_content=alexbelgium/hassio-addons&utm_campaign=Badge_Grade)
[![GitHub Super-Linter](https://img.shields.io/github/actions/workflow/status/alexbelgium/hassio-addons/weekly-supelinter.yaml?label=Lint%20code%20base)](https://github.com/alexbelgium/hassio-addons/actions/workflows/weekly-supelinter.yaml)
[![构建器](https://img.shields.io/github/actions/workflow/status/alexbelgium/hassio-addons/onpush_builder.yaml?label=Builder)](https://github.com/alexbelgium/hassio-addons/actions/workflows/onpush_builder.yaml)

[donation-badge]: https://img.shields.io/badge/Buy%20me%20a%20coffee%20(no%20paypal)-%23d32f2f?logo=buy-me-a-coffee&style=flat&logoColor=white
[paypal-badge]: https://img.shields.io/badge/Buy%20me%20a%20coffee%20with%20Paypal-0070BA?logo=paypal&style=flat&logoColor=white

_感谢所有给我仓库点星的人！如果想给我点星，请点击下面的图片，然后会在右上角显示。谢谢！_

[![星际观察者仓库](https://raw.githubusercontent.com/alexbelgium/hassio-addons/master/.github/stars2.svg)](https://github.com/alexbelgium/hassio-addons/stargazers)

![下载演变](https://raw.githubusercontent.com/alexbelgium/hassio-addons/master/free_games_claimer/stats.png)

## 关于

[免费游戏领取器](https://github.com/vogler/free-games-claimer) : 定期在以下平台领取免费游戏

- Epic Games Store
- Amazon Prime Gaming
- GOG
- Live Games with Gold - 计划中

这个插件基于docker映像 https://github.com/vogler/free-games-claimer

## 配置

Webui可以在 <http://homeassistant:PORT> 找到。

没有插件选项。所有配置必须根据这里的文档手动添加到/config/addons_config/free_games_claimer/config.env（https://github.com/vogler/free-games-claimer#configuration--options）

如果该文件不存在，它将在第一次启动时创建。

## 安装

安装这个插件非常简单，与安装其他插件没有区别。

1. 将我的插件仓库添加到您的家庭助手实例（在监督者插件商店右上角，或如果您已配置我的HA，则点击下面的按钮）
   [![打开您的Home Assistant实例并显示添加插件仓库对话框，预填特定的仓库URL。](https://my.home-assistant.io/badges/supervisor_add_addon_repository.svg)](https://my.home-assistant.io/redirect/supervisor_add_addon_repository/?repository_url=https%3A%2F%2Fgithub.com%2Falexbelgium%2Fhassio-addons)
2. 安装此插件。
3. 点击 `保存` 按钮以存储您的配置。
4. 根据您的喜好设置插件选项。
5. 启动插件。
6. 检查插件的日志以查看一切是否顺利。
7. 打开WebUI并调整软件选项。

## 支持

在GitHub上创建一个问题

[仓库]: https://github.com/alexbelgium/hassio-addons