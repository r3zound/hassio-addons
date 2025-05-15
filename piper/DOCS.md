# Home Assistant 插件: Piper

## 安装

按照以下步骤在您的系统上安装该插件：

1. 在 Home Assistant 前端中导航到 **设置** -> **插件** -> **插件商店**。
2. 找到 "Piper" 插件并点击它。
3. 点击 "安装" 按钮。

## 如何使用

安装并运行此插件后，它将被 Home Assistant 中的 Wyoming 集成自动发现。要完成设置，请点击以下我的按钮：

[![打开您的 Home Assistant 实例并开始设置新的集成。](https://my.home-assistant.io/badges/config_flow_start.svg)](https://my.home-assistant.io/redirect/config_flow_start/?domain=wyoming)

另外，您也可以手动安装 Wyoming 集成，更多信息请参见 [Wyoming 集成文档](https://www.home-assistant.io/integrations/wyoming/)。

## 配置

### 选项: `voice`

[收听语音样本](https://rhasspy.github.io/piper-samples/)

要使用的 Piper 语音名称，例如 `en_US-lessac-medium`（默认）。
语音模型会自动从 https://huggingface.co/rhasspy/piper-voices/tree/v1.0.0 下载。

语音名称遵循以下命名方案：`<language>_<REGION>-<name>-<quality>`
`<name>` 部分来自用于训练语音的数据集或提供的发言者名称。

语音的质量分为 4 个不同级别：

- `x_low` - 16Khz，最小/最快
- `low` - 16Khz，快速
- `medium` - 22.05Khz，较慢但音质更好
- `high` - 22.05Khz，最慢但音质最佳

在 Raspberry Pi 4 上，最多可运行至 `medium` 模型且速度可用。如果音频质量不是首要考虑，建议选择 `low` 或 `x-low` 语音，因为它们的速度显著快于 `medium`。

### 选项: `speaker`

如果语音支持多个扬声器，则使用的扬声器编号，例如 [`en-us-libritts-high`](https://rhasspy.github.io/piper-samples/#en-us-libritts-high)。

默认情况下，将使用第一个扬声器（扬声器 0）。

### 选项: `length_scale`

加快或减慢语音速度。值为 1.0 意味着使用语音的默认说话速率，< 1.0 为更快，> 1.0 为更慢。

### 选项: `noise_scale`

通过在音频生成期间添加噪声来控制音频的可变性。效果高度依赖于语音本身，但通常值为 0 去除了可变性，而值大于 1 将开始降低音频质量。

### 选项: `noise_w`

控制说话节奏的可变性（音素宽度）。效果高度依赖于语音本身，但通常值为 0 去除了可变性，而值大于 1 将产生极端的口吃和停顿。

### 选项: `max_piper_procs`

同时运行的 Piper 进程的数量（默认值为 1）。每个 Piper 进程将单个语音模型加载到 RAM 中，因此同时使用多个语音需要：

- 在使用语音时启动/停止 Piper 进程，或
- 运行更多 Piper 进程

此插件将在请求的每个语音上启动一个 Piper 进程，最多到 `max_piper_procs`。之后，将停止使用时间最久的语音。
如果您需要快速在多个语音之间切换，请增加 `max_piper_procs`，但请注意，这将增加插件的内存使用量。

### 选项: `update_voices`

每次插件启动时自动下载新语音列表。您还必须重新加载 Home Assistant 中的 Wyoming 集成以查看新语音。

### 选项: `debug_logging`

将 DEBUG 级别消息打印到插件的日志中。

## 自定义语音

将自定义语音文件添加到 `/share/piper` 目录。每个自定义语音必须包含一个模型文件（`<voice>.onnx`）和一个配置文件（`<voice>.onnx.json`）。
有关如何训练和导出自定义语音的详细信息，请参见 [训练指南](https://github.com/rhasspy/piper/blob/master/TRAINING.md)。

## 支持

有问题吗？

您有几种选择可以获得答案：

- [Home Assistant Discord 聊天服务器][discord]。
- Home Assistant [社区论坛][forum]。
- 加入 [/r/homeassistant][reddit] 的 [Reddit 子论坛][reddit]。

如果您发现了一个错误，请 [在我们的 GitHub 上提交问题][issue]。

[discord]: https://discord.gg/c5DvZ4e
[forum]: https://community.home-assistant.io
[issue]: https://github.com/home-assistant/addons/issues
[reddit]: https://reddit.com/r/homeassistant
[repository]: https://github.com/hassio-addons/repository