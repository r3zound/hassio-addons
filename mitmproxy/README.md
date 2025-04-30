# Home assistant 插件：mitmproxy

Mitmproxy 是您调试、测试、隐私测量和渗透测试的瑞士军刀。它可以用于拦截、检查、修改和重放 HTTP/1、HTTP/2、WebSockets 或任何其他 SSL/TLS 保护协议的 Web 流量。您可以美化并解码从 HTML 到 Protobuf 的各种消息类型，实时拦截特定消息，在它们到达目的地之前进行修改，并在后续将其重放到客户端或服务器。

使用 mitmproxy 的主要功能通过 mitmweb 图形界面进行操作。喜欢 Chrome 的开发者工具吗？mitmweb 为任何其他应用程序或设备提供类似的体验，并附加请求拦截和重放等额外功能。

_感谢所有给我的仓库加星的人！要加星，请点击下面的图片，然后它会在右上角。谢谢！_

[![Stargazers repo roster for @jdeath/homeassistant-addons](https://reporoster.com/stars/jdeath/homeassistant-addons)](https://github.com/jdeath/homeassistant-addons/stargazers)

## 介绍

此插件基于 [docker 镜像](https://github.com/mitmproxy/mitmproxy)。

## 安装

1. [将我的 Hass.io 插件库][repository] 添加到您的 Hass.io 实例。
1. 安装此插件。
1. 点击 `Save` 按钮以存储您的代理端口和 WebUI 端口配置。
1. 启动插件。
1. 检查插件的日志以确保一切顺利。
1. 您的证书将生成在 /addon_configs/2effc9b9_mitmproxy。
1. 如果您在其他安装中有证书，请将其复制到此目录中。
1. 打开 WebUI 应通过 <your-ip>:port 进行访问。

Webui 可在 `<your-ip>:port` 找到。

[repository]: https://github.com/jdeath/homeassistant-addons