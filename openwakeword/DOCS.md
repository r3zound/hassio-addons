# Home Assistant 插件: openWakeWord

## 安装

按照以下步骤在您的系统上安装插件：

1. 在您的 Home Assistant 前端导航到 **设置** -> **插件** -> **插件商店**。
2. 找到 "openWakeWord" 插件并点击它。
3. 点击 "安装" 按钮。

## 使用方法

安装并运行此插件后，它将被 Home Assistant 中的 Wyoming 集成自动发现。要完成设置，请点击以下我的按钮：

[![打开您的 Home Assistant 实例并开始设置新的集成。](https://my.home-assistant.io/badges/config_flow_start.svg)](https://my.home-assistant.io/redirect/config_flow_start/?domain=wyoming)

或者，您可以手动安装 Wyoming 集成，更多信息请参见 [Wyoming 集成文档](https://www.home-assistant.io/integrations/wyoming/)。

## 配置

### 选项: `threshold`

激活阈值（0-1），值越高意味着激活次数越少。请查看触发级别以了解激活次数与唤醒词检测之间的关系。

### 选项: `trigger_level`

在注册检测之前的激活次数。较高的触发级别意味着检测次数较少。

### 选项: `debug_logging`

启用调试日志记录。对于查看卫星连接和每个唤醒词检测的日志非常有用。

## 自定义唤醒词模型

该插件将自动加载 `/share/openwakeword` 目录中的自定义唤醒词模型。[安装 Samba 插件](https://www.home-assistant.io/common-tasks/supervised/#installing-and-using-the-samba-add-on) 将唤醒词模型文件（`*.tflite`）复制到此目录。

在 `/share/openwakeword` 中添加新模型后，请确保重新加载任何用于 openWakeWord 的 Wyoming 集成。重新加载后，新唤醒词将在语音助手设置页面中可供选择。

## 支持

有问题吗？

您有几种选项可以获得答案：

- [Home Assistant Discord 聊天服务器][discord]。
- Home Assistant [社区论坛][forum]。
- 加入 [/r/homeassistant][reddit] 的 [Reddit 子版块][reddit]。

如果您发现了一个 bug，请 [在我们的 GitHub 上报告问题][issue]。

[discord]: https://discord.gg/c5DvZ4e
[forum]: https://community.home-assistant.io
[issue]: https://github.com/home-assistant/addons/issues
[reddit]: https://reddit.com/r/homeassistant
[repository]: https://github.com/hassio-addons/repository