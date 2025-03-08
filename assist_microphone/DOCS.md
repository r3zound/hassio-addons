# 助手麦克风

使用 [Assist](https://www.home-assistant.io/voice_control/) 语音助手与 USB 麦克风。例如，一个 USB 网络摄像头。

## 如何使用

安装并运行此附加组件后，它将被 Home Assistant 中的 Wyoming 集成自动发现。要完成设置，请点击以下我的按钮：

[![打开您的 Home Assistant 实例并开始设置新的集成。](https://my.home-assistant.io/badges/config_flow_start.svg)](https://my.home-assistant.io/redirect/config_flow_start/?domain=wyoming)

另外，您也可以手动安装 Wyoming 集成，详细信息请参见 [Wyoming 集成文档](https://www.home-assistant.io/integrations/wyoming/)。

## 配置

### 选项: `awake_wav`

唤醒词被检测时播放的 WAV 文件路径（为空则禁用，默认为 `/usr/src/sounds/awake.wav`）。

### 选项: `done_wav`

当语音命令完成时播放的 WAV 文件路径（为空则禁用，默认为 `/usr/src/sounds/done.wav`）。

### 选项: `timer_finished_wav`

当计时器完成时播放的 WAV 文件路径（为空则禁用，默认为 `/usr/src/sounds/timer_finished.wav`）。

### 选项: `timer_repeat_count`

重复播放 `timer_finished_wav` 的次数（默认为 3）。

### 选项: `timer_repeat_delay`

重复播放 `timer_finished_wav` 前的延迟，以秒为单位（默认为 0.75）。

### 选项: `noise_suppression`

噪音抑制级别（0 为禁用，4 为最大）。默认禁用。

### 选项: `auto_gain`

麦克风的自动音量增强（0 为禁用，31 dbfs 为最大）。默认禁用。

### 选项: `mic_volume_multiplier`

将麦克风音量乘以固定值（1.0 = 无更改，2.0 = 声音加倍）。1.0 为默认值。

### 选项: `sound_enabled`

启用或禁用音频输出。

### 选项: `sound_volume_multiplier`

将声音输出音量乘以固定值（1.0 = 无更改，2.0 = 声音加倍）。1.0 为默认值。

### 选项: `debug_logging`

启用调试日志记录。

## 支持

有问题吗？

您有几种选择可以获取答案：

- [Home Assistant Discord 聊天服务器][discord]。
- Home Assistant [社区论坛][forum]。
- 加入 [/r/homeassistant][reddit] 的 [Reddit 子版块][reddit]。

如果您发现了一个 bug，请 [在我们的 GitHub 上打开一个问题][issue]。

[discord]: https://discord.gg/c5DvZ4e
[forum]: https://community.home-assistant.io
[issue]: https://github.com/home-assistant/addons/issues
[reddit]: https://reddit.com/r/homeassistant
[repository]: https://github.com/hassio-addons/repository