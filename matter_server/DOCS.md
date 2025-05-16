# Home Assistant 插件：Matter Server

## 安装

请按照以下步骤安装该插件。

1. 点击下面的 Home Assistant My 按钮，以打开您 Home Assistant 实例上的插件页面。

   [![在您的 Home Assistant 实例中打开此插件。][addon-badge]][addon]

1. 点击“安装”按钮安装插件。

## 如何使用

启动 Matter Server 插件，使 WebSocket 可用于 Home Assistant Core。 在 Home Assistant Core 中安装 [Matter 集成][matter_integration]。

### 外部访问 WebSocket 接口（高级）

默认情况下，Python Matter Server 的 WebSocket 接口仅在内部公开。仍然可以通过主机接口启用访问。为此，请点击“显示禁用的端口”，并在 Matter Server WebSocket 服务器端口字段中输入一个端口（例如：5580）。

## 配置

插件配置：

| 配置                   | 描述                                                       |
|------------------------|------------------------------------------------------------|
| log_level              | Matter Server 组件的日志级别。                            |
| log_level_sdk          | Matter SDK 日志的日志级别。                              |
| beta                   | 是否在启动时安装最新的测试版                              |
| enable_test_net_dcl    | 启用测试网络 DCL 以获取 PAA 根证书和其他设备信息。      |
| bluetooth_adapter_id    | 设置 BlueZ 蓝牙控制器 ID（用于本地配置）                 |

## 支持

有问题吗？

您有几种选择来获取答案：

- [Home Assistant Discord 聊天服务器][discord]。
- Home Assistant [社区论坛][forum]。
- 加入 [/r/homeassistant][reddit] 的 [Reddit 子论坛][reddit]。

如果您发现了一个错误，请 [在我们的 GitHub 上提交问题][issue]。

[addon]: https://my.home-assistant.io/redirect/supervisor_addon/?addon=core_matter_server
[addon-badge]: https://my.home-assistant.io/badges/supervisor_addon.svg
[discord]: https://discord.gg/c5DvZ4e
[forum]: https://community.home-assistant.io
[reddit]: https://reddit.com/r/homeassistant
[issue]: https://github.com/home-assistant/addons/issues
[matter_server_repo]: https://github.com/home-assistant-libs/python-matter-server
[matter_integration]: https://www.home-assistant.io/integrations/matter/