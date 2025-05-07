# 家庭助手插件：mitmproxy

Mitmproxy 是您进行调试、测试、隐私测量和渗透测试的瑞士军刀。它可以用来拦截、检查、修改和重放网络流量，如 HTTP/1、HTTP/2、WebSockets 或任何其他 SSL/TLS 保护的协议。您可以美化和解码多种消息类型，从 HTML 到 Protobuf，实时拦截特定消息，在它们到达目的地之前进行修改，并在稍后重放到客户端或服务器。

使用 mitmproxy 的主要功能通过图形界面 mitmweb。您喜欢 Chrome 的开发者工具吗？mitmweb 为任何其他应用程序或设备提供类似的体验，以及请求拦截和重放等附加功能。

_感谢所有为我的代码库加星的人！要加星，请点击下方的图片，然后它将在右上角显示。谢谢！_

[![Stargazers repo roster for @jdeath/homeassistant-addons](https://reporoster.com/stars/jdeath/homeassistant-addons)](https://github.com/jdeath/homeassistant-addons/stargazers)

## 关于

该插件基于 [docker 镜像](https://github.com/mitmproxy/mitmproxy)。

## 安装

1. [将我的 Hass.io 插件库][repository] 添加到您的 Hass.io 实例。
1. 安装此插件。
1. 点击 `保存` 按钮以存储您的代理端口和 WebUI 端口配置。
1. 启动插件。
1. 检查插件的日志以查看是否一切正常。
1. 您的证书将生成在 /addon_configs/2effc9b9_mitmproxy 中。
1. 如果您有来自其他安装的证书，请将它们复制到此目录。
1. 打开 WebUI 应该可以通过 <your-ip>:port 访问。

Webui 可以在 `<your-ip>:port` 找到。

[repository]: https://github.com/jdeath/homeassistant-addons