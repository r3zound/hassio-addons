# Home Assistant 插件：Google Assistant SDK

> [!CAUTION]
> **弃用通知**
> 本插件所依赖的 [Google Assistant SDK for device][google-assistant-sdk] Python 库
> 已不再开发并已被归档。插件使用的 OAuth 脱带（OOB）流程也已被弃用。
> 因此，当前无法进行新的设置。

一个由 Google 开发的虚拟个人助理。

![支持 aarch64 架构][aarch64-shield] ![支持 amd64 架构][amd64-shield] ![支持 armhf 架构][armhf-shield] ![支持 armv7 架构][armv7-shield] ![支持 i386 架构][i386-shield]

## 关于

[Google Assistant][google-assistant] 是一款基于 AI 技术的语音助手，能够在 Raspberry Pi 和 x86 平台上运行，并通过与 Home Assistant 的 [DialogFlow][dialogflow-integration] 集成进行交互。您还可以使用 [Google Actions][google-actions] 来扩展其功能。

此插件允许您使用连接到运行 Home Assistant 的计算机或设备的麦克风和扬声器访问 Google Assistant。您可以说“Ok Google”后跟您的命令，Google Assistant 将会回复您的请求。

## ℹ️ 将您的手机或 Google/Nest Home 与 Home Assistant 集成

如果您想使用 Google Assistant（例如，从您的手机或 Google Home 设备）与您通过 Home Assistant 管理的设备进行交互，那么您需要 [Google Assistant 集成][google-assistant-integration]。

[amd64-shield]: https://img.shields.io/badge/amd64-yes-green.svg
[armhf-shield]: https://img.shields.io/badge/armhf-no-red.svg
[armv7-shield]: https://img.shields.io/badge/armv7-yes-green.svg
[dialogflow-integration]: https://www.home-assistant.io/integrations/dialogflow/
[google-actions]: https://actions.google.com/
[google-assistant-integration]: https://www.home-assistant.io/integrations/google_assistant/
[google-assistant]: https://assistant.google.com/
[google-assistant-sdk]: https://github.com/googlesamples/assistant-sdk-python
[i386-shield]: https://img.shields.io/badge/i386-no-red.svg
[aarch64-shield]: https://img.shields.io/badge/aarch64-no-red.svg