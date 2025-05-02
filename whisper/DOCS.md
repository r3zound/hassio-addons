# Home Assistant 插件：Whisper

## 安装

按照以下步骤在系统上安装插件：

1. 在您的 Home Assistant 前端中导航到 **设置** -> **插件** -> **插件商店**。
2. 找到 "Whisper" 插件并点击。
3. 点击 "安装" 按钮。

## 使用方法

在此插件安装并运行后，它将被 Home Assistant 中的 Wyoming 集成自动发现。要完成设置，请点击以下我的按钮：

[![打开您的 Home Assistant 实例并开始设置新集成。](https://my.home-assistant.io/badges/config_flow_start.svg)](https://my.home-assistant.io/redirect/config_flow_start/?domain=wyoming)

或者，您也可以手动安装 Wyoming 集成，详细信息请参见
[Wyoming 集成文档](https://www.home-assistant.io/integrations/wyoming/)。

## 配置

### 选项：`language`

插件的默认语言。在 Home Assistant 2023.8+中，不同的 [Assist 流水线](https://www.home-assistant.io/voice_control/voice_remote_local_assistant/) 可以同时使用多种语言。

如果选择 "auto"，模型将运行得 **非常** 慢，但会自动检测所说的语言。

[支持语言的性能](https://github.com/openai/whisper#available-models-and-languages)

[两字母语言代码列表](https://en.wikipedia.org/wiki/List_of_ISO_639-1_codes)

### 选项：`model`

将用于转录的 Whisper 模型。选择 `custom` 以使用 `custom_model` 中的模型名称，可以是类似 "Systran/faster-distil-whisper-small.en" 的 HuggingFace 模型 ID。

默认模型为 `auto`，它会为像 Raspberry Pi 4 这样的 ARM 设备选择 `tiny-int8`，否则选择 `base-int8`。
压缩模型（`int8`）的准确性稍低于非压缩模型，但体积更小且速度更快。[蒸馏](https://github.com/huggingface/distil-whisper) 模型是未压缩的，但比它们的非蒸馏模型更快且更小。

可用模型：

- `auto`（根据 CPU 选择）
- `tiny-int8`（压缩）
- `tiny`
- `tiny.en`（仅英文）
- `base-int8`（压缩）
- `base`
- `base.en`（仅英文）
- `small-int8`（压缩）
- `distil-small.en`（蒸馏，仅英文）
- `small`
- `small.en`（仅英文）
- `medium-int8`（压缩）
- `distil-medium.en`（蒸馏，仅英文）
- `medium`
- `medium.en`（仅英文）
- `large`
- `large-v1`
- `distil-large-v2`（蒸馏，仅英文）
- `large-v2`
- `distil-large-v3`（蒸馏，仅英文）
- `large-v3`
- `turbo`（比 `large-v3` 快）

### 选项：`custom_model`

转换过的模型目录的路径，或来自 HuggingFace Hub 的 CTranslate2 转换的 Whisper 模型 ID，如 "Systran/faster-distil-whisper-small.en"。
要使用本地自定义 Whisper 模型，首先在插件的配置目录中创建一个 `models` 子目录（如果尚未存在）。然后将您的模型目录复制到：
`/addon_configs/core_whisper/models/<your-model-dir>`。
然后，将 `custom_model` 的路径设置为：
`/config/models/<your-model-dir>`。对于本地模型，路径必须以 `/config/models/` 开头，因为这就是插件通过容器的挂载卷访问您的 Home Assistant 配置目录的方式。

### 选项：`beam_size`

在转录期间要同时考虑的候选者数量（请参阅 [束搜索](https://en.wikipedia.org/wiki/Beam_search)）。
默认值 `0` 将自动为 ARM 设备（如 Raspberry Pi 4）选择 `1`，否则选择 `5`。

增加束大小将提高准确性，但会降低性能。

### 选项：`initial_prompt`

可以帮助 Whisper 更好地转录不寻常单词的音频描述。
有关示例，请参见 [此讨论](https://github.com/openai/whisper/discussions/963)。

## 备份

Whisper 模型文件可能很大，因此它们会被自动排除在备份之外，并在恢复时重新下载远程模型。
在恢复带有本地自定义 Whisper 模型的备份后，请手动再次复制您的模型目录。

## 支持

有问题吗？

您有几种选择可以获得答案：

- [Home Assistant Discord 聊天服务器][discord]。
- Home Assistant [社区论坛][forum]。
- 加入 [Reddit 子版块][reddit] 在 [/r/homeassistant][reddit]

如果您发现了错误，请 [在我们的 GitHub 上打开一个问题][issue]。

[discord]: https://discord.gg/c5DvZ4e
[forum]: https://community.home-assistant.io
[issue]: https://github.com/home-assistant/addons/issues
[reddit]: https://reddit.com/r/homeassistant
[repository]: https://github.com/hassio-addons/repository