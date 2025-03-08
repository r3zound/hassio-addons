# Home Assistant 社区附加组件: chrony

一个可被本地网络上所有主机访问的 NTP 服务器，方便为具有受控互联网访问的设备（如摄像头）设置时间。该附加组件还可以用来设置系统时钟。

## 安装

安装这个附加组件非常简单，与安装其他 Home Assistant 附加组件没有区别。

1. 点击下面的 Home Assistant My 按钮以在你的 Home Assistant 实例中打开该附加组件。

   [![在你的 Home Assistant 实例中打开该附加组件。][addon-badge]][addon]

1. 点击“安装”按钮以安装该附加组件。
1. 启动“chrony”附加组件
1. 检查“chrony”附加组件的日志以查看一切是否正常。

## 配置

**注意**: _记得在更改配置后重启附加组件。_

附加组件配置示例：

```yaml
set_system_clock: true
mode: pool
ntp_pool: pool.ntp.org
ntp_server:
  - 54.39.13.155
  - briareus.schulte.org
```

**注意**: _这只是一个示例，请勿直接复制粘贴！请创建你自己的！_

### 选项: `log_level`

`log_level` 选项控制附加组件的日志输出级别，可以更改为更详细或更简洁的输出，当处理未知问题时，这可能会很有用。可能的值包括：

- `trace`: 显示每个细节，例如所有调用的内部函数。
- `debug`: 显示详细的调试信息。
- `info`: 正常（通常）有趣的事件。
- `warning`: 不是错误的特殊情况。
- `error`: 不需要立即处理的运行时错误。
- `fatal`: 出现了严重错误。附加组件变得不可用。

请注意，每个级别会自动包含更严重级别的日志消息，例如，`debug` 也会显示 `info` 消息。默认情况下，`log_level` 设置为 `info`，这是推荐的设置，除非你正在进行故障排除。

### 选项: `set_system_clock`

`set_system_clock` 选项配置 chrony 设置本地系统时钟。对于某些系统，使用不同的机制设置系统时间可能更可取。

### 选项: `mode`

`mode` 选项配置 chrony 使用 `pool` 或 `server` 模式。这些选项为：

- `pool`: 引用如 pool.ntp.org 的服务器池（推荐）。
- `server`: 引用特定名称或地址的列表。

根据模式来使用 `ntp_pool` 或 `ntp_server` 选项。

### 选项: `ntp_pool`

由池模式使用，配置要使用的池名称，应该是一个具有多个条目的 DNS 记录。应用程序将选择要引用的记录。

### 选项: `ntp_server`

由服务器模式使用，是一个时间源服务器名称或 IP 地址的数组。应用程序将选择要引用的记录。

## 更新日志与发布

该存储库使用 [GitHub 的 releases][releases] 功能保持变更日志。

发布基于 [语义化版本控制][semver]，并使用 `MAJOR.MINOR.PATCH` 的格式。简而言之，版本将根据以下内容进行递增：

- `MAJOR`: 不兼容或重大更改。
- `MINOR`: 向后兼容的新功能和增强。
- `PATCH`: 向后兼容的错误修复和包更新。

## 支持

有问题？

你有几个选项可以获取答案：

- [Home Assistant 社区附加组件 Discord 聊天服务器][discord] 以获取附加组件支持和功能请求。
- [Home Assistant Discord 聊天服务器][discord-ha] 以获取一般的 Home Assistant 讨论和问题。
- Home Assistant [社区论坛][forum]。
- 加入 [/r/homeassistant][reddit] 的 [Reddit 社区][reddit]。

你也可以在这里 [提交问题][issue] GitHub。

## 作者与贡献者

该存储库的最初设置由 [Paul Sinclair][sinclairpaul] 完成。

有关所有作者和贡献者的完整列表，请查看 [贡献者页面][contributors]。

## 许可证

MIT 许可证

版权所有 (c) 2019-2025 Paul Sinclair

特此免费授予任何获得本软件及相关文档文件（“软件”）副本的人，无限制地处理该软件，包括使用、复制、修改、合并、出版、分发、再许可和/或出售该软件副本的权利，并允许向该软件被提供的人这么做，前提是符合以下条件：

上述版权声明和本许可声明应包含在所有副本或软件的所有重要部分中。

该软件按“原样”提供，不提供任何种类的保证，无论是明示或暗示，包括但不限于对适销性、特定用途的适合性和不侵权的保证。在任何情况下，作者或版权持有人均不对因使用该软件或与该软件相关的使用或其他交易而引起的任何索赔、损害或其他责任承担责任，无论是在合同、侵权或其他诉讼中。

[addon-badge]: https://my.home-assistant.io/badges/supervisor_addon.svg
[addon]: https://my.home-assistant.io/redirect/supervisor_addon/?addon=a0d7b954_chrony&repository_url=https%3A%2F%2Fgithub.com%2Fhassio-addons%2Frepository
[contributors]: https://github.com/hassio-addons/addon-chrony/graphs/contributors
[discord-ha]: https://discord.gg/c5DvZ4e
[discord]: https://discord.me/hassioaddons
[forum]: https://community.home-assistant.io/t/community-hass-io-xxxxx/xxxxx
[issue]: https://github.com/hassio-addons/addon-chrony/issues
[reddit]: https://reddit.com/r/homeassistant
[releases]: https://github.com/hassio-addons/addon-chrony/releases
[semver]: http://semver.org/spec/v2.0.0.htm
[sinclairpaul]: https://github.com/sinclairpaul