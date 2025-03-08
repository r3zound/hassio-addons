# Home Assistant 社区插件：日志查看器

轻松地在您的网页浏览器中监控 Home Assistant 日志。提供自定义过滤功能，使您可以轻松区分不同类型的日志。

## 安装

此插件的安装非常简单，与安装其他 Home Assistant 插件没有区别。

1. 点击下面的 Home Assistant 我的按钮以在您的 Home Assistant 实例中打开插件。

   [![在您的 Home Assistant 实例中打开此插件.][addon-badge]][addon]

1. 点击“安装”按钮以安装插件。
1. 查看“日志查看器”插件的日志，以确认一切顺利进行。
1. 打开“日志查看器”插件的网页用户界面以开始查看日志。

**提示：**要查看更多日志，请确保在您的 Home Assistant `configuration.yaml` 中启用 [`logger`][logger] 集成：

```yaml
logger:
  default: info
```

## 配置

**注意**：_记得在更改配置后重启插件。_

插件配置示例：

```yaml
log_level: info
ssl: false
certfile: fullchain.pem
keyfile: privkey.pem
```

**注意**：_这只是一个示例，请不要复制粘贴！创建您自己的！_

### 选项：`log_level`

`log_level` 选项控制插件的日志输出级别，可以更改为更详细或更简洁的输出，您在处理未知问题时可能会发现这很有用。可选值有：

- `trace`：显示每个细节，如所有调用的内部函数。
- `debug`：显示详细的调试信息。
- `info`：正常（通常是）有趣的事件。
- `warning`：不属于错误的特别情况。
- `error`：不需要立即处理的运行时错误。
- `fatal`：出现严重错误，插件变得无法使用。

请注意，每个级别自动包含来自更严重级别的日志消息，例如，`debug` 也会显示 `info` 消息。默认情况下，`log_level` 设置为 `info`，这是推荐的设置，除非您在排查问题。

### 选项：`ssl`

启用/禁用日志查看器上的 SSL。将其设置为 `true` 以启用，`false` 则表示禁用。

**注意**：_SSL 设置仅适用于直接访问，对 Ingress 服务没有影响。_

### 选项：`certfile`

用于 SSL 的证书文件。

**注意**：_文件必须存储在 `/ssl/` 中，这是默认位置_

### 选项：`keyfile`

用于 SSL 的私钥文件。

**注意**：_文件必须存储在 `/ssl/` 中，这是默认位置_

### 选项：`leave_front_door_open`

将此选项添加到插件配置中允许您通过将其设置为 `true` 并将用户名和密码留空来禁用插件的身份验证。

**注意**：_我们强烈建议不要使用此选项，即使此插件仅暴露给您的内部网络。风险自负其责！_

## 更新日志与发布

该存储库使用 [GitHub 的版本][releases] 功能保持更改日志。

发布基于 [语义版本控制][semver]，并使用 `MAJOR.MINOR.PATCH` 的格式。简而言之，版本将根据以下内容进行递增：

- `MAJOR`：不兼容或重大更改。
- `MINOR`：向后兼容的新特性和增强功能。
- `PATCH`：向后兼容的错误修复和包更新。

## 支持

有问题吗？

您有几种方式可以获得解答：

- [Home Assistant 社区插件 Discord 聊天服务器][discord]，用于插件支持和功能请求。
- [Home Assistant Discord 聊天服务器][discord-ha]，用于一般 Home Assistant 讨论和问题。
- Home Assistant [社区论坛][forum]。
- 加入 [Reddit 子版块][reddit] 在 [/r/homeassistant][reddit]

您还可以在这里 [打开一个问题][issue] GitHub。

## 作者与贡献者

该存储库的原始设置由 [Dale Higgs][dale3h] 完成。

有关所有作者和贡献者的完整列表，请查看 [贡献者页面][contributors]。

## 许可证

MIT 许可证

版权所有 (c) 2018-2024 Dale Higgs <@dale3h>

特此免费向任何获得此软件及相关文档文件（“软件”）副本的人授予权利，允许不受限制地处理该软件，包括但不限于使用、复制、修改、合并、发布、分发、再许可和/或销售该软件的副本，并允许被提供软件的人这样做，受以下条件限制：

上述版权声明和本许可声明应包括在软件的所有副本或实质部分中。

软件是“按原样”提供的，没有任何种类的保证，无论是明示还是暗示，包括但不限于对适销性、特定用途适用性和不侵权的保证。在任何情况下，作者或版权持有人对任何索赔、损害或其他责任不承担责任，无论是在合同、侵权或其他方面的行动中，均源于、与软件或软件的使用或其他交易相关。

[addon-badge]: https://my.home-assistant.io/badges/supervisor_addon.svg
[addon]: https://my.home-assistant.io/redirect/supervisor_addon/?addon=a0d7b954_logviewer&repository_url=https%3A%2F%2Fgithub.com%2Fhassio-addons%2Frepository
[contributors]: https://github.com/hassio-addons/addon-log-viewer/graphs/contributors
[dale3h]: https://github.com/dale3h
[discord-ha]: https://discord.gg/c5DvZ4e
[discord]: https://discord.me/hassioaddons
[forum]: https://community.home-assistant.io/t/home-assistant-community-add-on-log-viewer/64377?u=dale3h
[issue]: https://github.com/hassio-addons/addon-log-viewer/issues
[logger]: https://www.home-assistant.io/integrations/logger/
[reddit]: https://reddit.com/r/homeassistant
[releases]: https://github.com/hassio-addons/addon-log-viewer/releases
[semver]: https://semver.org/spec/v2.0.0