# Signal Messenger 插件用于 Home Assistant

此插件允许您通过 Signal Messenger 向已在其设备上安装 Signal Messenger 应用程序的收件人发送消息。

## 安装

- 将此存储库添加到 Home Assistant Supervisor 插件商店
- 点击安装
- 选择您想要的端口
- 选择您想要的选项
- 点击开始

## 使用

使用说明可以在官方 [文档](https://www.home-assistant.io/integrations/signal_messenger/) 中找到。

## 选项

### 模式

此选项允许您设置 MODE 环境变量。这将替换 Use Native 变量并添加一个额外的模式。

有效选项：

- 'normal': 每个 REST API 请求调用 signal-cli JAVA 应用程序（最慢模式）
- 'native': 每个 REST API 请求调用编译的本地映像（比正常模式快）
- 'json-rpc': signal-cli JAVA 应用程序启动一次，REST API 包装器通过 JSON-RPC 与它通信（启动时间较慢，但一旦 Java 应用程序运行，它应该是最快的）

### 自动接收

如果您没有设置 REST API 端点来监听新消息，建议启用此选项。有关更多详细信息，请参见文档 [在这里](https://github.com/bbernhard/signal-cli-rest-api#auto-receive-schedule)。此选项不适用于 json-rpc 模式，并将在该模式下被忽略。

有效选项：

- `off`: 禁用自动接收
- `on`: 启用自动接收（默认）

### SIGNAL-CLI 命令超时

此选项设置在超时 signal cli 命令之前等待的时间（以秒为单位）。此选项不适用于 json-rpc 模式，并将在该模式下被忽略。（默认：60秒）

### 重置数据

此选项会删除所有数据并重置插件。请注意，您的所有设置将被销毁。

## 版本控制

此插件遵循上游容器的版本控制。此插件与 [这里](https://github.com/bbernhard/signal-cli-rest-api) 找到的容器之间的差异非常小。
截至撰写本文时，上游容器版本控制使用 0.xx 模式进行发布。此插件遵循相同模式，但使用 0.xx.y，其中 y 表示与 Home Assistant 插件相关的上游变更。

## 与上游的区别

此插件与上游的主要区别在于持久存储的位置已从 `/home/.local/share/signal-cli` 更改为 `/data`。
还有一个脚本可以运行以允许设置上述选项。

## 错误报告

错误报告可以通过 [插件存储库](https://github.com/haberda/hassio_addons) 或 [上游存储库](https://github.com/bbernhard/signal-cli-rest-api) 提交。 
在提交报告之前，请尝试确定您的错误是否与插件特定问题或应用程序问题相关。插件特定问题应提交给插件存储库，应用程序特定问题应提交给上游存储库。