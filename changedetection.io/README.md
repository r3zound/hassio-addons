# 家庭助手附加组件：changedetection.io

[![捐赠][donation-badge]](https://www.buymeacoffee.com/alexbelgium)
[![捐赠][paypal-badge]](https://www.paypal.com/donate/?hosted_button_id=DZFULJZTP3UQA)

![版本](https://img.shields.io/badge/dynamic/json?label=Version&query=%24.version&url=https%3A%2F%2Fraw.githubusercontent.com%2Falexbelgium%2Fhassio-addons%2Fmaster%2Fchangedetection.io%2Fconfig.json)
![入口](https://img.shields.io/badge/dynamic/json?label=Ingress&query=%24.ingress&url=https%3A%2F%2Fraw.githubusercontent.com%2Falexbelgium%2Fhassio-addons%2Fmaster%2Fchangedetection.io%2Fconfig.json)
![架构](https://img.shields.io/badge/dynamic/json?color=success&label=Arch&query=%24.arch&url=https%3A%2F%2Fraw.githubusercontent.com%2Falexbelgium%2Fhassio-addons%2Fmaster%2Fchangedetection.io%2Fconfig.json)

[![Codacy Badge](https://app.codacy.com/project/badge/Grade/9c6cf10bdbba45ecb202d7f579b5be0e)](https://www.codacy.com/gh/alexbelgium/hassio-addons/dashboard?utm_source=github.com&utm_medium=referral&utm_content=alexbelgium/hassio-addons&utm_campaign=Badge_Grade)
[![GitHub Super-Linter](https://img.shields.io/github/actions/workflow/status/alexbelgium/hassio-addons/weekly-supelinter.yaml?label=Lint%20code%20base)](https://github.com/alexbelgium/hassio-addons/actions/workflows/weekly-supelinter.yaml)
[![构建器](https://img.shields.io/github/actions/workflow/status/alexbelgium/hassio-addons/onpush_builder.yaml?label=Builder)](https://github.com/alexbelgium/hassio-addons/actions/workflows/onpush_builder.yaml)

[donation-badge]: https://img.shields.io/badge/Buy%20me%20a%20coffee%20(no%20paypal)-%23d32f2f?logo=buy-me-a-coffee&style=flat&logoColor=white
[paypal-badge]: https://img.shields.io/badge/Buy%20me%20a%20coffee%20with%20Paypal-0070BA?logo=paypal&style=flat&logoColor=white

_感谢每一个给我的仓库点亮星星的人！要点亮星星，请点击下方的图片，然后它将出现在右上角。谢谢！_

[![Stargazers repo roster for @alexbelgium/hassio-addons](https://reporoster.com/stars/alexbelgium/hassio-addons)](https://github.com/alexbelgium/hassio-addons/stargazers)

![下载演变](https://raw.githubusercontent.com/alexbelgium/hassio-addons/master/changedetection.io/stats.png)

## 关于

[Changedetection.io](https://github.com/dgtlmoon/changedetection.io) 提供免费的开源网页监控、通知和变更检测。

此附加组件基于来自 linuxserver.io 的 [docker 镜像](https://github.com/linuxserver/docker-changedetection.io)。

## 配置

### 主应用

Web 界面可以在 `<your-ip>:5000` 找到，也可以从附加组件页面访问。

#### 侧边栏快捷方式

您可以按照以下步骤添加指向您的 Changedetection.io 实例的快捷方式：
1. 转到 <kbd>⚙ 设置</kbd> > <kbd>仪表板</kbd>
2. 点击右下角的 <kbd>➕ 添加仪表板</kbd>
3. 选择 <kbd>网页</kbd> 选项，并粘贴您从附加组件页面获得的 Web 界面 URL。
4. 填写侧边栏项目的标题、图标（建议：`mdi:vector-difference`）和该面板的 **相对 URL**（例如 `change-detection`）。最后，确认它。

### 可配置选项

```yaml
PGID: user
GPID: user
TZ: Etc/UTC 指定要使用的时区，参见 https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List
BASE_URL: 指定运行在反向代理后时的完整 URL（包括协议）
```

### 连接到无浏览器 Chrome（来自 @RhysMcW）

在 HA 中，使用文件编辑器附加组件（或文件浏览器）编辑位于 `/homeassistant/addons_config/changedetection.io/config.yaml` 的 Changedetection.io 配置文件。

在文件末尾添加以下行：
```yaml
PLAYWRIGHT_DRIVER_URL: ws://2937404c-browserless-chrome:3000/chromium?launch={"defaultViewport":{"height":720,"width":1280},"headless":false,"stealth":true}&blockAds=true
```

根据 yaml 的要求，请务必在文件末尾添加一个空行。

`2937404c-browserless-chrome` 主机名显示在用户界面中，位于无浏览器 Chromium 附加组件页面：
![image](https://github.com/user-attachments/assets/a63514f6-027a-4361-a33f-0d8f87461279)

您还可以通过以下方式获取它：
* 使用 SSH 运行 `docker exec -i hassio_dns cat "/config/hosts"`
* 从 HA 的 CLI 使用 arp
* 您还可以使用您的 HA IP 地址。

然后重启 Changedetection.io 附加组件 - 之后，您可以在 Changedetection.io 中使用浏览器选项。

## 安装

此附加组件的安装非常简单，与安装其他 Hass.io 附加组件没有区别。

1. [将我的 Hass.io 附加组件仓库][repository] 添加到您的 Hass.io 实例。
1. 安装此附加组件。
1. 点击 `保存` 按钮以保存您的配置。
1. 启动该附加组件。
1. 检查该附加组件的日志以查看一切是否正常。
1. 根据您的偏好仔细配置附加组件，请参阅官方文档了解详细信息。

[repository]: https://github.com/alexbelgium/hassio-addons