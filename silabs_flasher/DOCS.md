# Home Assistant 插件：Silicon Labs Flasher 插件

## 安装

按照以下步骤在您的系统上安装插件：

1. 在您的 Home Assistant 前端中导航到 **设置** -> **插件、备份 & 主管** -> **插件商店**。
2. 找到 "Silicon Labs Flasher" 插件并点击它。
3. 点击 "安装" 按钮。

## 如何使用

该插件需要一个基于 Silicon Labs 的无线模块，并可通过串口访问（例如 Home Assistant Yellow、Home Assistant SkyConnect/ZBT-1 或其他 USB 基于无线适配器上的模块）。

1. 在插件配置选项卡中选择正确的 `device`，并按 `保存`。
2. 启动插件。

## 配置

插件配置：

| 配置               | 描述                                                  |
|--------------------|------------------------------------------------------|
| device (必填)      | Silicon Labs 无线电连接的串行服务                     |
| baudrate           | 串口波特率（取决于固件）                              |
| flow_control       | 是否启用硬件流控制（取决于固件）                      |
| firmware_url       | 自定义固件源 URL                                     |

## 支持

有问题吗？

您有几种选择可以得到答案：

- [Home Assistant Discord 聊天服务器][discord].
- Home Assistant [社区论坛][forum].
- 加入 [Reddit  subreddit][reddit] 在 [/r/homeassistant][reddit].

如果您发现了一个 bug，请 [在我们的 GitHub 上打开一个问题][issue].

[discord]: https://discord.gg/c5DvZ4e
[forum]: https://community.home-assistant.io
[reddit]: https://reddit.com/r/homeassistant
[issue]: https://github.com/home-assistant/addons/issues