# Home Assistant 插件：语音转短语

## 安装

请按照以下步骤在您的系统上安装插件：

1. 在您的 Home Assistant 前端导航到 **设置** -> **插件** -> **插件商店**。
2. 找到 "语音转短语" 插件并点击它。
3. 点击 "安装" 按钮。

## 如何使用

安装并运行该插件后，它应该会根据您的 [暴露的][] 实体、区域、楼层以及 [句子触发器][sentence trigger] 自动进行训练。如果需要，插件将自动重新训练。

此插件将在 Home Assistant 中被 Wyoming 集成自动发现。要完成设置，请点击以下我的按钮：

[![打开您的 Home Assistant 实例并开始设置新的集成。](https://my.home-assistant.io/badges/config_flow_start.svg)](https://my.home-assistant.io/redirect/config_flow_start/?domain=wyoming)

或者，您可以手动安装 Wyoming 集成，更多信息请查看
[Wyoming 集成文档](https://www.home-assistant.io/integrations/wyoming/)。

### 语音命令

- [英语](https://github.com/OHF-Voice/speech-to-phrase/blob/main/docs/english.md)
- [法语 (Français)](https://github.com/OHF-Voice/speech-to-phrase/blob/main/docs/french.md)
- [德语 (Deutsch)](https://github.com/OHF-Voice/speech-to-phrase/blob/main/docs/german.md)
- [荷兰语 (Nederlands)](https://github.com/OHF-Voice/speech-to-phrase/blob/main/docs/dutch.md)
- [西班牙语 (Español)](https://github.com/OHF-Voice/speech-to-phrase/blob/main/docs/spanish.md)
- [意大利语 (Italiano)](https://github.com/OHF-Voice/speech-to-phrase/blob/main/docs/italian.md)

### 自定义句子

您可以将 [自定义句子][] 添加到 `/share/speech-to-phrase/custom_sentences/<language>/sentences.yaml`，其中 `<language>` 是：

* `en` - 英语
* `fr` - 法语
* `de` - 德语
* `nl` - 荷兰语
* `es` - 西班牙语
* `it` - 意大利语

## 支持

有问题吗？

您有多种选择来获取答案：

- [Home Assistant Discord 聊天服务器][discord]。
- Home Assistant [社区论坛][forum]。
- 加入 [/r/homeassistant][reddit] 的 [Reddit 讨论区][reddit]。

如果您发现了一个错误，请 [在我们的 GitHub 上打开一个问题][issue]。

[discord]: https://discord.gg/c5DvZ4e
[forum]: https://community.home-assistant.io
[issue]: https://github.com/home-assistant/addons/issues
[reddit]: https://reddit.com/r/homeassistant
[repository]: https://github.com/hassio-addons/repository

[sentence trigger]: https://www.home-assistant.io/docs/automation/trigger/#sentence-trigger
[exposed]: https://www.home-assistant.io/voice_control/voice_remote_expose_devices/
[custom sentences]: https://github.com/OHF-voice/speech-to-phrase?tab=readme-ov-file#custom-sentences