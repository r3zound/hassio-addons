# Home Assistant 插件：皇家价格检查

## 描述
如果皇家加勒比邮轮附加服务价格下降，则会通知。不会对邮轮价格进行定价，只对饮料套餐、互联网、游览等进行定价。

_感谢所有给我的仓库点星的人！要给它点星，请点击下面的图片，然后它会出现在右上角。谢谢！_

[![Stargazers repo roster for @jdeath/homeassistant-addons](https://reporoster.com/stars/jdeath/homeassistant-addons)](https://github.com/jdeath/homeassistant-addons/stargazers)


## 安装

这个插件的安装非常简单，与安装任何其他 Hass.io 插件没有不同。

1. [将我的 Hass.io 插件仓库][repository]添加到你的 Hass.io 实例中。
1. 安装这个插件。
1. 点击 `保存` 按钮以保存你的配置。
1. 启动插件。它会失败，这没关系。
1. 转到 /addon-configs/2effc9b9_royalpricecheck
1. 编辑 `/addon-configs/2effc9b9_royalpricecheck/config.yaml`（见下文）。
1. 再次运行插件并检查日志。
1. 确认工作后，使用自动化一天运行一次。

## Config.yaml
请参见 `https://github.com/jdeath/CheckRoyalCaribbeanPrice`

## 自动运行
1. 创建一个自动化来每天（在随机时间）运行一次此插件。

```
alias: 开始皇家价格检查
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

# 发送通知。
1. 编辑 `/addon-configs/2effc9b9_royalpricecheck/config.yaml`
1. 配置通知的行。

对于 Home Assistant 通知，它应该看起来像这样：
```
# config.yaml
apprise:
  urls:
    - 'hassio://192.168.X.XX/eyXXXXXXXXXXXXXXXX.eyXXXXXXXXXXXXXXXXXxx'
```
其中 `eyXXX.eyXXX` 字符串是 Home Assistant 的长期访问令牌。长期访问令牌可以在用户 Home Assistant 个人资料页面底部的“长期访问令牌”部分创建。

更多详细信息请查看这里：`https://github.com/caronc/apprise/wiki/Notify_homeassistant`

更多详细信息请查看这里：`https://github.com/caronc/apprise` 你可以添加多条 URL 行来发送电子邮件等。
# 添加到侧边栏
由于没有 WebUI，因此无法在侧边栏中显示。但是，您可以将以下代码添加到您的 Home Assistant `configuration.yaml`中，以通过侧边栏条目显示日志。

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