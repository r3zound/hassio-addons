# Home Assistant Community Add-on: JupyterLab

JupyterLab 是一个开源的 Web 应用程序，允许您创建和共享包含实时代码、方程式、可视化和叙述文本的文档。使用场景包括：数据清理和转换、数值模拟、统计建模、数据可视化、机器学习等。

此插件运行 JupyterLab，这是项目 Jupyter 的下一代用户界面。它是一个可扩展的环境，支持互动和可重复计算，基于 Jupyter Notebook 和架构。

## 安装

此插件的安装非常简单，和安装其他 Home Assistant 插件没有区别。

1. 点击下面的 Home Assistant 我的按钮，在您的 Home Assistant 实例中打开此插件。

   [![在您的 Home Assistant 实例中打开此插件。][addon-badge]][addon]

1. 点击 "安装" 按钮安装插件。
1. 启动 "JupyterLab" 插件
1. 检查 "JupyterLab" 插件的日志，以查看一切是否顺利。

## 配置

**注意**：_记得在更改配置时重启插件。_

插件配置示例：

```yaml
log_level: info
github_access_token: abcdef1234567890abcdef0123456789abcdef01
system_packages:
  - ffmpeg
init_commands:
  - pip install virtualenv
  - pip install yamllint
```

**注意**：_这只是一个示例，请不要直接复制粘贴！自己创建一个！_

### 选项：`log_level`

`log_level` 选项控制插件的日志输出级别，可以更改为更详细或更简单，这在处理中不明问题时可能会很有用。可能的值有：

- `trace`：显示每个细节，如所有调用的内部函数。
- `debug`：显示详细的调试信息。
- `info`：正常（通常）有趣的事件。
- `warning`：异常情况，但不是错误。
- `error`：运行时错误，不需要立即处理。
- `fatal`：出现了严重错误。插件变得不可用。

请注意，每个级别自动包含更高严重级别的日志消息，例如，`debug` 还会显示 `info` 消息。默认情况下，`log_level` 设置为 `info`，这是推荐的设置，除非您在故障排除。

### 选项：`github_access_token`

设置 GitHub 访问令牌。在进行未经身份验证的请求到 GitHub 时（因为我们必须这样做以获取仓库数据），GitHub 对我们可以发出的请求数量施加了相当严格的速率限制。因此，您可能会在几分钟的工作内达到那个限制。

本文档中有一个章节讲述如何获取此类令牌。

**注意**：_此选项支持秘钥，例如 `!secret github_token`。_

### 选项：`system_packages`

允许您指定要安装到 JupyterLab 设置中的其他 [Debian 包][debian-packages]（例如，`g++`、`make`、`ffmpeg`）。

**注意**：_添加很多包会导致插件启动时间更长。_

#### 选项：`init_commands`

使用 `init_commands` 选项进一步自定义您的环境。将一个或多个 shell 命令添加到列表中，它们将在每次此插件启动时执行。

## 获取 GitHub 访问令牌

您可以通过以下步骤获取访问令牌：

1. [验证][github-verify] 您的 GitHub 电子邮件地址。
1. 转到 GitHub 上的账户设置，从左侧面板中选择 "开发者设置"。
1. 在左侧选择 "个人访问令牌"。
1. 点击 "生成新令牌" 按钮，并输入您的密码。
1. 给令牌一个描述，并勾选 "**repo**" 范围框。
1. 点击 "生成令牌"。
1. 您将获得一个字符串，这就是您的访问令牌。

请记住，这个令牌实际上是您 GitHub 账户的密码。_不要_ 在线分享或将令牌检查到版本控制中，因为其他人可以使用它访问您在 GitHub 上的所有数据。

## 更新日志与发布

本仓库使用 [GitHub 的发布][releases] 功能维护更新日志。

发布基于 [语义版本控制][semver]，使用 `MAJOR.MINOR.PATCH` 的格式。简而言之，版本将根据以下内容进行增量：

- `MAJOR`：不兼容或重大更改。
- `MINOR`：向后兼容的新特性和增强。
- `PATCH`：向后兼容的错误修复和包更新。

## 支持

有问题吗？

您有多个选项可以获得答案：

- [Home Assistant Community Add-ons Discord 聊天服务器][discord] 进行插件支持和功能请求。
- [Home Assistant Discord 聊天服务器][discord-ha] 进行一般 Home Assistant 讨论和提问。
- Home Assistant [社区论坛][forum]。
- 加入 [Reddit 子论坛][reddit] 中的 [/r/homeassistant][reddit]。

您也可以在这里 [打开一个问题][issue] GitHub。

## 作者与贡献者

此仓库的原始设置由 [Franck Nijhof][frenck] 完成。

有关所有作者和贡献者的完整列表，请查看 [贡献者页面][contributors]。

## 许可证

MIT 许可证

版权 (c) 2018-2025 Franck Nijhof

特此授予任何获得本软件及相关文档文件（"软件"）副本的人，免费使用、复制、修改、合并、出版、分发、再许可和/或销售本软件的副本，并允许向其提供软件的人这样做，但需遵循以下条件：

上述版权声明和本许可声明应包含在所有副本或重要部分的本软件中。

本软件是 "按原样" 提供的，不附带任何种类的保证，无论是明示或暗示，包括但不限于对适销性、特定用途的适用性和不侵权的保证。在任何情况下，作者或版权持有者均不对因本软件或本软件的使用或其他交易而产生的任何索赔、损害或其他责任承担责任，无论是在合同、侵权或其他方面。

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