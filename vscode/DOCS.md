# Home Assistant 社区插件：Studio Code Server

该插件运行 [code-server](https://github.com/coder/code-server)，为您提供直接从浏览器访问的 Visual Studio Code 体验。它允许您直接从网络浏览器，直接在 Home Assistant 前端中编辑您的 Home Assistant 配置。

该插件预先安装和配置了 Home Assistant、MDI 图标和 YAML 扩展。这意味着自动完成可以立即使用，无需任何配置。

## 安装

该插件的安装非常简单，与安装任何其他 Home Assistant 插件没有不同。

1. 点击下面的 Home Assistant 我的按钮，以在您的 Home Assistant 实例中打开该插件。

   [![在您的 Home Assistant 实例中打开此插件。][addon-badge]][addon]

2. 点击“安装”按钮以安装该插件。
3. 启动“Studio Code Server”插件。
4. 检查“Studio Code Server”插件的日志，以查看一切是否顺利。
5. 点击“打开 web 界面”按钮以打开 Studio Code Server。

## 配置

**注意**：_更改配置时，请记得重启插件。_

示例插件配置：

```yaml
log_level: info
config_path: /share/my_path
packages:
  - mariadb-client
init_commands:
  - ls -la
```

**注意**：_这只是一个示例，请不要复制和粘贴！创建您自己的！_

### 选项：`log_level`

`log_level` 选项控制插件的日志输出级别，可以将其更改为更详细或更简洁，在处理未知问题时可能会很有用。可能的值有：

- `trace`：显示每个细节，如所有调用的内部函数。
- `debug`：显示详细的调试信息。
- `info`：正常（通常）有趣的事件。
- `warning`：不是错误的异常情况。
- `error`：不需要立即处理的运行时错误。
- `fatal`：发生严重错误，插件变得不可用。

请注意，每个级别自动包含来自更高严重级别的日志消息，例如，`debug` 还显示 `info` 消息。默认情况下，`log_level` 设置为 `info`，这也是建议的设置，除非您正在进行故障排除。

### 选项：`config_path`

此选项允许您覆盖插件在访问 Web 界面时要打开的默认路径。例如，使用不同的配置目录，如 `/share/myconfig` 而不是 `/config`。如果设置为 `/root`，则 HA 的所有常用文件夹，如 `/config`、`/ssl`、`/share` 等，将作为子文件夹出现在每次访问中。

如果未配置，插件将自动使用默认值：`/config`

### 选项：`packages`

允许您在 shell 环境中指定要安装的额外 [Ubuntu 软件包][ubuntu-packages]（例如，Python、PHP、Go）。

**注意**：_添加许多包将导致插件启动时间变长。_

### 选项：`init_commands`

使用 `init_commands` 选项进一步自定义您的 VSCode 环境。将一个或多个 shell 命令添加到列表中，每次插件启动时都会执行这些命令。

## 重置您的 VSCode 设置为插件默认值

该插件会更新您的设置，以优化与 Home Assistant 的配合使用。一旦您更改了设置，插件将停止这样做，因为这可能是破坏性的。然而，如果您更改了一些内容，但想要恢复为此插件提供的默认设置，请执行以下操作：

1. 打开 Visual Studio Code 编辑器。
2. 点击顶部菜单栏中的 `终端`，然后点击 `新终端`。
3. 在终端窗口中执行以下命令：`reset-settings`。
4. 完成！

## 已知问题和限制

- 此插件可以在树莓派上运行吗？是的，但前提是您运行的是 64 位操作系统。此外，请参见以下要点。
- 该插件目前仅支持 AMD64 和 aarch64/ARM64 机器。虽然我们支持 ARM 设备，但请注意，该插件运行较重，需要相当多的 RAM。我们不建议在内存少于 4GB 的设备上运行。
- “Visual Studio Code 无法监视此大型工作区中的文件更改”（错误 ENOSPC）

  此问题是由于您的系统文件句柄不足，导致 VSCode 无法监视所有文件。对于 HassOS，目前唯一的选项是在通知出现时点击小齿轮，并告知其不再显示。如果您有一个通用的 Linux 设置（例如，Ubuntu），请按照 Microsoft 的指南操作：

  <https://code.visualstudio.com/docs/setup/linux#_visual-studio-code-is-unable-to-watch-for-file-changes-in-this-large-workspace-error-enospc>

## 更新日志与版本

该存储库使用 [GitHub 的发布][releases] 功能保留变更日志。

版本基于 [语义版本控制][semver]，格式为 `MAJOR.MINOR.PATCH`。简而言之，版本将根据以下内容进行递增：

- `MAJOR`：不兼容或重大更改。
- `MINOR`：向后兼容的新功能和增强。
- `PATCH`：向后兼容的错误修复和包更新。

## 支持

有问题吗？

您有几种选择可以获得解答：

- [Home Assistant 社区插件 Discord 聊天服务器][discord]，以获取插件支持和功能请求。
- [Home Assistant Discord 聊天服务器][discord-ha]，进行一般的 Home Assistant 讨论和提问。
- Home Assistant [社区论坛][forum]。
- 加入 [Reddit 板块][reddit] [/r/homeassistant][reddit]

您也可以在这里 [打开一个问题][issue] 提交到 GitHub。

## 作者与贡献者

该存储库的最初设置由 [Franck Nijhof][frenck] 完成。

有关所有作者和贡献者的完整列表，请查看 [贡献者页面][contributors]。

## 许可

MIT 许可证

版权所有 (c) 2019-2025 Franck Nijhof

特此授予任何获得本软件及其相关文档文件（“软件”）副本的人免费使用该软件的权利，并不受限制，包括不限于使用、复制、修改、合并、发布、分发、再授权和/或出售该软件的副本，以及允许向其提供软件的人这样做，但须遵守以下条件：

上述版权声明和本许可声明的副本应包含在所有软件的副本或实质性部分中。

本软件按“原样”提供，不提供任何形式的保证，明示或暗示，包括但不限于适销性、特定用途适用性和非侵权的保证。在任何情况下，作者或版权持有人均不对因使用本软件或与本软件的使用或其他交易相关的任何索赔、损害或其他责任承担责任，无论是在合同、侵权或其他方面。

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