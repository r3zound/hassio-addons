# Home Assistant Community Add-on: JupyterLab

JupyterLab 是一个开源的 Web 应用程序，允许您创建和分享包含实时代码、方程、可视化和叙述文本的文档。用途包括：数据清洗和转换、数值模拟、统计建模、数据可视化、机器学习等等。

此附加组件运行 JupyterLab，这是 Project Jupyter 的下一代用户界面。它是一个可扩展的环境，用于交互式和可重复的计算，基于 Jupyter Notebook 和架构。

## 安装

此附加组件的安装相当简单，与安装其他 Home Assistant 附加组件没有区别。

1. 点击下面的 Home Assistant 我的按钮，在您的 Home Assistant 实例中打开该附加组件。

   [![在您的 Home Assistant 实例中打开此附加组件。][addon-badge]][addon]

1. 点击“安装”按钮以安装附加组件。
1. 启动“JupyterLab”附加组件。
1. 检查“JupyterLab”附加组件的日志，以查看一切是否顺利。

## 配置

**注意**：_更改配置后请记得重启附加组件。_

附加组件配置示例：

```yaml
log_level: info
github_access_token: abcdef1234567890abcdef0123456789abcdef01
system_packages:
  - ffmpeg
init_commands:
  - pip install virtualenv
  - pip install yamllint
```

**注意**：_这只是一个示例，切勿直接复制粘贴！请创建您自己的！_

### 选项：`log_level`

`log_level` 选项控制附加组件的日志输出级别，可以更改为更详细或更简洁的输出，这在处理未知问题时可能很有用。可能的值包括：

- `trace`：显示每个细节，例如所有被调用的内部函数。
- `debug`：显示详细的调试信息。
- `info`：正常（通常）有趣的事件。
- `warning`：不是错误的异常情况。
- `error`：不需要立即处理的运行时错误。
- `fatal`：发生了严重错误，附加组件变得不可用。

请注意，每个级别自动包括更严重级别的日志消息，例如，`debug` 也显示 `info` 消息。默认情况下，`log_level` 设置为 `info`，这是一种推荐设置，除非您在进行故障排除。

### 选项：`github_access_token`

设置 GitHub 访问令牌。当对 GitHub 进行未认证请求时（就像我们必须获取存储库数据那样），GitHub 对可以发出的请求数量施加了相当严格的速率限制。因此，您可能会在几分钟的工作内达到该限制。

该文档中有一章关于获取此类令牌的说明。

**注意**：_此选项支持秘密，例如，`!secret github_token`。_

### 选项：`system_packages`

允许您指定要安装到您的 JupyterLab 环境中的其他 [Alpine 软件包][alpine-packages]（例如，`g++`、`make`、`ffmpeg`）。

**注意**：_添加多个软件包将导致附加组件的启动时间更长。_

#### 选项：`init_commands`

使用 `init_commands` 选项进一步定制您的环境。将一个或多个 shell 命令添加到列表中，它们将在每次启动此附加组件时执行。

## 获取 GitHub 访问令牌

您可以通过以下步骤获取访问令牌：

1. [验证][github-verify]您的电子邮件地址与 GitHub。
1. 转到 GitHub 上的帐户设置，并在左侧面板中选择“开发者设置”。
1. 在左侧选择“个人访问令牌”。
1. 点击“生成新令牌”按钮，并输入您的密码。
1. 为令牌提供描述，并选中“**repo**”范围框。
1. 点击“生成令牌”。
1. 您将获得一个字符串，这将是您的访问令牌。

请记住，此令牌实际上是您 GitHub 帐户的密码。_请勿_在线分享或将令牌检查到版本控制中，因为其他人可以使用它访问您在 GitHub 上的所有数据。

## 更新日志与发布

此存储库使用 [GitHub 的发布][releases] 功能维护更改日志。

发布基于 [语义版本控制][semver]，使用 `MAJOR.MINOR.PATCH` 的格式。简而言之，版本将根据以下内容进行增量升级：

- `MAJOR`：不兼容或重大更改。
- `MINOR`：向后兼容的新功能和增强。
- `PATCH`：向后兼容的错误修复和软件包更新。

## 支持

有问题吗？

您可以通过几种方式获取答案：

- [Home Assistant Community Add-ons Discord 聊天服务器][discord] 获取附加组件支持和功能请求。
- [Home Assistant Discord 聊天服务器][discord-ha] 进行一般 Home Assistant 讨论和提问。
- Home Assistant [社区论坛][forum]。
- 加入 [Reddit 子论坛][reddit] 在 [/r/homeassistant][reddit]。

您还可以在这里 [开一个问题][issue] GitHub。

## 作者与贡献者

此存储库的原始设置由 [Franck Nijhof][frenck] 完成。

有关所有作者和贡献者的完整列表，
请查看 [贡献者页面][contributors]。

## 许可证

MIT 许可证

版权所有 (c) 2018-2025 Franck Nijhof

特此免费授予任何获得此软件及其相关文档文件（“软件”）副本的人，以不受限制地使用该软件，包括但不限于使用、复制、修改、合并、出版、分发、再授权和/或出售该软件副本的权利，并允许向其提供该软件的人这样做，受以下条件的限制：

上述版权声明和本许可声明应包含在所有副本或该软件的实质性部分中。

该软件是“按原样”提供的，没有任何类型的保证，无论是明示还是暗示，包括但不限于对适销性、特定目的适用性和非侵权的保证。在任何情况下，作者或版权拥有者对因使用该软件或与使用该软件或其他交易的任何索赔、损害或其他责任不承担责任，无论是在合同、侵权或其他方面。

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