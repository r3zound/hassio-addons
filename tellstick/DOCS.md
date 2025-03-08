# Home Assistant 插件: TellStick

## 安装

按照以下步骤在您的系统上安装插件：

1. 在您的 Home Assistant 前端导航到 **设置** -> **插件** -> **插件商店**。
2. 找到 "TellStick" 插件并点击它。
3. 点击 "安装" 按钮。

## 如何使用

### 启动插件

安装后，您将看到默认和示例配置，
要更改此配置，您必须遵循 JSON 格式并与
[Tellstick 配置文件（tellstick.conf）的有效参数][conf] 对齐。

1. 调整插件配置以匹配您的设备。有关更多详细信息，请参见下面的插件配置选项。
2. 点击 "保存" 按钮保存插件配置。
3. 启动插件。

### Home Assistant 集成

您需要向 `configuration.yaml` 文件添加内部通信详细信息，以启用与插件的集成。

```yaml
# 示例 configuration.yaml 入口
tellstick:
    host: core-tellstick
    port: [50800, 50801]
```

要将灯光、传感器和开关添加到 Home Assistant，您需要按照每种类型的指南，其中描述了 Home Assistant 的具体要求。

有关更多信息，请查看 Home Assistant 文档：

<https://www.home-assistant.io/components/tellstick/>

## 配置

安装后，您将看到默认和示例配置，
要更改此配置，您必须遵循 JSON 格式并与
[Tellstick 配置文件（tellstick.conf）的有效参数][conf] 对齐。

插件示例配置：

```yaml
devices:
  - id: 1
    name: 示例设备
    protocol: everflourish
    model: selflearning-switch
    house: A
    unit: '1'
  - id: 2
    name: 示例设备二
    protocol: everflourish
    model: selflearning-switch
    house: A
    unit: '2'
```

请注意：在对配置进行任何更改后，
您需要重启插件以使更改生效。

### 选项: `devices`（必需）

向插件配置中添加一个或多个设备条目，以添加您希望的每个设备。请注意设备之间的逗号分隔符（见上面的示例）。

#### 选项: `devices.id`（必需）

一个唯一的数字/标识符，必须对每个设备唯一。

#### 选项: `devices.name`（必需）

您的设备的名称，让其更易于识别。

#### 选项: `devices.protocol`（必需）

这是设备使用的协议。有关支持协议的完整列表
（因此这个配置选项的有效值），请查看
TellStick [协议列表][protocol-list]。

#### 选项: `devices.model`（可选）

模型参数仅由某些协议使用，适用于使用相同协议的不同类型设备。这可以是调光器与非调光器、代码开关与自学习等。

#### 选项: `devices.house`（可选）

根据协议，此处的值可以变化很大，以识别
或按房屋或类型分组。

#### 选项: `devices.unit`（可选）

单元标识符，在大多数情况下是 1 到 16 之间的值，通常与房屋结合使用。

#### 选项: `devices.fade`（可选）

Fade 为 `true` 或 `false`，告知调光器是否应在值之间平滑或立即渐变（似乎仅适用于 IKEA 协议）。

#### 选项: `devices.code`（可选）

基于 1 和 0 的编号序列，通常用于基于翻转开关的设备。

## 服务调用

如果您希望在 TellStick 配置中教导一个自学习设备：

转到 Home Assistant 开发者工具中的服务调用并选择：

- 服务: `hassio.addon_stdin`
- 输入服务数据:
  `{"addon":"core_tellstick","input":{"function":"learn","device":"1"}}`

将 `1` 替换为您 TellStick 配置中对应设备的 ID。

您还可以使用此方法列出设备或传感器，并在插件日志中读取输出: `{"addon":"core_tellstick","input":{"function":"list-sensors"}}`

### 支持的服务命令

- `"function":"list"`
  列出当前已配置的设备名称和设备 ID 以及所有发现的传感器。

- `"function":"list-sensors"`

- `"function":"list-devices"`
  替代的设备/传感器列出方式：以 key=value 格式显示设备和/或传感器
  （以制表符作为分隔符，每行一个设备/传感器，无标题行。）

- `"function":"on","device":"x"`
  打开设备。 ’x’ 可以是设备 ID 的整数，
  或设备的名称。

- `"function":"off","device":"x"`
  关闭设备。 ’x’ 可以是设备 ID 的整数，
  或设备的名称。

## 支持

有问题吗？

您有几种方式可以获得回答：

- [Home Assistant Discord 聊天服务器][discord]。
- Home Assistant [社区论坛][forum]。
- 加入 [Reddit 子版块][reddit] 在 [/r/homeassistant][reddit]。

如果您发现了一个错误，请在我们的 GitHub 上[报告问题][issue]。

[conf]: http://developer.telldus.com/wiki/TellStick_conf
[discord]: https://discord.gg/c5DvZ4e
[forum]: https://community.home-assistant.io
[issue]: https://github.com/home-assistant/addons/issues
[protocol-list]: http://developer.telldus.com/wiki/TellStick_conf
[reddit]: https://reddit.com/r/homeassistant
[repository]: https://github.com/hassio-addons/repository