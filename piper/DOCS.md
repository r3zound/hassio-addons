# Home Assistant 插件：Piper

## 安装

按照以下步骤在您的系统上安装插件：

1. 在您的 Home Assistant 前端导航到 **设置** -> **插件** -> **插件商店**。
2. 找到 "Piper" 插件并点击它。
3. 点击 "安装" 按钮。

## 如何使用

安装并运行此插件后，它将自动被 Home Assistant 中的 Wyoming 集成发现。要完成设置，请点击以下我的按钮：

[![打开您的 Home Assistant 实例并开始设置新的集成。](https://my.home-assistant.io/badges/config_flow_start.svg)](https://my.home-assistant.io/redirect/config_flow_start/?domain=wyoming)

或者，您可以手动安装 Wyoming 集成，请参见
[Wyoming 集成文档](https://www.home-assistant.io/integrations/wyoming/)以获取更多信息。

## 配置

### 选项：`voice`

[收听语音样本](https://rhasspy.github.io/piper-samples/)

要使用的 Piper 语音名称，例如 `en_US-lessac-medium`（默认）。
语音模型会自动从 https://huggingface.co/rhasspy/piper-voices/tree/v1.0.0 下载。

语音的命名遵循以下方案：`<language>_<REGION>-<name>-<quality>`
`<name>` 部分来自用于训练语音的数据集，或如果提供了说话者的名称。

语音的质量有 4 种不同级别：

- `x_low` - 16Khz，最小/最快
- `low` - 16Khz，快速
- `medium` - 22.05Khz，较慢但声音更好
- `high` - 22.05Khz，最慢但声音最好

在 Raspberry Pi 4 上，最多运行 `medium` 模型将具有可用速度。如果音频质量不是优先考虑的，建议使用 `low` 或 `x-low` 语音，因为它们的速度明显快于 `medium`。

### 选项：`speaker`

如果语音支持多个扬声器，则使用的扬声器编号，例如 [`en-us-libritts-high`](https://rhasspy.github.io/piper-samples/#en-us-libritts-high)。

默认情况下，将使用第一个扬声器（扬声器 0）。

### 选项：`length_scale`

加速或减慢语音。值为 1.0 意味着使用语音的默认语速，< 1.0 表示更快，> 1.0 表示更慢。

### 选项：`noise_scale`

通过在音频生成过程中添加噪音来控制音频的可变性。效果高度依赖于语音本身，但通常值为 0 时去除可变性，值大于 1 时将开始恶化音频。

### 选项：`noise_w`

控制说话节奏的可变性（音素宽度）。效果高度依赖于语音本身，但一般而言值为 0 时去除可变性，值大于 1 会产生极端的口吃和停顿。

### 选项：`max_piper_procs`

同时运行的 Piper 进程数量（默认值为 1）。每个 Piper 进程将一个语音模型加载到 RAM 中，因此同时使用多个语音需要：

- 在使用语音时启动/停止 Piper 进程，或
- 运行更多的 Piper 进程

该插件将为每个请求的语音启动一个 Piper 进程，最多达到 `max_piper_procs`。之后，将停止最近最少使用的语音。
如果您需要在多个语音之间快速切换，请增加 `max_piper_procs`，但请注意这将增加插件的内存使用。

### 选项：`update_voices`

每次插件启动时自动下载新语音列表。您还必须重新加载 Home Assistant 中的 Wyoming 集成才能看到新语音。

### 选项：`debug_logging`

将 DEBUG 级别的消息打印到插件日志中。

## 自定义语音

将自定义语音文件添加到 `/share/piper` 目录。每个自定义语音必须包括一个模型文件 (`<voice>.onnx`) 和配置文件 (`<voice>.onnx.json`)。
有关如何训练和导出自定义语音的详细信息，请参见 [培训指南](https://github.com/rhasspy/piper/blob/master/TRAINING.md)。

## 支持

有问题吗？

您有几种方式可以获得答案：

- [Home Assistant Discord 聊天服务器][discord]。
- Home Assistant [社区论坛][forum]。
- 加入 [/r/homeassistant][reddit] 的 [Reddit 论坛][reddit]。

如果您发现了一个漏洞，请 [在我们的 GitHub 上报告问题][issue]。

[discord]: https://discord.gg/c5DvZ4e
[forum]: https://community.home-assistant.io
[issue]: https://github.com/home-assistant/addons/issues
[reddit]: https://reddit.com/r/homeassistant
[repository]: https://github.com/hassio-addons/repository