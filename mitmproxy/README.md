# 家庭助手插件：mitmproxy

Mitmproxy 是您调试、测试、隐私测量和渗透测试的瑞士军刀。它可以用于拦截、检查、修改和重播 web 流量，例如 HTTP/1、HTTP/2、WebSockets 或任何其他 SSL/TLS 保护的协议。您可以美化和解码各种消息类型，从 HTML 到 Protobuf，动态拦截特定消息，在它们到达目的地之前进行修改，并在稍后将其重播到客户端或服务器。

使用 mitmproxy 的主要功能与 mitmweb 的图形界面结合。您喜欢 Chrome 的开发者工具吗？mitmweb 为任何其他应用程序或设备提供了类似的体验，并且具有请求拦截和重播等额外功能。

_感谢所有给我的代码库加星标的人！要加星标，请点击下面的图片，然后它将在右上角显示。谢谢！_

[![Stargazers repo roster for @jdeath/homeassistant-addons](https://reporoster.com/stars/jdeath/homeassistant-addons)](https://github.com/jdeath/homeassistant-addons/stargazers)

## 关于

此插件基于 [docker 镜像](https://github.com/mitmproxy/mitmproxy)。

## 安装

1. [将我的 Hass.io 插件库][repository] 添加到您的 Hass.io 实例中。
2. 安装此插件。
3. 点击 `保存` 按钮以存储代理端口和 webUI 端口的配置。
4. 启动插件。
5. 检查插件的日志以查看是否一切正常。
6. 您的证书将在 /addon_configs/2effc9b9_mitmproxy 中生成。
7. 如果您有来自其他安装的证书，请将它们复制到此目录中。
8. 打开的 WebUI 应该可以通过 <您的IP>:端口 访问。

Webui 可以在 `<您的IP>:端口` 找到。

[repository]: https://github.com/jdeath/homeassistant-addons