# Home Assistant 插件：Piper

## 安装

按照以下步骤在您的系统上安装该插件：

1. 在您的 Home Assistant 前端中导航到 **设置** -> **插件** -> **插件商店**。
2. 找到 "Piper" 插件并点击它。
3. 点击 "INSTALL" 按钮。

## 如何使用

安装并运行此插件后，它将被 Home Assistant 中的 Wyoming 集成自动发现。要完成设置，请点击以下我的按钮：

[![打开您的 Home Assistant 实例并开始设置新的集成。](https://my.home-assistant.io/badges/config_flow_start.svg)](https://my.home-assistant.io/redirect/config_flow_start/?domain=wyoming)

或者，您可以手动安装 Wyoming 集成，详细信息请参见
[Wyoming 集成文档](https://www.home-assistant.io/integrations/wyoming/)。

## 配置

### 选项：`voice`

[试听音频样本](https://rhasspy.github.io/piper-samples/)

要使用的 Piper 音色名称，例如 `en_US-lessac-medium`（默认）。
音色模型会从 https://huggingface.co/rhasspy/piper-voices/tree/v1.0.0 自动下载。

音色的命名遵循以下模式：`<language>_<REGION>-<name>-<quality>`
`<name>` 部分来自用于训练该音色的数据集，或者如果提供了说话者的名字，则使用说话者的名字。

音色的质量有 4 个不同级别：

- `x_low` - 16Khz，最小/最快
- `low` - 16Khz，快速
- `medium` - 22.05Khz，较慢但音质更好
- `high` - 22.05Khz，最慢但音质最佳

在 Raspberry Pi 4 上，最高可运行 `medium` 音色模型。如果音频质量不是重点，建议选择 `low` 或 `x-low` 音色，因为它们的速度明显快于 `medium`。

### 选项：`speaker`

如果音色支持多个扬声器，则使用的扬声器编号，例如 [`en-us-libritts-high`](https://rhasspy.github.io/piper-samples/#en-us-libritts-high)。

默认情况下，将使用第一个扬声器（扬声器 0）。

### 选项：`length_scale`

加快或减慢音色的语速。值为 1.0 表示使用音色的默认语速，< 1.0 为更快，> 1.0 为更慢。

### 选项：`noise_scale`

通过在音频生成过程中添加噪音来控制音频的可变性。效果在很大程度上取决于音色本身，但一般来说，值为 0 会去除可变性，值大于 1 将开始降低音质。

### 选项：`noise_w`

控制语音节奏的可变性（音素宽度）。效果在很大程度上取决于音色本身，但一般来说，值为 0 会去除可变性，值大于 1 会产生极端的口吃和停顿。

### 选项：`max_piper_procs`

同时运行的 Piper 进程数（默认值为 1）。每个 Piper 进程将单个音色模型加载到 RAM 中，因此同时使用多个音色需要：

- 在使用音色时启动/停止 Piper 进程，或者
- 运行更多的 Piper 进程

该插件将为每个请求的音色启动一个 Piper 进程，直到达到 `max_piper_procs`。之后，将停止最近最少使用的音色。
如果您需要快速切换多个音色，请增加 `max_piper_procs`，但请注意，这将增加插件的 RAM 使用量。

### 选项：`update_voices`

每次插件启动时自动下载新音色列表。您还必须重新加载 Home Assistant 中的 Wyoming 集成以查看新音色。

### 选项：`debug_logging`

将 DEBUG 级别消息打印到插件的日志中。

## 自定义音色

将自定义音频文件添加到 `/share/piper` 目录。每个自定义音色必须包括一个模型文件（`<voice>.onnx`）和配置文件（`<voice>.onnx.json`）。
有关如何训练和导出自定义音色的详细信息，请参见 [训练指南](https://github.com/rhasspy/piper/blob/master/TRAINING.md)。

## 支持

有问题吗？

您有几种选择可以获得答案：

- [Home Assistant Discord 聊天服务器][discord]。
- Home Assistant [社区论坛][forum]。
- 加入 [/r/homeassistant][reddit] 的 [Reddit 子版块][reddit]。

如果您发现了一个错误，请 [在我们的 GitHub 上打开一个问题][issue]。

[discord]: https://discord.gg/c5DvZ4e
[forum]: https://community.home-assistant.io
[issue]: https://github.com/home-assistant/addons/issues
[reddit]: https://reddit.com/r/homeassistant
[repository]: https://github.com/hassio-addons/repository