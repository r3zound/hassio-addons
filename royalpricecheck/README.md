# 家庭助理插件：皇家价格检查

## 描述
如果皇家加勒比邮轮的附加服务价格降低，将发送通知。可以重新定价邮轮、饮料套餐、互联网、 excursions等。

_感谢所有为我的代码库添加星标的朋友们！要为其添加星标，请点击下方的图片，然后在右上角即可看到。谢谢！_

[![Stargazers repo roster for @jdeath/homeassistant-addons](https://reporoster.com/stars/jdeath/homeassistant-addons)](https://github.com/jdeath/homeassistant-addons/stargazers)

## 安装

此插件的安装相当简单，与安装任何其他Hass.io插件没有什么不同。

1. [将我的Hass.io插件库][repository]添加到您的Hass.io实例中。
1. 安装此插件。
1. 点击“保存”按钮以保存您的配置。
1. 启动插件。它将失败，这没关系。
1. 转到 /addon-configs/2effc9b9_royalpricecheck
1. 编辑 `/addon-configs/2effc9b9_royalpricecheck/config.yaml`（详见下文）
1. 再次运行插件并检查日志。
1. 确认正常工作后，设置自动化，每天运行一次。

## Config.yaml
请参阅 `https://github.com/jdeath/CheckRoyalCaribbeanPrice`

## 自动运行
1. 创建一个自动化脚本，每天运行一次这个插件（在随机时间）

```
alias: 启动皇家价格检查
description: ""
trigger:
  - platform: time
    at: "06:00:00"
condition: []
action:
  - delay: "{{ (range(0, 1)|random|int) }}:{{ (range(1, 59)|random|int) }}:00"
  - service: hassio.addon_start
    data:
      addon: 2effc9b9_royalpricecheck
mode: single
```

# 发送通知
1. 编辑 `/addon-configs/2effc9b9_royalpricecheck/config.yaml`
1. 配置通知的行

对于homeassistant通知，它应该像这样：
```
# config.yaml
apprise:
  urls:
    - 'hassio://192.168.X.XX/eyXXXXXXXXXXXXXXXX.eyXXXXXXXXXXXXXXXXXxx'
```
其中 `eyXXX.eyXXX` 字符串是一个Home Assistant长期访问令牌。可以通过用户Home Assistant配置文件页面底部的“长期访问令牌”部分来创建长期访问令牌。

更多详细信息请查看：`https://github.com/caronc/apprise/wiki/Notify_homeassistant`

更多详细信息请查看：`https://github.com/caronc/apprise` 您可以包含多个URL行来发送电子邮件等。
# 添加到侧边栏
由于没有WebUI，这无法在侧边栏中显示。但您可以将以下代码添加到您的Home Assistant的 `configuration.yaml` 中，以在侧边栏条目中显示日志。

```
panel_custom:
  - name: panel_rewards
    sidebar_title: 奖励
    sidebar_icon: mdi:medal
    url_path: 'hassio/addon/2effc9b9_royalpricecheck/logs'
    module_url: /api/hassio/app/entrypoint.js
    embed_iframe: true
    require_admin: true
```

# 问题

[repository]: https://github.com/jdeath/homeassistant-addons