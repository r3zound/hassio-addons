# Home Assistant Community Add-on: JupyterLab

JupyterLab 是一个开源的网络应用程序，它允许您创建和共享包含实时代码、方程、可视化和叙述性文本的文档。用途包括：数据清理和转换、数值仿真、统计建模、数据可视化、机器学习等等。

这个插件运行 JupyterLab，这是 Project Jupyter 的下一代用户界面。它是一个可扩展的环境，适用于互动和可重现的计算，基于 Jupyter Notebook 和架构。

## 安装

安装此插件非常简单，与安装任何其他 Home Assistant 插件没有区别。

1. 点击下面的 Home Assistant 我的按钮以在您的 Home Assistant 实例中打开该插件。

   [![在您的 Home Assistant 实例中打开此插件。][addon-badge]][addon]

1. 点击“安装”按钮以安装插件。
1. 启动“JupyterLab”插件。
1. 检查“JupyterLab”插件的日志，以查看一切是否顺利。

## 配置

**注意**：_记得在配置更改时重启插件。_

示例插件配置：

```yaml
log_level: info
github_access_token: abcdef1234567890abcdef0123456789abcdef01
system_packages:
  - ffmpeg
init_commands:
  - pip install virtualenv
  - pip install yamllint
```

**注意**：_这只是一个示例，请勿复制粘贴！创建您自己的！_

### 选项: `log_level`

`log_level` 选项控制插件的日志输出级别，可以更改为更详细或较少详细，这在处理未知问题时可能会很有用。可能的值包括：

- `trace`: 显示每个细节，如所有调用的内部函数。
- `debug`: 显示详细的调试信息。
- `info`: 正常（通常）有趣的事件。
- `warning`: 不属于错误的例外情况。
- `error`: 运行时错误，不需要立即处理。
- `fatal`: 发生了严重错误。插件变得不可用。

请注意，每个级别自动包含来自更严重级别的日志消息，例如，`debug` 也显示 `info` 消息。默认情况下，`log_level` 设置为 `info`，这是推荐的设置，除非您正在故障排除。

### 选项: `github_access_token`

设置一个 GitHub 访问令牌。在向 GitHub 发起未认证的请求时（因为我们必须这样做以获取仓库数据），GitHub 对我们可以发出的请求数量施加了相当严格的速率限制。因此，您很可能在几分钟的工作内就会达到此限制。

此文档中有一章介绍如何获取此类令牌。

**注意**：_此选项支持秘密，例如 `!secret github_token`。_

### 选项: `system_packages`

允许您指定要安装到 JupyterLab 设置中的其他 [Alpine 包][alpine-packages]（例如 `g++`、`make`、`ffmpeg`）。

**注意**：_添加多个包会导致插件启动时间更长。_

#### 选项: `init_commands`

使用 `init_commands` 选项进一步自定义您的环境。将一个或多个 shell 命令添加到列表中，它们将在每次启动此插件时执行。

## 获取 GitHub 访问令牌

您可以按照以下步骤获取访问令牌：

1. [验证][github-verify]您的电子邮件地址与 GitHub。
1. 转到您在 GitHub 的帐户设置，并从左侧面板中选择“开发者设置”。
1. 在左侧选择“个人访问令牌”。
1. 点击“生成新令牌”按钮，并输入您的密码。
1. 给令牌添加描述，并勾选“**repo**”范围框。
1. 点击“生成令牌”。
1. 您将获得一个字符串，这将是您的访问令牌。

请记住，此令牌实际上是您 GitHub 帐户的密码。_不要_ 在线分享它或将令牌提交到版本控制，因为人们可以使用它访问您在 GitHub 上的所有数据。

## 修改历史与发布

此仓库使用 [GitHub 的发布][releases] 功能保留变更日志。

发布基于 [语义版本控制][semver]，并使用 `MAJOR.MINOR.PATCH` 的格式。简而言之，版本将根据以下内容递增：

- `MAJOR`: 不兼容或重大更改。
- `MINOR`: 向后兼容的新功能和增强。
- `PATCH`: 向后兼容的错误修复和包更新。

## 支持

有问题吗？

您有几种方式可以得到答案：

- [Home Assistant Community Add-ons Discord 聊天服务器][discord] 以获得插件支持和功能请求。
- [Home Assistant Discord 聊天服务器][discord-ha] 用于一般 Home Assistant 的讨论和问题。
- Home Assistant [社区论坛][forum]。
- 加入 [Reddit 子版块][reddit] 在 [/r/homeassistant][reddit]。

您还可以 [在此处打开问题][issue] GitHub。

## 作者与贡献者

此仓库的最初设置由 [Franck Nijhof][frenck] 完成。

要查看所有作者和贡献者的完整列表，请查看 [贡献者页面][contributors]。

## 许可

MIT 许可

版权 (c) 2018-2025 Franck Nijhof

特此免费授予任何获得此软件及相关文档文件（“软件”）副本的人在软件中不受限制地处理，包括不限于使用、复制、修改、合并、出版、分发、再许可和/或出售软件副本的权利，并允许向其提供软件的人这样做，前提是满足以下条件：

上述版权声明和此许可声明应包含在软件的所有副本或实质性部分中。

本软件按“原样”提供，不作任何类型的保证，明示或暗示，包括但不限于对适销性、特定用途适用性和非侵权的保证。在任何情况下，作者或版权持有人对于因软件或软件的使用或其他交易而引起的任何索赔、损害或其他责任均不承担责任，无论是在合同诉讼、侵权或其他方面。

[addon-badge]: https://my.home-assistant.io/badges/supervisor_addon.svg
[addon]: https://my.home-assistant.io/redirect/supervisor_addon/?addon=a0d7b954_jupyterlablite&repository_url=https%3A%2F%2Fgithub.com%2Fhassio-addons%2Frepository
[alpine-packages]: https://pkgs.alpinelinux.org/packages
[contributors]: https://github.com/hassio-addons/addon-jupyterlab/graphs/contributors
[discord-ha]: https://discord.gg/c5DvZ4e
[discord]: https://discord.me/hassioaddons
[forum-shield]: https://img.shields.io/badge/community-forum-brightgreen.svg
[forum]: https://community.home-assistant.io/t/home-assistant-community-add-on-jupyterlab/87337?u=frenck
[frenck]: https://github.com/frenck
[github-verify]: https://help.github.com/articles/verifying-your-email-address
[issue]: https://github.com/hassio-addons/addon-jupyterlab/issues
[python-packages]: https://pypi.org/
[reddit]: https://reddit.com/r/homeassistant
[releases]: https://github.com/hassio-addons/addon-jupyterlab/releases
[semver]: https://semver.org/spec/v2.0.0.html