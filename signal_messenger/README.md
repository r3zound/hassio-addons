[![](logo.png)](https://www.signal.org/)

# Signal Messenger

Signal-CLI Home Assistant 插件的 REST-API

# 如何使用此插件

安装插件，选择您想要的端口，然后启动。

在插件启动后，请遵循以下链接的说明，从“注册电话号码”开始。

https://github.com/bbernhard/signal-cli-rest-api/blob/master/doc/HOMEASSISTANT.md

然后前往这里：

https://www.home-assistant.io/integrations/signal_messenger/

# API 详情

如果您想使用，例如 REST 来在 HA 中接收消息，您可以在 [这里](https://bbernhard.github.io/signal-cli-rest-api/) 找到更多详细信息。

强烈建议您使用机器的 IP 地址，而不是上游容器文档中提到的回环地址来注册号码。在 HAOS 中，一切都是容器化的，回环地址只停留在各自的容器内。

所有荣誉归 [@bbernhard](https://github.com/bbernhard)，我所做的仅仅是拿他的 [作品](https://github.com/bbernhard/signal-cli-rest-api) 制作了一个插件。