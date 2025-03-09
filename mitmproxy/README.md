# 家庭自动化助手附加组件：mitmproxy

Mitmproxy 是您调试、测试、隐私测量和渗透测试的瑞士军刀。它可以用来拦截、检查、修改和重放网页流量，例如 HTTP/1、HTTP/2、WebSockets 或任何其他 SSL/TLS 保护的协议。您可以美化和解码多种消息类型，从 HTML 到 Protobuf，在飞行中拦截特定消息，在它们到达目的地之前进行修改，并在稍后重放到客户端或服务器上。

使用 mitmproxy 的主要功能可以通过 mitmweb 的图形界面实现。您喜欢 Chrome 的开发者工具吗？mitmweb 为任何其他应用程序或设备提供类似的体验，以及额外的功能，如请求拦截和重放。

_感谢所有给我的仓库加星的人！要加星，请点击下面的图片，然后它会在右上角。谢谢！_

[![Stargazers repo roster for @jdeath/homeassistant-addons](https://reporoster.com/stars/jdeath/homeassistant-addons)](https://github.com/jdeath/homeassistant-addons/stargazers)

## 关于

此附加组件基于 [docker 镜像](https://github.com/mitmproxy/mitmproxy)。

## 安装

1. [将我的 Hass.io 附加组件库][repository] 添加到您的 Hass.io 实例。
1. 安装此附加组件。
1. 单击 `保存` 按钮以存储代理端口和 WebUI 端口的配置。
1. 启动附加组件。
1. 检查附加组件的日志以查看一切是否正常。
1. 您的证书将生成在 /addon_configs/2effc9b9_mitmproxy 中。
1. 如果您有来自其他安装的证书，请将它们复制到此目录中。
1. 打开 WebUI 应该可以通过 <your-ip>:port 访问。

Webui 可以在 `<your-ip>:port` 找到。

[repository]: https://github.com/jdeath/homeassistant-addons