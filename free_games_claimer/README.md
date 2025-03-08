## &#9888; VNC在多台机器上无法工作。请使用config.env来执行脚本

# 家庭助手插件：免费游戏领取器

[![Donate][donation-badge]](https://www.buymeacoffee.com/alexbelgium)
[![Donate][paypal-badge]](https://www.paypal.com/donate/?hosted_button_id=DZFULJZTP3UQA)

![版本](https://img.shields.io/badge/dynamic/json?label=Version&query=%24.version&url=https%3A%2F%2Fraw.githubusercontent.com%2Falexbelgium%2Fhassio-addons%2Fmaster%2Ffree_games_claimer%2Fconfig.json)
![Ingress](https://img.shields.io/badge/dynamic/json?label=Ingress&query=%24.ingress&url=https%3A%2F%2Fraw.githubusercontent.com%2Falexbelgium%2Fhassio-addons%2Fmaster%2Ffree_games_claimer%2Fconfig.json)
![架构](https://img.shields.io/badge/dynamic/json?color=success&label=Arch&query=%24.arch&url=https%3A%2F%2Fraw.githubusercontent.com%2Falexbelgium%2Fhassio-addons%2Fmaster%2Ffree_games_claimer%2Fconfig.json)

[![Codacy Badge](https://app.codacy.com/project/badge/Grade/9c6cf10bdbba45ecb202d7f579b5be0e)](https://www.codacy.com/gh/alexbelgium/hassio-addons/dashboard?utm_source=github.com&utm_medium=referral&utm_content=alexbelgium/hassio-addons&utm_campaign=Badge_Grade)
[![GitHub Super-Linter](https://img.shields.io/github/actions/workflow/status/alexbelgium/hassio-addons/weekly-supelinter.yaml?label=Lint%20code%20base)](https://github.com/alexbelgium/hassio-addons/actions/workflows/weekly-supelinter.yaml)
[![构建器](https://img.shields.io/github/actions/workflow/status/alexbelgium/hassio-addons/onpush_builder.yaml?label=Builder)](https://github.com/alexbelgium/hassio-addons/actions/workflows/onpush_builder.yaml)

[donation-badge]: https://img.shields.io/badge/Buy%20me%20a%20coffee%20(no%20paypal)-%23d32f2f?logo=buy-me-a-coffee&style=flat&logoColor=white
[paypal-badge]: https://img.shields.io/badge/Buy%20me%20a%20coffee%20with%20Paypal-0070BA?logo=paypal&style=flat&logoColor=white

_感谢每一个给我的仓库加星的人！要加星请点击下方图片，然后会在右上角出现。谢谢！_

[![Stargazers repo roster for @alexbelgium/hassio-addons](https://raw.githubusercontent.com/alexbelgium/hassio-addons/master/.github/stars2.svg)](https://github.com/alexbelgium/hassio-addons/stargazers)

![下载演变](https://raw.githubusercontent.com/alexbelgium/hassio-addons/master/free_games_claimer/stats.png)

## 关于

[免费游戏领取器](https://github.com/vogler/free-games-claimer): 定期在以下平台领取免费游戏

- Epic Games Store
- Amazon Prime Gaming
- GOG
- Live Games with Gold - 计划中

此插件基于docker镜像 https://github.com/vogler/free-games-claimer

## 配置

Webui可以在 <http://homeassistant:PORT> 找到。

没有插件选项。所有配置必须根据这里的文档手动添加到 /config/addons_config/free_games_claimer/config.env （有关配置文件的文档：https://github.com/vogler/free-games-claimer#configuration--options）

如果该文件不存在，系统会在首次启动时创建它。

## 安装

这个插件的安装非常简单，与安装其他插件没有区别。

1. 将我的插件仓库添加到你的家庭助手实例中（在右上方的监督器插件商店中，或如果你已配置我的HA，请点击下方按钮）
   [![打开你的Home Assistant实例并显示添加插件库对话框，特定仓库URL已预填。](https://my.home-assistant.io/badges/supervisor_add_addon_repository.svg)](https://my.home-assistant.io/redirect/supervisor_add_addon_repository/?repository_url=https%3A%2F%2Fgithub.com%2Falexbelgium%2Fhassio-addons)
2. 安装此插件。
3. 点击“保存”按钮以保存你的配置。
4. 根据你的喜好设置插件选项。
5. 启动插件。
6. 检查插件的日志以查看一切是否正常。
7. 打开webUI并调整软件选项。

## 支持

在github上创建一个问题

[repository]: https://github.com/alexbelgium/hassio-addons