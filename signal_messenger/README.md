[![](logo.png)](https://www.signal.org/)

# Signal Messenger

Signal-CLI Home Assistant 插件的 Rest-API

# 如何使用此插件

安装插件，选择所需的端口，启动。

插件启动后，按照以下链接中的指示，从“注册电话号码”开始。

https://github.com/bbernhard/signal-cli-rest-api/blob/master/doc/HOMEASSISTANT.md

然后继续前往这里：

https://www.home-assistant.io/integrations/signal_messenger/

# API 细节

如果你想使用例如 REST 在 HA 中接收消息，可以在 [这里](https://bbernhard.github.io/signal-cli-rest-api/) 找到更多细节。

强烈建议你使用机器的 IP 地址，而不是上游容器文档中提到的回环地址来注册号码。在 HAOS 中，一切都是容器化的，回环地址只在相应的容器内部。

所有荣誉归 [@bbernhard](https://github.com/bbernhard)，我所做的只是从他的 [工作](https://github.com/bbernhard/signal-cli-rest-api) 中提取并制作了一个插件。