# 家庭助理附加组件: MyIP

MyIP 是一款高级 IP 工具，旨在提供有关您的 IP 地址的广泛信息和诊断。它非常适合需要查看和分析 IP 详细信息、检查网站可访问性、执行 DNS 泄漏测试等的用户。

_感谢所有给我的仓库加星的朋友！要加星，请点击下面的图像，然后它会出现在右上角。谢谢！_

[![Stargazers repo roster for @jdeath/homeassistant-addons](https://reporoster.com/stars/jdeath/homeassistant-addons)](https://github.com/jdeath/homeassistant-addons/stargazers)

## 关于

此附加组件使用 [docker 镜像](https://github.com/jason5ng32/MyIP)。

## 安装

该附加组件的安装非常简单，与安装其他任何 Hass.io 附加组件没有区别。

1. [将我的 Hass.io 附加组件库][repository] 添加到您的 Hass.io 实例。
1. 安装此附加组件。
1. 点击 `保存` 按钮以保存您的配置。
1. 打开 WebUI 应该可以通过 <your-ip>:port 工作。

## 配置

```
port : 18966 # 您希望运行的端口。
```

Webui 可以在 `<your-ip>:port` 找到。

[repository]: https://github.com/jdeath/homeassistant-addons