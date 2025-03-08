# Home Assistant 插件：Matter Server

## 安装

按照以下步骤安装此插件。

1. 点击下面的“Home Assistant 我的”按钮，以便在您的 Home Assistant 实例中打开插件页面。

   [![在您的 Home Assistant 实例中打开此插件。][addon-badge]][addon]

2. 点击“安装”按钮以安装插件。

## 如何使用

启动 Matter Server 插件，使 WebSocket 可用于 Home Assistant Core。在 Home Assistant Core 中安装 [Matter 集成][matter_integration]。

### 从外部访问 WebSocket 接口（高级）

默认情况下，Python Matter Server 的 WebSocket 接口仅在内部暴露。仍然可以通过主机接口启用访问。为此，请点击“显示禁用的端口”，并在 Matter Server WebSocket 服务器端口字段中输入端口（例如 5580）。

## 配置

插件配置：

| 配置项               | 描述                                                       |
|---------------------|------------------------------------------------------------|
| log_level           | Matter Server 组件的日志级别。                            |
| log_level_sdk       | Matter SDK 日志的日志级别。                               |
| beta                | 是否在启动时安装最新的 beta 版本。                       |
| enable_test_net_dcl | 为 PAA 根证书和其他设备信息启用测试网 DCL。              |
| bluetooth_adapter_id | 设置 BlueZ 蓝牙控制器 ID（用于本地调试）。                |

## 支持

有问题？

您可以通过以下几种方式获取答案：

- [Home Assistant Discord 聊天服务器][discord]。
- Home Assistant [社区论坛][forum]。
- 加入 [/r/homeassistant][reddit] 的 [Reddit 子版块][reddit]。

如果您发现了一个错误，请 [在我们的 GitHub 上打开一个问题][issue]。

[addon]: https://my.home-assistant.io/redirect/supervisor_addon/?addon=core_matter_server
[addon-badge]: https://my.home-assistant.io/badges/supervisor_addon.svg
[discord]: https://discord.gg/c5DvZ4e
[forum]: https://community.home-assistant.io
[reddit]: https://reddit.com/r/homeassistant
[issue]: https://github.com/home-assistant/addons/issues
[matter_server_repo]: https://github.com/home-assistant-libs/python-matter-server
[matter_integration]: https://www.home-assistant.io/integrations/matter/