# Signal Messenger 插件用于 Home Assistant

此插件允许您通过 Signal Messenger 向已在其设备上安装 Signal Messenger 应用程序的收件人发送消息。

## 安装

- 将此代码库添加到 Home Assistant 管理员插件商店
- 点击安装
- 选择您希望的端口
- 选择您希望的选项
- 点击启动

## 使用

使用说明可以在官方 [文档](https://www.home-assistant.io/integrations/signal_messenger/) 中找到。

## 选项

### 模式

此选项允许您设置 MODE 环境变量。它替代了 Use Native 变量并添加了一个额外的模式。

有效选项：

- 'normal': 每个 REST API 请求调用 signal-cli JAVA 应用程序（最慢模式）
- 'native': 每个 REST API 请求调用已编译的本地映像（比正常模式快）
- 'json-rpc': signal-cli JAVA 应用程序启动一次，REST API 包装通过 JSON-RPC 与其通信（启动时间较慢，但一旦 Java 应用程序运行，它应该是最快的）

### 自动接收

如果您没有设置 REST API 端点来监听新消息，则建议启用此选项。有关更多详情，请参见文档 [这里](https://github.com/bbernhard/signal-cli-rest-api#auto-receive-schedule)。此选项不适用于 json-rpc 模式，并将在该模式下被忽略。

有效选项：

- `off`: 禁用自动接收
- `on`: 启用自动接收（默认）

### SIGNAL-CLI 命令超时时间

此选项设置等待信号 cli 命令超时的时间（以秒为单位）。此选项不适用于 json-rpc 模式，并将在该模式下被忽略。（默认：60秒）

### 重置数据

此选项会删除所有数据并重置插件。请注意，您所有的设置将被销毁。

## 版本管理

此插件遵循上游容器的版本管理。此插件与找到的容器之间几乎没有区别 [这里](https://github.com/bbernhard/signal-cli-rest-api)。
截至本写作，上游容器版本使用 0.xx 模式进行发布。此插件遵循相同模式，但使用 0.xx.y，其中 y 表示与 Home Assistant 插件特定更改相关的上游更改。

## 与上游的区别

此插件和上游之间的主要区别在于持久存储的位置已从 `/home/.local/share/signal-cli` 更改为 `/data`。
还有一个脚本运行以允许设置上述选项。

## 缺陷报告

缺陷报告可以提交给 [插件代码库](https://github.com/haberda/hassio_addons) 或 [上游代码库](https://github.com/bbernhard/signal-cli-rest-api)。
请在提交报告之前尝试确定您的缺陷是否与插件特定问题或应用程序问题相关。插件特定问题应提交给插件代码库，应用程序特定问题应提交给上游代码库。