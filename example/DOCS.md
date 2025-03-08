# Home Assistant 社区插件：示例

这是一个 Home Assistant 的示例插件。启动时，它每 5 秒显示一个随机名言。

它展示了几个特性和结构，例如：

- 完整的 GitHub 仓库。
- 一般的 Dockerfile 结构和设置。
- 使用 `config.yaml` 和 `build.yaml` 文件。
- 一般的 Shell 脚本结构 (`run.sh`)。
- 使用 CodeClimate 进行质量保证。
- 使用 GitLab 进行持续集成和部署。
- 使用社区 Home Assistant 插件构建环境。
- 在我们的基础镜像中小规模使用 Bash 函数库。
- 使用 Docker 标签架构。

## 安装

这个插件的安装非常简单，与安装任何其他 Home Assistant 插件没有区别。

1. 点击下面的 Home Assistant 我的按钮，在你的 Home Assistant 实例中打开插件。

   [![在您的 Home Assistant 实例中打开此插件。][addon-badge]][addon]

1. 点击“安装”按钮以安装插件。
1. 启动“示例”插件。
1. 检查“示例”插件的日志，查看其运行情况。

## 配置

尽管该插件只是一个示例插件，它确实有一些配置选项可以让你玩耍。

**注意**：_更改配置后，请记得重启插件。_

示例插件配置：

```yaml
log_level: info
seconds_between_quotes: 5
```

### 选项：`log_level`

`log_level` 选项控制插件的日志输出级别，可以更改为更详细或更简略，这在处理未知问题时可能会很有用。可能的值有：

- `trace`：显示每个细节，如所有被调用的内部函数。
- `debug`：显示详细的调试信息。
- `info`：正常（通常）有趣的事件。
- `warning`：不属于错误的例外情况。
- `error`：不需要立即处理的运行时错误。
- `fatal`：某些事情出了严重的问题。插件变得不可用。

请注意，每个级别自动包含来自更高严重性级别的日志消息，例如，`debug` 还会显示 `info` 消息。默认情况下，`log_level` 设置为 `info`，这是推荐的设置，除非你在进行故障排除。

### 选项：`seconds_between_quotes`

设置每个引号输出之间的秒数。值必须在 `1` 到 `120` 秒之间。默认值设置为 `5` 秒。

## 更新日志与发布

这个仓库使用 [GitHub 的发布][releases] 功能保持更改日志。

发布基于 [语义版本控制][semver]，采用 `MAJOR.MINOR.PATCH` 格式。简而言之，版本将根据以下内容进行递增：

- `MAJOR`：不兼容或重大更改。
- `MINOR`：向后兼容的新功能和增强。
- `PATCH`：向后兼容的错误修复和包更新。

## 支持

有问题吗？

你有几种方式可以获得答案：

- [Home Assistant 社区插件 Discord 聊天服务器][discord] 进行插件支持和功能请求。
- [Home Assistant Discord 聊天服务器][discord-ha] 进行一般 Home Assistant 讨论和问题。
- Home Assistant [社区论坛][forum]。
- 加入 [/r/homeassistant][reddit] 的 [Reddit 子版块][reddit]。

你也可以在这里 [提交问题][issue] 到 GitHub。

## 作者与贡献者

该仓库的初始设置由 [Franck Nijhof][frenck] 完成。

有关所有作者和贡献者的完整列表，请查看 [贡献者页面][contributors]。

## 许可证

MIT 许可证

版权所有 (c) 2017-2025 Franck Nijhof

特此免费授权给任何获取本软件及相关文档文件（以下简称“软件”）的人，允许在不受限制的情况下处理该软件，包括但不限于使用、复制、修改、合并、发布、分发、再授权和/或销售该软件的副本，并允许提供软件的人这样做，遵守以下条件：

上述版权声明和本许可声明应包含在所有副本或软件的实质性部分中。

该软件按“现状”提供，不附有任何种类的保证，无论是明示或暗示的，包括但不限于对适销性、特定用途适用性和不侵权的保证。在任何情况下，作者或版权持有人均不对因使用该软件或软件的其他交易而产生的任何索赔、损害或其他责任负责，无论是在合同、侵权或其他方面。

[addon-badge]: https://my.home-assistant.io/badges/supervisor_addon.svg
[addon]: https://my.home-assistant.io/redirect/supervisor_addon/?addon=a0d7b954_example&repository_url=https%3A%2F%2Fgithub.com%2Fhassio-addons%2Frepository
[contributors]: https://github.com/hassio-addons/addon-example/graphs/contributors
[discord-ha]: https://discord.gg/c5DvZ4e
[discord]: https://discord.me/hassioaddons
[forum]: https://community.home-assistant.io/t/repository-community-hass-io-add-ons/24705?u=frenck
[frenck]: https://github.com/frenck
[issue]: https://github.com/hassio-addons/addon-example/issues
[reddit]: https://reddit.com/r/homeassistant
[releases]: https://github.com/hassio-addons/addon-example/releases
[semver]: http://semver.org/spec/v2.0.0.html