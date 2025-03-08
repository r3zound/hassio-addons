# Home Assistant社区附加组件：Studio Code Server

该附加组件运行 [code-server](https://github.com/coder/code-server)，
为您提供来自浏览器的 Visual Studio Code 体验。它允许您直接从您的网页浏览器中编辑 Home Assistant 配置，
直接在 Home Assistant 前端内进行操作。

该附加组件预装和预配置了 Home Assistant、MDI 图标和 YAML 扩展，
这意味着自动完成可以立即使用，无需配置任何内容。

## 安装

该附加组件的安装非常简单，与安装其他任何 Home Assistant 附加组件没有区别。

1. 点击下面的 Home Assistant 我的按钮，以在您的 Home Assistant 实例中打开该附加组件。

   [![在您的 Home Assistant 实例中打开该附加组件。][addon-badge]][addon]

1. 点击“安装”按钮以安装附加组件。
1. 启动“Studio Code Server”附加组件。
1. 检查“Studio Code Server”附加组件的日志以查看是否一切正常。
1. 点击“打开 Web UI”按钮以打开 Studio Code Server。

## 配置

**注意**：_更改配置时请记得重启附加组件。_

示例附加组件配置：

```yaml
log_level: info
config_path: /share/my_path
packages:
  - mariadb-client
init_commands:
  - ls -la
```

**注意**：_这只是一个示例，请不要复制粘贴！请创建您自己的！_

### 选项： `log_level`

`log_level` 选项控制附加组件的日志输出级别，可以更改为更少或更多信息量，这在处理未知问题时可能会很有用。可能的值包括：

- `trace`: 显示每个细节，例如所有调用的内部函数。
- `debug`: 显示详细的调试信息。
- `info`: 正常（通常）有趣的事件。
- `warning`: 不是错误的异常情况。
- `error`: 不需要立即采取行动的运行时错误。
- `fatal`: 某些事情出了严重问题。附加组件变得不可用。

请注意，每个级别自动包含更严重级别的日志消息，例如，`debug` 也会显示 `info` 消息。默认情况下，`log_level` 设置为 `info`，这是推荐设置，除非您在排除故障。

### 选项： `config_path`

此选项允许您覆盖附加组件访问 Web 界面时打开的默认路径。例如，使用不同的配置目录如 `/share/myconfig`，而不是 `/config`。如果设置为 `/root`，那么所有 HA 的常见文件夹，如 `/config`、`/ssl`、`/share` 等，将作为每次访问的子文件夹出现。

未配置时，附加组件将自动使用默认设置：`/config`

### 选项： `packages`

允许您指定要在您的 shell 环境中安装的额外 [Ubuntu 包][ubuntu-packages]（例如，Python、PHP、Go）。

**注意**：_添加多个包将导致附加组件的启动时间更长。_

### 选项： `init_commands`

使用 `init_commands` 选项进一步自定义您的 VSCode 环境。将一个或多个 shell 命令添加到列表中，它们将在每次启动该附加组件时执行。

## 将您的 VSCode 设置重置为附加组件默认值

该附加组件会更新您的设置，以优化与 Home Assistant 的使用。
一旦您更改了某个设置，附加组件将停止执行该操作，因为它可能具有破坏性。然而，如果您更改了一些内容，但想要返回到该附加组件提供的默认值，请执行以下操作：

1. 打开 Visual Studio Code 编辑器。
1. 点击顶部菜单栏中的 `Terminal`，然后点击 `New Terminal`。
1. 在终端窗口中执行以下命令：`reset-settings`。
1. 完成！

## 已知问题和限制

- 这个附加组件可以运行在 Raspberry Pi 上吗？可以，但仅在您运行 64 位操作系统的情况下。另见下面的要点。
- 该附加组件当前仅支持 AMD64 和 aarch64/ARM64 机器。
  尽管我们支持 ARM 设备，但请注意，该附加组件运行起来相当重，并且需要相当多的内存。我们不建议在内存少于 4GB 的设备上运行。
- “Visual Studio Code 无法监视这个大型工作区中的文件更改”（错误 ENOSPC）

  此问题是由于您的系统没有足够的文件句柄，导致 VSCode 无法监视所有文件。对于 HassOS，当前唯一的选项是单击出现通知时的小齿轮并告知其不再显示。如果您有通用 Linux 设置（例如 Ubuntu），请按照 Microsoft 的指南操作：

  <https://code.visualstudio.com/docs/setup/linux#_visual-studio-code-is-unable-to-watch-for-file-changes-in-this-large-workspace-error-enospc>

## 更新日志和版本

该存储库使用 [GitHub 的版本][releases] 功能保留变更日志。

版本基于 [语义版本控制][semver]，并使用 `MAJOR.MINOR.PATCH` 格式。简而言之，版本将根据以下条件递增：

- `MAJOR`：不兼容或重大更改。
- `MINOR`：向后兼容的新功能和增强。
- `PATCH`：向后兼容的错误修复和包更新。

## 支持

有问题吗？

您有几种方式可以得到解答：

- [Home Assistant Community Add-ons Discord 聊天服务器][discord] 以获得附加组件支持和功能请求。
- [Home Assistant Discord 聊天服务器][discord-ha] 进行一般的 Home Assistant 讨论和提问。
- Home Assistant [社区论坛][forum]。
- 加入 [Reddit 社群][reddit] 在 [/r/homeassistant][reddit]

您也可以在这里 [提交问题][issue] GitHub。

## 作者与贡献者

该存储库的最初设置由 [Franck Nijhof][frenck] 完成。

要查看所有作者和贡献者的完整列表，
请访问 [贡献者页面][contributors]。

## 许可

MIT 许可

版权所有 (c) 2019-2025 Franck Nijhof

特此免费授权任何获得本软件及相关文档文件（“软件”）副本的人，限制包括但不限于使用、复制、修改、合并、出版、分发、再授权和/或销售软件副本的权利，并允许向其提供软件的人这样做，条件如下：

上述版权声明和该许可声明应包含在所有副本或软件的实质部分中。

该软件是 “按现状” 提供的，未提供任何类型的保证，无论是明示的还是暗示的，包括但不限于适销性、适合特定目的和非侵权的保证。在任何情况下，作者或版权拥有者均不对因使用或与本软件或其他交易有关而产生的任何索赔、损害或其他责任负责，无论是在合同诉讼、侵权诉讼或其他方面。

[addon-badge]: https://my.home-assistant.io/badges/supervisor_addon.svg
[addon]: https://my.home-assistant.io/redirect/supervisor_addon/?addon=a0d7b954_vscode&repository_url=https%3A%2F%2Fgithub.com%2Fhassio-addons%2Frepository
[contributors]: https://github.com/hassio-addons/addon-vscode/graphs/contributors
[discord-ha]: https://discord.gg/c5DvZ4e
[discord]: https://discord.me/hassioaddons
[forum]: https://community.home-assistant.io/t/home-assistant-community-add-on-visual-studio-code/107863?u=frenck
[frenck]: https://github.com/frenck
[issue]: https://github.com/hassio-addons/addon-vscode/issues
[reddit]: https://reddit.com/r/homeassistant
[releases]: https://github.com/hassio-addons/addon-vscode/releases
[semver]: https://semver.org/spec/v2.0.0
[ubuntu-packages]: https://packages.ubuntu.com