# Home assistant 插件: MS Rewards Farmer

## 描述
自动为 MS Rewards 计划获取积分，并为您完成所有任务（玩测验，搜索...）

这是 [**@klept0**](https://github.com/klept0) 的 MS-Rewards-Farmer 分支的 Docker 版本（最初由 [**@charlesbel**](https://github.com/charlesbel) 编写）。它在 Docker 环境中完全无头运行，使用 Google Chrome 和 Xvfb 作为虚拟显示。

Docker 实现利用了 LtCMDstone Docker 镜像的工作: https://github.com/LtCMDstone/MS-Rewards-Farmer-Docker

此 homeassistant 版本在安装/重建插件时将更新 Chrome。这将保持 Chrome 的最新状态。我可能做错了什么，但插件似乎可以正常工作。如果您有更好的构建插件的方法，请提个 PR。

_感谢所有给我的库加星的人！要加星，请点击下面的图片，然后它将在右上角。谢谢！_

[![Stargazers repo roster for @jdeath/homeassistant-addons](https://reporoster.com/stars/jdeath/homeassistant-addons)](https://github.com/jdeath/homeassistant-addons/stargazers)

## 安装

此插件的安装相当简单，与安装任何其他 Hass.io 插件没有区别。

1. [将我的 Hass.io 插件库][repository] 添加到您的 Hass.io 实例。
1. 安装此插件。
1. 点击 `保存` 按钮以存储您的配置。
1. 如果不是 `US`（美国）和 `en`（英语），请设置您的 GEO 和 LANG。
1. 启动插件。它将失败，这是正常的。
1. 转到 /addon-configs/2effc9b9_msrewardsfarmer。
1. 用您的用户名和密码编辑 accounts.json。删除第二个条目。
1. （可选）编辑 `/addon-configs/2effc9b9_msrewardsfarmer/config.yaml` 以发送通知（见下文）。
1. 再次运行插件并检查日志。
1. 确认工作后，使用自动化每天运行一次。

## GEO 和 Lang
这必须正确设置，因为 MS 可能仅允许您每日从一个国家获得积分，从而有效禁用此农田或您获取积分的标准方式。

1. 转到 https://trends.google.com/trends/
1. 更改您的国家/地区。URL 应该以 =XX 结尾，其中 XX 是要使用的 GEO 代码。必须大写。
1. 语言默认为英语（en）。如果需要，请使用适当的代码更改语言。

## 自动运行
1. 创建一个自动化以每天运行一次此插件（在随机时间以避免封禁）。

```
alias: 启动 MS Rewards Farmer
description: ""
trigger:
  - platform: time
    at: "05:00:00"
condition: []
action:
  - delay: "{{ (range(0, 1)|random|int) }}:{{ (range(1, 59)|random|int) }}:00"
  - service: hassio.addon_start
    data:
      addon: 2effc9b9_msrewardsfarmer
mode: single
```

# 发送通知
1. 编辑 `/addon-configs/2effc9b9_msrewardsfarmer/config.yaml`
1. 配置通知的行。

它应该看起来像这样以适应 homeassistant 通知：
```
# config.yaml
apprise:
  summary: ALWAYS
  urls:
    - 'hassio://192.168.X.XX/eyXXXXXXXXXXXXXXXX.eyXXXXXXXXXXXXXXXXXxx'  # 替换为您实际的 Apprise 服务 URL
attempts:
retries:
  base_delay_in_seconds: 14 # base_delay_in_seconds * 2^max = 14.0625 * 2^6 = 900 = 15 分钟
  max: 7
  strategy: EXPONENTIAL
```
其中 `eyXXX.eyXXX` 字符串是 Home Assistant 的长期访问令牌。长期访问令牌可以在用户的 Home Assistant 配置文件页面底部的“长期访问令牌”部分中创建。

更多细节请访问: `https://github.com/caronc/apprise/wiki/Notify_homeassistant`

# 添加到侧边栏
由于没有 WebUI，因此无法在侧边栏中显示。但您可以将以下代码添加到您的 Home Assistant `configuration.yaml` 中，以通过侧边栏条目显示日志。

```
panel_custom:
  - name: panel_rewards
    sidebar_title: 奖励
    sidebar_icon: mdi:medal
    url_path: 'hassio/addon/2effc9b9_msrewardsfarmer/logs'
    module_url: /api/hassio/app/entrypoint.js
    embed_iframe: true
    require_admin: true
```

# 问题

如果您遇到问题，请先问自己 - 在再次运行之前，我是否确保更新了所有文件并清除了会话文件夹？

仍在进行中，有时农田会崩溃或运行缓慢，因为无头 Chrome 可能会出现故障。当崩溃时再次运行即可。发送到 Home Assistant 的通知使其更易于查看。

[repository]: https://github.com/jdeath/homeassistant-addons