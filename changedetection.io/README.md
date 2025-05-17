# Home Assistant 插件：changedetection.io

[![Donate][donation-badge]](https://www.buymeacoffee.com/alexbelgium)
[![Donate][paypal-badge]](https://www.paypal.com/donate/?hosted_button_id=DZFULJZTP3UQA)

![版本](https://img.shields.io/badge/dynamic/json?label=Version&query=%24.version&url=https%3A%2F%2Fraw.githubusercontent.com%2Falexbelgium%2Fhassio-addons%2Fmaster%2Fchangedetection.io%2Fconfig.json)
![入口](https://img.shields.io/badge/dynamic/json?label=Ingress&query=%24.ingress&url=https%3A%2F%2Fraw.githubusercontent.com%2Falexbelgium%2Fhassio-addons%2Fmaster%2Fchangedetection.io%2Fconfig.json)
![架构](https://img.shields.io/badge/dynamic/json?color=success&label=Arch&query=%24.arch&url=https%3A%2F%2Fraw.githubusercontent.com%2Falexbelgium%2Fhassio-addons%2Fmaster%2Fchangedetection.io%2Fconfig.json)

[![Codacy 徽章](https://app.codacy.com/project/badge/Grade/9c6cf10bdbba45ecb202d7f579b5be0e)](https://www.codacy.com/gh/alexbelgium/hassio-addons/dashboard?utm_source=github.com&utm_medium=referral&utm_content=alexbelgium/hassio-addons&utm_campaign=Badge_Grade)
[![GitHub Super-Linter](https://img.shields.io/github/actions/workflow/status/alexbelgium/hassio-addons/weekly-supelinter.yaml?label=Lint%20code%20base)](https://github.com/alexbelgium/hassio-addons/actions/workflows/weekly-supelinter.yaml)
[![构建器](https://img.shields.io/github/actions/workflow/status/alexbelgium/hassio-addons/onpush_builder.yaml?label=Builder)](https://github.com/alexbelgium/hassio-addons/actions/workflows/onpush_builder.yaml)

[donation-badge]: https://img.shields.io/badge/Buy%20me%20a%20coffee%20(no%20paypal)-%23d32f2f?logo=buy-me-a-coffee&style=flat&logoColor=white
[paypal-badge]: https://img.shields.io/badge/Buy%20me%20a%20coffee%20with%20Paypal-0070BA?logo=paypal&style=flat&logoColor=white

_感谢所有为我的仓库加星的人！要加星，点击下面的图片，然后它会在右上角。谢谢！_

[![Stargazers repo roster for @alexbelgium/hassio-addons](https://reporoster.com/stars/alexbelgium/hassio-addons)](https://github.com/alexbelgium/hassio-addons/stargazers)

![下载演变](https://raw.githubusercontent.com/alexbelgium/hassio-addons/master/changedetection.io/stats.png)

## 关于

[Changedetection.io](https://github.com/dgtlmoon/changedetection.io) 提供免费的开源网页监控、通知和变化检测。

该插件基于来自 linuxserver.io 的 [docker 镜像](https://github.com/linuxserver/docker-changedetection.io)。

## 配置

### 主要应用程序

Web UI 可以在 `<your-ip>:5000` 找到，也可以从插件页面访问。

#### 侧边栏快捷方式

您可以通过以下步骤添加指向您的 Changedetection.io 实例的快捷方式：
1. 转到 <kbd>⚙ 设置</kbd> > <kbd>仪表板</kbd>
2. 点击右下角的 <kbd>➕ 添加仪表板</kbd>
3. 选择 <kbd>网页</kbd> 选项，并粘贴从插件页面获取的 Web UI URL。
4. 填写侧边栏项目的标题、图标（建议使用：`mdi:vector-difference`），以及该面板的 **相对 URL**（例如 `change-detection`）。最后确认。

### 可配置选项

```yaml
PGID: user
GPID: user
TZ: Etc/UTC 指定要使用的时区，详见 https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List
BASE_URL: 在反向代理后运行时指定完整 URL（包括协议）
```

### 连接到无浏览器的 Chrome（来自 @RhysMcW）

在 HA 中，使用文件编辑器插件（或文件浏览器）编辑 Changedetection.io 配置文件 `/homeassistant/addons_config/changedetection.io/config.yaml`。

在文件末尾添加以下行：
```yaml
PLAYWRIGHT_DRIVER_URL: ws://2937404c-browserless-chrome:3000/chromium?launch={"defaultViewport":{"height":720,"width":1280},"headless":false,"stealth":true}&blockAds=true
```

记得根据 YAML 要求在文件末尾添加空行。

`2937404c-browserless-chrome` 主机名在 UI 上的无浏览器 Chromium 插件页面中显示：
![image](https://github.com/user-attachments/assets/a63514f6-027a-4361-a33f-0d8f87461279)

您还可以通过以下方式获取主机名：
* 通过 SSH 运行 `docker exec -i hassio_dns cat "/config/hosts"`
* 在 HA 中使用 CLI，使用 arp
* 您也应该能够使用您的 HA IP 地址。

然后重启 Changedetection.io 插件 - 在那之后，您可以在 Changedetection.io 中使用浏览器选项。

## 安装

安装该插件非常简单，与安装其他 Hass.io 插件没有不同。

1. [将我的 Hass.io 插件库][repository] 添加到您的 Hass.io 实例。
2. 安装该插件。
3. 点击 `保存` 按钮以保存您的配置。
4. 启动该插件。
5. 检查插件的日志，查看一切是否顺利。
6. 小心配置插件，以符合您的偏好，详见官方文档。

[repository]: https://github.com/alexbelgium/hassio-addons