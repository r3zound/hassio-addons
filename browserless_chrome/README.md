# 家庭助手附加组件: 无头 Chrome

[![捐赠][donation-badge]](https://www.buymeacoffee.com/alexbelgium)
[![捐赠][paypal-badge]](https://www.paypal.com/donate/?hosted_button_id=DZFULJZTP3UQA)

![版本](https://img.shields.io/badge/dynamic/json?label=Version&query=%24.version&url=https%3A%2F%2Fraw.githubusercontent.com%2Falexbelgium%2Fhassio-addons%2Fmaster%2Fbrowserless_chrome%2Fconfig.json)
![Ingress](https://img.shields.io/badge/dynamic/json?label=Ingress&query=%24.ingress&url=https%3A%2F%2Fraw.githubusercontent.com%2Falexbelgium%2Fhassio-addons%2Fmaster%2Fbrowserless_chrome%2Fconfig.json)
![架构](https://img.shields.io/badge/dynamic/json?color=success&label=Arch&query=%24.arch&url=https%3A%2F%2Fraw.githubusercontent.com%2Falexbelgium%2Fhassio-addons%2Fmaster%2Fbrowserless_chrome%2Fconfig.json)

[![Codacy 徽章](https://app.codacy.com/project/badge/Grade/9c6cf10bdbba45ecb202d7f579b5be0e)](https://www.codacy.com/gh/alexbelgium/hassio-addons/dashboard?utm_source=github.com&utm_medium=referral&utm_content=alexbelgium/hassio-addons&utm_campaign=Badge_Grade)
[![GitHub Super-Linter](https://img.shields.io/github/actions/workflow/status/alexbelgium/hassio-addons/weekly-supelinter.yaml?label=Lint%20code%20base)](https://github.com/alexbelgium/hassio-addons/actions/workflows/weekly-supelinter.yaml)
[![构建器](https://img.shields.io/github/actions/workflow/status/alexbelgium/hassio-addons/onpush_builder.yaml?label=Builder)](https://github.com/alexbelgium/hassio-addons/actions/workflows/onpush_builder.yaml)

[donation-badge]: https://img.shields.io/badge/Buy%20me%20a%20coffee%20(no%20paypal)-%23d32f2f?logo=buy-me-a-coffee&style=flat&logoColor=white
[paypal-badge]: https://img.shields.io/badge/Buy%20me%20a%20coffee%20with%20Paypal-0070BA?logo=paypal&style=flat&logoColor=white

_感谢所有给我仓库点星星的人！要点星请点击下面的图片，然后它将显示在右上角。谢谢！_

[![@alexbelgium/hassio-addons 的 Stargazers 仓库名单](https://raw.githubusercontent.com/alexbelgium/hassio-addons/master/.github/stars2.svg)](https://github.com/alexbelgium/hassio-addons/stargazers)

![下载演变](https://raw.githubusercontent.com/alexbelgium/hassio-addons/master/browserless_chrome/stats.png)

## 关于

---

[无头 Chrome](https://github.com/browserless/chrome) 是一个网络服务，允许远程客户端连接、操作和执行无头工作。
该附加组件基于 docker 镜像 https://hub.docker.com/r/browserless/chrome/

## 配置
---

WebUI 可以在 <http://homeassistant:PORT> 找到。
配置可以通过应用的 WebUI 进行，以下选项除外

```yaml

```

## 安装

---

安装此附加组件非常简单，与安装其他任何附加组件没有区别。

1. 将我的附加组件仓库添加到您的家庭助手实例中（在监控器附加组件商店的右上角，或如果您已配置我的 HA，请点击下面的按钮）
   [![打开您的家庭助手实例并显示添加附加组件仓库对话框，特定仓库 URL 预填充。](https://my.home-assistant.io/badges/supervisor_add_addon_repository.svg)](https://my.home-assistant.io/redirect/supervisor_add_addon_repository/?repository_url=https%3A%2F%2Fgithub.com%2Falexbelgium%2Fhassio-addons)
2. 安装此附加组件。
3. 点击 `保存` 按钮以存储您的配置。
4. 根据您的喜好设置附加组件选项
5. 启动附加组件。
6. 检查附加组件的日志，以查看是否一切正常。
7. 打开 WebUI 并调整软件选项

## 支持

在 GitHub 上创建一个问题