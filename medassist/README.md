# Home assistant 插件: MedAssist

MedAssist 是一个简单的 Node.js 应用，旨在帮助我的伴侣管理日常药物。它使得跟踪药物库存和及时重新订购变得简单，通过发送提醒来实现。如果你不确定是否已服用某个剂量，只需查看仪表盘，并比较预期库存与实际数量，以帮助确认。对于旅行，MedAssist 通过生成所有必要药物的快速列表，减轻旅行期间的压力。

## 功能
如果你定期服用至少一种药物，这个应用可能会对你有帮助。但如果你管理多种药物且有复杂的服药时间表，你可能会更加喜欢它。

- 跟踪药物库存，确切知道何时重新订购
- 当库存不足时接收邮件提醒
- 为旅行生成自定义药物清单，包括所需数量和选择的时间范围（可选发送电子邮件）
- 简单的仪表盘显示药物状态和即将到来的时间表
- 用户友好的网页界面，便于药物管理和配置


_感谢所有给我的仓库点星的人！要点星，请点击下面的图像，然后它将显示在右上方。谢谢！_

[![Stargazers repo roster for @jdeath/homeassistant-addons](https://reporoster.com/stars/jdeath/homeassistant-addons)](https://github.com/jdeath/homeassistant-addons/stargazers)

## 关于

此插件使用了 [docker 镜像](https://github.com/njic/medassist/releases)。

## 安装

此插件的安装非常简单，与安装其他 Hass.io 插件没有区别。

1. [将我的 Hass.io 插件仓库][repository] 添加到你的 Hass.io 实例。
1. 点击 `保存` 按钮以存储你的配置。
1. 启动插件。
1. 检查插件的日志，看看一切是否顺利。
1. 打开 WebUI 应该可以通过 <你的-ip>:端口 访问
1. 设置将在 /addon_configs/2effc9b9_medassist 中找到
## 配置

```
port : 3111 # 你想要运行的端口。
```

Webui 可以在 `<你的-ip>:端口` 找到。

[repository]: https://github.com/jdeath/homeassistant-addons