# Home Assistant 社区附加组件：TasmoAdmin

TasmoAdmin（前称 SonWEB）是一个管理界面，可用于集中管理所有您的 Sonoff-Tasmota 刷写设备。
它的一些功能包括：

- 扫描您的网络并自动添加设备
- 快速轻松地查看所有设备的状态
- 从一个地方配置所有设备
- 一次性通过无线方式向一个或多个设备发送固件更新
- 可以自动下载最新固件

## 安装

此附加组件的安装过程非常简单，与安装其他任何 Home Assistant 附加组件没有区别。

1. 点击下面的 Home Assistant 我的按钮以打开您的 Home Assistant 实例中的附加组件。

   [![在您的 Home Assistant 实例中打开此附加组件.][addon-badge]][addon]

1. 点击“安装”按钮以安装附加组件。
1. 启动“TasmoAdmin”附加组件。
1. 检查“TasmoAdmin”附加组件的日志以查看一切是否顺利。

## 配置

**注意**：_更改配置时，请记得重启附加组件。_

附加组件配置示例：

```yaml
log_level: info
ssl: false
certfile: fullchain.pem
keyfile: privkey.pem
```

**注意**：_这只是一个示例，请不要复制粘贴！创建您自己的！_

### 选项：`log_level`

`log_level` 选项控制附加组件的日志输出级别，可以更改为更详细或更简略，当您处理未知问题时，这可能很有用。可能的值包括：

- `trace`：显示每一个细节，例如所有调用的内部函数。
- `debug`：显示详细的调试信息。
- `info`：正常（通常）有趣的事件。
- `warning`：非错误的异常情况。
- `error`：不需要立即行动的运行时错误。
- `fatal`：发生了严重错误，附加组件变得不可用。

请注意，每个级别自动包含来自更严重级别的日志消息，例如，`debug` 也显示 `info` 消息。默认情况下，`log_level` 设置为 `info`，这是推荐的设置，除非您正在进行故障排除。

### 选项：`ssl`

启用/禁用 TasmoAdmin 面板的 SSL（HTTPS）功能。设置为 `true` 以启用，设置为 `false` 以禁用。

**注意** Tasmota 不支持通过 SSL 进行 OTA

### 选项：`certfile`

用于 SSL 的证书文件。

**注意**：_该文件必须存储在 `/ssl/` 目录中，这是默认设置_

### 选项：`keyfile`

用于 SSL 的私钥文件。

**注意**：_该文件必须存储在 `/ssl/` 目录中，这是默认设置_

## 更新日志与版本

该仓库使用 [GitHub 的发布][releases] 功能来维护变更日志。

发布基于 [语义版本控制][semver]，格式为 `MAJOR.MINOR.PATCH`。简单来说，版本将根据以下内容进行递增：

- `MAJOR`：不兼容或重大更改。
- `MINOR`：向后兼容的新特性和增强。
- `PATCH`：向后兼容的 bug 修复和包更新。

## 支持

有问题吗？

您有几种方式可以得到答案：

- [Home Assistant 社区附加组件 Discord 聊天服务器][discord] 用于附加组件支持和功能请求。
- [Home Assistant Discord 聊天服务器][discord-ha] 用于一般 Home Assistant 讨论和问题。
- Home Assistant [社区论坛][forum]。
- 加入 [Reddit 子版块][reddit] 在 [/r/homeassistant][reddit]

您还可以在这里 [提交问题][issue] 到 GitHub。

## 作者与贡献者

该仓库的最初设置由 [Franck Nijhof][frenck] 完成。

有关所有作者和贡献者的完整列表，请查看 [贡献页面][contributors]。

## 许可

MIT 许可证

Copyright (c) 2018-2025 Franck Nijhof

特此免费授予任何获得此软件及相关文档文件（“软件”）副本的人，在无需限制的情况下处理软件的权利，包括但不限于使用、复制、修改、合并、出版、分发、再许可和/或销售软件副本，并允许向其提供软件的人这么做，条件如下：

上述版权声明和本许可声明应包含在软件的所有副本或重要部分中。

软件按“原样”提供，不提供任何类型的担保，明示或暗示，包括但不限于对适销性、特定用途的适用性和不侵权的担保。在任何情况下，作者或版权持有人均不对因使用软件或其他事务而产生的任何索赔、损害或其他责任承担责任，无论是在合同、侵权或其他方面。

[addon-badge]: https://my.home-assistant.io/badges/supervisor_addon.svg
[addon]: https://my.home-assistant.io/redirect/supervisor_addon/?addon=a0d7b954_sonweb&repository_url=https%3A%2F%2Fgithub.com%2Fhassio-addons%2Frepository
[contributors]: https://github.com/hassio-addons/addon-tasmoadmin/graphs/contributors
[discord-ha]: https://discord.gg/c5DvZ4e
[discord]: https://discord.me/hassioaddons
[forum]: https://community.home-assistant.io/t/home-assistant-community-add-on-tasmoadmin/54155?u=frenck
[frenck]: https://github.com/frenck
[issue]: https://github.com/hassio-addons/addon-tasmoadmin/issues
[reddit]: https://reddit.com/r/homeassistant
[releases]: https://github.com/hassio-addons/addon-tasmoadmin/releases
[semver]: http://semver.org/spec/v2.0.0.html