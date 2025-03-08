# Home Assistant 附加组件：Matter 服务器

## 安装

使用以下步骤安装此附加组件。

1. 点击下面的 Home Assistant 按钮以打开您 Home Assistant 实例的附加组件页面。

   [![在您的 Home Assistant 实例中打开此附加组件.][addon-badge]][addon]

1. 点击“安装”按钮以安装附加组件。

## 如何使用

启动 Matter 服务器附加组件，以使 WebSocket 可用于 Home Assistant 核心。在 Home Assistant 核心中安装 [Matter 集成][matter_integration]。

### 从外部访问 WebSocket 接口（高级）

默认情况下，Python Matter 服务器的 WebSocket 接口仅在内部公开。仍然可以通过主机接口启用访问。为此，单击“显示禁用的端口”，并在 Matter 服务器 WebSocket 服务器端口字段中输入一个端口（例如 5580）。

## 配置

附加组件配置：

| 配置                | 描述                                                       |
|---------------------|------------------------------------------------------------|
| log_level           | Matter 服务器组件的日志级别。                            |
| log_level_sdk       | Matter SDK 日志的日志级别。                              |
| beta                | 是否在启动时安装最新的测试版本                             |
| enable_test_net_dcl | 启用测试网络 DCL，以获取 PAA 根证书和其他设备信息。      |
| bluetooth_adapter_id | 设置 BlueZ 蓝牙控制器 ID（用于本地调试）                |

## 支持

有问题吗？

您有几个选项可以获得答案：

- [Home Assistant Discord 聊天服务器][discord]。
- Home Assistant [社区论坛][forum]。
- 加入 [/r/homeassistant][reddit] 的 [Reddit 子版块][reddit]。

如果您发现了一个错误，请 [在我们的 GitHub 上报告问题][issue]。

[addon]: https://my.home-assistant.io/redirect/supervisor_addon/?addon=core_matter_server
[addon-badge]: https://my.home-assistant.io/badges/supervisor_addon.svg
[discord]: https://discord.gg/c5DvZ4e
[forum]: https://community.home-assistant.io
[reddit]: https://reddit.com/r/homeassistant
[issue]: https://github.com/home-assistant/addons/issues
[matter_server_repo]: https://github.com/home-assistant-libs/python-matter-server
[matter_integration]: https://www.home-assistant.io/integrations/matter/