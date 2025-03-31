# Home Assistant 社区插件：Studio Code Server

此插件运行 [code-server](https://github.com/coder/code-server)，它
为您提供直接从浏览器进行的 Visual Studio Code 体验。它允许您
直接通过网页浏览器编辑您的 Home Assistant 配置，
直接在 Home Assistant 前端中进行。

该插件预装并预配置了 Home Assistant、MDI 图标和 YAML 扩展，
这意味着自动完成立即生效，无需配置任何内容。

## 安装

安装此插件非常简单，与安装其他 Home Assistant 插件没有
不同之处。

1. 点击下面的 Home Assistant 我的按钮以打开您 Home
   Assistant 实例中的插件。

   [![在您的 Home Assistant 实例中打开此插件。][addon-badge]][addon]

1. 点击“安装”按钮以安装插件。
1. 启动“Studio Code Server”插件。
1. 检查“Studio Code Server”插件的日志，以查看一切是否正常。
1. 点击“打开网页界面”按钮以打开 Studio Code Server。

## 配置

**注意**：_记得在更改配置后重启插件。_

示例插件配置：

```yaml
log_level: info
config_path: /share/my_path
packages:
  - mariadb-client
init_commands:
  - ls -la
```

**注意**：_这只是一个示例，请勿直接复制粘贴！创建您自己的！_

### 选项：`log_level`

`log_level` 选项控制插件的日志输出级别，可以更改为更详细或
更少详细，这在处理未知问题时可能非常有用。可能的值有：

- `trace`：显示每个细节，例如所有被调用的内部函数。
- `debug`：显示详细的调试信息。
- `info`：正常（通常）有趣的事件。
- `warning`：不是错误的特殊情况。
- `error`：不需要立即处理的运行时错误。
- `fatal`：发生了严重的错误。插件变得无法使用。

请注意，每个级别会自动包含来自更严重级别的日志消息，例如，
`debug` 也会显示 `info` 消息。默认情况下，`log_level` 设置为
`info`，这是推荐的设置，除非您在故障排除。

### 选项：`config_path`

此选项允许您覆盖访问网页界面时插件将打开的默认路径。
例如，使用不同的配置目录，如 `/share/myconfig` 而不是 `/config`。
如果设置为 `/root`，则 HA 的所有常见文件夹，比如 `/config`、`/ssl`、
`/share` 等，将作为每个访问的子文件夹出现。

未配置时，插件将自动使用默认值：`/config`

### 选项：`packages`

允许您指定要在您的 Shell 环境中安装的附加 [Ubuntu 包][ubuntu-packages] 
（例如，Python、PHP、Go）。

**注意**：_添加很多包会导致插件的启动时间变长。_

### 选项：`init_commands`

通过 `init_commands` 选项，进一步自定义您的 VSCode 环境。
添加一个或多个 Shell 命令到列表中，它们每次此插件启动时都会执行。

## 将您的 VSCode 设置重置为插件默认值

此插件会更新您的设置，以优化与 Home Assistant 一起使用。
一旦您更改了设置，插件将停止执行该操作，因为这可能会造成破坏。
然而，如果您更改了一些内容，但希望返回此插件提供的默认设置，请执行以下操作：

1. 打开 Visual Studio Code 编辑器。
1. 单击顶部菜单栏中的 `终端`，然后单击 `新终端`。
1. 在终端窗口中执行以下命令：`reset-settings`。
1. 完成！

## 已知问题和限制

- 此插件可以在 Raspberry Pi 上运行吗？可以，但仅当您运行 64 位
  操作系统时。此外，请参阅下面的要点。
- 此插件当前仅支持 AMD64 和 aarch64/ARM64 机器。
  尽管支持 ARM 设备，请注意，此插件在运行时需要相当高的
  内存，不推荐在低于 4GB 内存的设备上运行。
- “Visual Studio Code 无法在这个大型工作区中监视文件变化”（错误 ENOSPC）

  此问题是由于您的系统没有足够的文件句柄，导致 VSCode 无法监视
  所有文件。对于 HassOS，目前唯一的选项是在通知出现时点击
  小齿轮并告诉它不要再显示。如果您有一个通用的 Linux 设置（例如
  ，Ubuntu），请按照 Microsoft 的指南：

  <https://code.visualstudio.com/docs/setup/linux#_visual-studio-code-is-unable-to-watch-for-file-changes-in-this-large-workspace-error-enospc>

## 更新日志与版本

此仓库使用 [GitHub 的发布][releases] 功能维护更新日志。

发布基于 [语义版本控制][semver]，使用格式为 `MAJOR.MINOR.PATCH`。简而言之，版本将根据以下内容递增：

- `MAJOR`：不兼容或重大更改。
- `MINOR`：向后兼容的新功能和增强功能。
- `PATCH`：向后兼容的 bug 修复和软件包更新。

## 支持

有问题？

您有几个选项可以得到答案：

- [Home Assistant 社区插件 Discord 聊天服务器][discord] 以获取插件
  支持和功能请求。
- [Home Assistant Discord 聊天服务器][discord-ha] 进行一般 Home
  Assistant 讨论和问题。
- Home Assistant [社区论坛][forum]。
- 加入 [Reddit 版块][reddit] 在 [/r/homeassistant][reddit]

您也可以在这里 [打开问题][issue] GitHub。

## 作者与贡献者

此仓库的原始设置由 [Franck Nijhof][frenck] 完成。

要查看所有作者和贡献者的完整列表，
请查看 [贡献者页面][contributors]。

## 许可证

MIT 许可证

版权 (c) 2019-2025 Franck Nijhof

特此免费授权任何获得该软件及相关文档文件（“软件”）副本的人，
在不受限制的情况下处理软件，包括但不限于使用、复制、修改、合并、
发布、分发、再许可和/或出售软件副本的权利，并允许向其提供软件的人
这样做，遵循以下条件：

上述版权声明和本授权声明应包含在所有软件副本或实质性部分中。

该软件是“按原样”提供的，不提供任何形式的担保，无论明示或暗示，
包括但不限于对适销性、特定用途的适用性和不侵权的担保。在任何情况下，
作者或版权持有者均不对因软件或使用或其他交易引起的任何索赔、损害
或其他责任承担责任，无论是在合同、侵权或其他方面。

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