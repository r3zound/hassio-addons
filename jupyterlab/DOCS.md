# Home Assistant Community Add-on: JupyterLab

JupyterLab是一个开源Web应用程序，允许您创建和共享包含实时代码、方程式、可视化和叙述文本的文档。用途包括：数据清洗与转换、数值模拟、统计建模、数据可视化、机器学习等。

此附加组件运行JupyterLab，它是Project Jupyter的下一代用户界面。它是一个可扩展的环境，用于交互式和可重复的计算，基于Jupyter笔记本和体系结构。

## 安装

该附加组件的安装过程相当简单，与安装任何其他Home Assistant附加组件没有区别。

1. 点击下面的Home Assistant My按钮，在您的Home Assistant实例中打开该附加组件。

   [![在您的Home Assistant实例中打开此附加组件。][addon-badge]][addon]

1. 点击“安装”按钮以安装附加组件。
1. 启动“JupyterLab”附加组件。
1. 检查“JupyterLab”附加组件的日志，以查看一切是否正常。

## 配置

**注意**：_更改配置时请记得重启附加组件。_

示例附加组件配置：

```yaml
log_level: info
github_access_token: abcdef1234567890abcdef0123456789abcdef01
system_packages:
  - ffmpeg
init_commands:
  - pip install virtualenv
  - pip install yamllint
```

**注意**：_这只是一个示例，不要复制粘贴它！创建您自己的！_

### 选项: `log_level`

`log_level`选项控制附加组件的日志输出级别，可以根据需要调整为更详细或更简洁，尤其在处理未知问题时可能会很有用。可能的值包括：

- `trace`: 显示所有细节，如所有调用的内部函数。
- `debug`: 显示详细的调试信息。
- `info`: 正常（通常）有趣的事件。
- `warning`: 非错误的异常情况。
- `error`: 不需要立即处理的运行时错误。
- `fatal`: 出现了严重错误，附加组件变得不可用。

请注意，每个级别自动包括来自更严重级别的日志消息，例如，`debug`还会显示`info`消息。默认情况下，`log_level`设置为`info`，这是推荐设置，除非您在故障排除中。

### 选项: `github_access_token`

设置一个GitHub访问令牌。当进行未经身份验证的请求到GitHub（因为我们必须这样做以获取仓库数据）时，GitHub对我们可以发出的请求数量施加了相当严格的速率限制。因此，您可能会在几分钟的工作内就遇到该限制。

本文档中有一章说明如何获取这样的令牌。

**注意**：_此选项支持秘密，例如`!secret github_token`。_

### 选项: `system_packages`

允许您指定要安装到JupyterLab设置中的其他[Debian包][debian-packages]（例如，`g++`、`make`、`ffmpeg`）。

**注意**：_添加多个包将导致附加组件的启动时间更长。_

#### 选项: `init_commands`

使用`init_commands`选项进一步自定义您的环境。向列表中添加一个或多个Shell命令，它们将在每次启动此附加组件时执行。

## 获取GitHub访问令牌

您可以按照以下步骤获取访问令牌：

1. [验证][github-verify]您的电子邮件地址与GitHub。
1. 转到您的GitHub帐户设置，在左侧面板中选择“开发者设置”。
1. 在左侧选择“个人访问令牌”。
1. 点击“生成新令牌”按钮，并输入您的密码。
1. 给令牌一个描述，并勾选“**repo**”范围框。
1. 点击“生成令牌”。
1. 系统将给您一个字符串，该字符串将是您的访问令牌。

请记住，此令牌实际上是您GitHub帐户的密码。_不要_在线共享它或将令牌提交到版本控制中，因为其他人可以使用它访问您在GitHub上的所有数据。

## 更新日志 & 发布

此库使用[GitHub的发布][releases]功能保留变更日志。

发布基于[语义版本控制][semver]，并采用`MAJOR.MINOR.PATCH`格式。简而言之，版本将根据以下内容增加：

- `MAJOR`: 不兼容或重大更改。
- `MINOR`: 向后兼容的新功能和增强。
- `PATCH`: 向后兼容的bug修复和包更新。

## 支持

有问题吗？

您有几种选择可以获得答案：

- [Home Assistant Community Add-ons Discord聊天服务器][discord]，用于附加组件支持和功能请求。
- [Home Assistant Discord聊天服务器][discord-ha]，用于一般Home Assistant讨论和问题。
- Home Assistant [社区论坛][forum]。
- 加入[/r/homeassistant][reddit]的[Reddit子版块][reddit]。

您也可以在这里[提交问题][issue]至GitHub。

## 作者与贡献者

此库的最初设置由[Franck Nijhof][frenck]完成。

欲查看所有作者和贡献者的完整列表，请访问[贡献者页面][contributors]。

## 许可证

MIT许可证

版权所有 (c) 2018-2025 Franck Nijhof

特此免费授予任何获得本软件及相关文档文件（“软件”）副本的人，不受限制地处理该软件，包括但不限于使用、复制、修改、合并、出版、分发、再许可和/或销售该软件副本，以及允许受赠人这样做，前提是满足以下条件：

上述版权声明和此许可声明应包含在所有副本或软件的实质部分中。

本软件按“原样”提供，不作任何形式的保证，无论明示或暗示，包括但不限于对适销性、特定用途适用性和非侵权的保证。在任何情况下，作者或版权持有人均不对任何索赔、损害或其他责任负责，无论是在合同诉讼、侵权行为还是其他方面，因本软件或其使用或其他交易而产生。

[addon-badge]: https://my.home-assistant.io/badges/supervisor_addon.svg
[addon]: https://my.home-assistant.io/redirect/supervisor_addon/?addon=a0d7b954_jupyterlablite&repository_url=https%3A%2F%2Fgithub.com%2Fhassio-addons%2Frepository
[debian-packages]: https://www.debian.org/distrib/packages
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