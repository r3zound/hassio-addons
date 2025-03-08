# Home Assistant 插件: Whisper

## 安装

按照以下步骤在你的系统上安装插件：

1. 在你的 Home Assistant 前端中导航到 **设置** -> **插件** -> **插件商店**。
2. 找到 "Whisper" 插件并点击它。
3. 点击 "安装" 按钮。

## 如何使用

在安装并运行此插件后，它将被 Home Assistant 中的 Wyoming 集成自动发现。要完成设置，点击以下我的按钮：

[![打开你的 Home Assistant 实例并开始设置新的集成。](https://my.home-assistant.io/badges/config_flow_start.svg)](https://my.home-assistant.io/redirect/config_flow_start/?domain=wyoming)

或者，你可以手动安装 Wyoming 集成，详情请参见
[Wyoming 集成文档](https://www.home-assistant.io/integrations/wyoming/)。

## 配置

### 选项: `language`

插件的默认语言。在 Home Assist 2023.8+ 中，不同的 [Assist 管道](https://www.home-assistant.io/voice_control/voice_remote_local_assistant/) 可以同时使用多种语言。

如果选择 "自动"，模型将运行 **更** 慢，但会自动检测所说的语言。

[支持语言的性能](https://github.com/openai/whisper#available-models-and-languages)

[两字母语言代码列表](https://en.wikipedia.org/wiki/List_of_ISO_639-1_codes)

### 选项: `model`

将用于转录的 Whisper 模型。选择 `custom` 以使用 `custom_model` 中的模型名称，可能是像 "Systran/faster-distil-whisper-small.en" 的 HuggingFace 模型 ID。

默认模型是 `auto`，在像 Raspberry Pi 4 的 ARM 设备上选择 `tiny-int8`，否则选择 `base-int8`。
压缩模型 (`int8`) 的准确性略低于其对应模型，但更小且更快。[Distilled](https://github.com/huggingface/distil-whisper) 模型没有压缩，但比非蒸馏的对应模型更快更小。

可用模型：

- `auto` (根据 CPU 选择)
- `tiny-int8` (压缩)
- `tiny`
- `tiny.en` (仅限英语)
- `base-int8` (压缩)
- `base`
- `base.en` (仅限英语)
- `small-int8` (压缩)
- `distil-small.en` (蒸馏，仅限英语)
- `small`
- `small.en` (仅限英语)
- `medium-int8` (压缩)
- `distil-medium.en` (蒸馏，仅限英语)
- `medium`
- `medium.en` (仅限英语)
- `large`
- `large-v1`
- `distil-large-v2` (蒸馏，仅限英语)
- `large-v2`
- `distil-large-v3` (蒸馏，仅限英语)
- `large-v3`
- `turbo` (比 `large-v3` 更快)

### 选项: `custom_model`

转换模型目录的路径，或来自 HuggingFace Hub 的 CTranslate2 转换的 Whisper 模型 ID，例如 "Systran/faster-distil-whisper-small.en"。

### 选项: `beam_size`

在转录期间同时考虑的候选者数量（参见 [束搜索](https://en.wikipedia.org/wiki/Beam_search)）。
默认值为 `0` 将在像 Raspberry Pi 4 的 ARM 设备上自动选择 `1`，否则选择 `5`。

增加束的大小将提高准确性，但会以性能为代价。

### 选项: `initial_prompt`

音频的描述，可以帮助 Whisper 更好地转录不常见的词汇。
请参考 [此讨论](https://github.com/openai/whisper/discussions/963) 获取示例。

## 备份

Whisper 模型文件可能非常大，因此它们会自动被排除在备份之外。当恢复备份时，模型将被重新下载。

## 支持

有问题吗？

你有几个选项来获得答案：

- [Home Assistant Discord 聊天服务器][discord]。
- Home Assistant [社区论坛][forum]。
- 加入 [Reddit 子版块][reddit] 在 [/r/homeassistant][reddit]。

如果你发现了错误，请 [在我们的 GitHub 上报告](https://github.com/home-assistant/addons/issues)。

[discord]: https://discord.gg/c5DvZ4e
[forum]: https://community.home-assistant.io
[issue]: https://github.com/home-assistant/addons/issues
[reddit]: https://reddit.com/r/homeassistant
[repository]: https://github.com/hassio-addons/repository