# Home Assistant 插件：Silicon Labs Flasher 插件

## 安装

按照以下步骤在您的系统上安装插件：

1. 在您的 Home Assistant 前端中导航到 **设置** -> **插件、备份与管理** -> **插件商店**。
2. 找到 "Silicon Labs Flasher" 插件并点击它。
3. 点击 "安装" 按钮。

## 如何使用

该插件需要一个通过串口可访问的基于 Silicon Labs 的无线模块（比如 Home Assistant Yellow、Home Assistant SkyConnect/ZBT-1 或其他基于 USB 的无线适配器上的模块）。

1. 在插件配置选项卡中选择正确的 `device`，然后按 `保存`。
2. 启动插件。

## 配置

插件配置：

| 配置               | 描述                                                 |
|--------------------|-------------------------------------------------------|
| device (必填)     | Silicon Labs 无线电连接的串口服务                   |
| baudrate           | 串口波特率（取决于固件）                            |
| flow_control       | 是否应启用硬件流控制（取决于固件）                  |
| firmware_url       | 自定义 URL 以闪存固件                               |

## 支持

有问题吗？

您有几种方式可以获取答案：

- [Home Assistant Discord 聊天服务器][discord]。
- Home Assistant [社区论坛][forum]。
- 参加 [/r/homeassistant][reddit] 的 [Reddit 子版块][reddit]。

如果您发现了一个错误，请 [在我们的 GitHub 上报告问题][issue]。

[discord]: https://discord.gg/c5DvZ4e
[forum]: https://community.home-assistant.io
[reddit]: https://reddit.com/r/homeassistant
[issue]: https://github.com/home-assistant/addons/issues