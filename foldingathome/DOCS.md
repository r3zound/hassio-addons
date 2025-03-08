# Home Assistant 社区插件：Folding@home

Folding@home（FAH 或 F@h）是一个分布式计算项目，用于进行蛋白质动力学的分子动力学模拟。其初步重点是蛋白质折叠，但已转向更多的生物医学问题，如阿尔茨海默病、癌症、埃博拉病毒和冠状病毒。

该项目利用了那些安装了该软件并由志愿者拥有的个人计算机的闲置处理资源。

现在，您可以将您 Home Assistant 实例的闲置时间捐赠给 Folding@home 项目，帮助对抗这些疾病。

加入 Home Assistant Folding@home 团队！(id: 247478)

团队统计：<https://stats.foldingathome.org/team/247478>

## 安装

该插件的安装相当简单，与安装其他 Home Assistant 插件没有什么不同。

1. 点击下面的 Home Assistant My 按钮，以在您的 Home Assistant 实例中打开该插件。

   [![在您的 Home Assistant 实例中打开此插件。][addon-badge]][addon]

1. 点击“安装”按钮以安装该插件。
1. 启动“Folding@home”插件。
1. 检查“Folding@home”的日志，查看一切是否正常。
1. 打开 Web UI。

**注意**：默认情况下，该插件加入 Home Assistant 团队（id: 247478）。

团队统计：<https://stats.foldingathome.org/team/247478>

## 配置

**注意**：_在更改配置时，请记得重新启动插件。_

示例插件配置：

```yaml
log_level: info
```

### 选项：`log_level`

`log_level` 选项控制插件的日志输出级别，可以根据需要更改为更详细或更简洁，这在处理未知问题时可能会有用。可能的值如下：

- `trace`：显示每一个细节，比如所有调用的内部函数。
- `debug`：显示详细的调试信息。
- `info`：正常（通常）有趣的事件。
- `warning`：无错误的异常事件。
- `error`：不需要立即采取行动的运行时错误。
- `fatal`：发生了严重错误，插件变得无法使用。

请注意，每个级别自动包括来自更严重级别的日志消息，例如，`debug` 级别还会显示 `info` 消息。默认情况下，`log_level` 设置为 `info`，这是推荐的设置，除非您在排除故障。

## 嵌入到 Home Assistant

可以将 Folding@home 接口直接嵌入到 Home Assistant 中，允许您通过 Home Assistant 前端访问它。

Home Assistant 提供了 `panel_iframe` 集成，用于这些目的。

示例配置：

```yaml
panel_iframe:
  foldingathome:
    title: Folding@home
    icon: mdi:bacteria-outline
    url: http://addres.to.your.hass.io:7396
```

## 已知问题和限制

- 此插件仅在 64 位英特尔架构的计算机上运行。Folding@home 不支持 ARM 设备（例如，树莓派）。

## 更新日志与版本

该存储库使用 [GitHub 的发布][releases] 功能保持变更日志。

版本基于 [语义版本控制][semver]，使用 `MAJOR.MINOR.PATCH` 格式。简而言之，版本将基于以下内容增加：

- `MAJOR`：不兼容或重大更改。
- `MINOR`：向后兼容的新特性和增强。
- `PATCH`：向后兼容的错误修复和包更新。

## 支持

有问题？

您可以通过多种方式得到答案：

- [Home Assistant 社区插件 Discord 聊天服务器][discord] 以获取插件支持和功能请求。
- [Home Assistant Discord 聊天服务器][discord-ha] 以获取一般 Home Assistant 讨论和问题。
- Home Assistant [社区论坛][forum]。
- 加入 [Reddit 子板块][reddit] 在 [/r/homeassistant][reddit]。

您还可以在这里 [打开问题][issue] GitHub。

## 作者与贡献者

该存储库的最初设置由 [Franck Nijhof][frenck] 完成。

有关所有作者和贡献者的完整列表，请查看 [贡献者页面][contributors]。

## 许可证

MIT 许可证

版权所有 (c) 2020-2024 Franck Nijhof

特此免费授予任何获取该软件及附带文档文件（“软件”）的人员处理该软件的权限，包括不限于使用、复制、修改、合并、出版、分发、再许可和/或出售该软件的副本，并允许向其提供软件的人员这样做，遵循以下条件：

上述版权声明和本许可声明应包含在软件的所有副本或实质性部分中。

该软件是按“原样”提供的，不做任何形式的担保，无论是明示或暗示的，包括但不限于对适销性、特定用途的适用性和不侵权的担保。在任何情况下，作者或版权持有人均不对因使用该软件或与该软件的使用或其他交易有关的任何索赔、损害或其他责任负责，无论是在合同诉讼、侵权或其他方面。

[addon-badge]: https://my.home-assistant.io/badges/supervisor_addon.svg
[addon]: https://my.home-assistant.io/redirect/supervisor_addon/?addon=a0d7b954_foldingathome&repository_url=https%3A%2F%2Fgithub.com%2Fhassio-addons%2Frepository
[contributors]: https://github.com/hassio-addons/addon-foldingathome/graphs/contributors
[discord-ha]: https://discord.gg/c5DvZ4e
[discord]: https://discord.me/hassioaddons
[forum]: https://community.home-assistant.io/t/home-assistant-community-add-on-folding-home/180496?u=frenck
[frenck]: https://github.com/frenck
[issue]: https://github.com/hassio-addons/addon-foldingathome/issues
[reddit]: https://reddit.com/r/homeassistant
[releases]: https://github.com/hassio-addons/addon-foldingathome/releases
[semver]: http://semver.org/spec/v2.0.0.htm