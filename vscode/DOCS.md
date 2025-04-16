# Home Assistant 社区插件：Studio Code Server

这个插件运行 [code-server](https://github.com/coder/code-server)，它
让你可以在浏览器中直接体验 Visual Studio Code。它允许你
直接从你的网页浏览器编辑 Home Assistant 配置，直接通过 Home Assistant 前端。

该插件预装了 Home Assistant、MDI 图标和 YAML 扩展，并经过预配置，开箱即用。这意味着自动补全会立即工作，无需配置任何东西。

## 安装

安装此插件相当简单，与安装其他 Home Assistant 插件没有什么不同。

1. 点击下面的 Home Assistant 我的按钮以在您的 Home
   Assistant 实例中打开该插件。

   [![在您的 Home Assistant 实例中打开这个插件。][addon-badge]][addon]

1. 点击“安装”按钮以安装插件。
1. 启动“Studio Code Server”插件。
1. 检查“Studio Code Server”插件的日志，查看是否一切顺利。
1. 点击“打开网页界面”按钮打开 Studio Code Server。

## 配置

**注意**：_当配置发生变化时，请记得重启插件。_

示例插件配置：

```yaml
log_level: info
config_path: /share/my_path
packages:
  - mariadb-client
init_commands:
  - ls -la
```

**注意**：_这只是一个示例，不要复制粘贴！创建你自己的！_

### 选项：`log_level`

`log_level` 选项控制插件的日志输出级别，可以更改为更详细或更简洁，这在处理未知问题时可能会有用。可能值如下：

- `trace`：显示每一个细节，比如所有被调用的内部函数。
- `debug`：显示详细的调试信息。
- `info`：正常（通常）有趣的事件。
- `warning`：不属于错误的例外事件。
- `error`：运行时错误，不需要立即采取措施。
- `fatal`：出现了严重错误。插件变得无法使用。

请注意，每个级别自动包含来自更严重级别的日志消息，例如 `debug` 也会显示 `info` 消息。默认情况下，`log_level` 设置为 `info`，这是推荐的设置，除非您在排除故障。

### 选项：`config_path`

此选项允许您覆盖插件在访问网络界面时打开的默认路径。例如，使用不同的配置目录，如 `/share/myconfig` 而不是 `/config`。如果设置为 `/root`，则 HA 的所有常见文件夹都会作为子文件夹出现。

未配置时，插件将自动使用默认路径：`/config`

### 选项：`packages`

允许您在您的 shell 环境中指定要安装的其他 [Ubuntu 包][ubuntu-packages]（例如，Python、PHP、Go）。

**注意**：_添加许多包会导致插件启动时间更长。_

### 选项：`init_commands`

通过 `init_commands` 选项进一步自定义您的 VSCode 环境。将一个或多个 shell 命令添加到列表中，它们将在每次启动插件时执行。

## 将 VSCode 设置重置为插件默认值

插件会更新您的设置，以优化 Home Assistant 的使用。只要您更改设置，插件就会停止这样做，因为这可能是破坏性的。然而，如果您更改了一些内容，但想要恢复到此插件所提供的默认值，可以执行以下操作：

1. 打开 Visual Studio Code 编辑器。
1. 点击顶部菜单栏中的 `终端`，然后点击 `新终端`。
1. 在终端窗口中执行以下命令：`reset-settings`。
1. 完成！

## 已知问题和限制

- 这个插件可以在 Raspberry Pi 上运行吗？是的，但仅在您运行 64 位操作系统的情况下。同时，见下面的要点。
- 该插件当前仅支持 AMD64 和 aarch64/ARM64 机器。虽然我们支持 ARM 设备，但请注意，这个插件在运行时相当重，并且需要较多的内存。不推荐在内存少于 4Gb 的设备上运行。
- “Visual Studio Code 无法监视这个大工作区中的文件变化”（错误 ENOSPC）

  此问题是由于您的系统没有足够的文件句柄，导致 VSCode 无法监视所有文件。对于 HassOS，目前唯一的选项是在通知出现时点击小齿轮，然后告诉它不再显示。如果您有通用的 Linux 设置（例如，Ubuntu），请遵循 Microsoft 的指南：

  <https://code.visualstudio.com/docs/setup/linux#_visual-studio-code-is-unable-to-watch-for-file-changes-in-this-large-workspace-error-enospc>

## 更新日志与版本发布

该仓库使用 [GitHub 的 releases][releases] 功能维护变更日志。

版本基于 [语义版本控制][semver]，使用 `MAJOR.MINOR.PATCH` 的格式。简而言之，版本会根据以下内容增加：

- `MAJOR`：不兼容或重大变更。
- `MINOR`：向后兼容的新功能和增强。
- `PATCH`：向后兼容的错误修复和包更新。

## 支持

有问题吗？

您有几种选择可以获得答案：

- [Home Assistant 社区插件 Discord 聊天服务器][discord] 用于插件支持和功能请求。
- [Home Assistant Discord 聊天服务器][discord-ha] 用于一般的 Home Assistant 讨论和问题。
- Home Assistant [社区论坛][forum]。
- 加入 [Reddit 子版块][reddit] 在 [/r/homeassistant][reddit]

您还可以在这里 [打开一个问题][issue] GitHub。

## 作者与贡献者

该仓库的最初设置由 [Franck Nijhof][frenck] 完成。

要查看所有作者和贡献者的完整列表，
请查看 [贡献者页面][contributors]。

## 许可证

MIT 许可证

版权 (c) 2019-2025 Franck Nijhof

特此免费授予任何获取此软件及相关文档文件（以下简称“软件”）副本的人在不受限制的情况下处理软件的权利，包括但不限于使用、复制、修改、合并、发布、分发、再许可以及/或出售该软件副本的权利，以及允许向其提供软件的人这样做，须满足以下条件：

以上版权声明和本许可声明应包含在所有副本或实质性部分的软件中。

该软件是按“原样”提供的，不附带任何形式的保证，无论是明示或暗示，包括但不限于对适销性、特定用途适用性和非侵权的保证。在任何情况下，作者或版权持有人均不对因软件或使用或其他交易中产生的任何索赔、损害或其他责任负责，无论是基于合同、侵权行为或其他原因。

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