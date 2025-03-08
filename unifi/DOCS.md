# Home Assistant 社区附加组件：UniFi 网络应用程序

此附加组件运行 Ubiquiti Networks 的 UniFi 网络应用程序软件，允许您通过网页浏览器管理您的 UniFi 网络。该附加组件为 Home Assistant 提供了一键安装和运行的解决方案，使用户能够轻松地使其网络启动、运行和更新。

## 安装

此附加组件的安装非常简单，与安装任何其他 Home Assistant 附加组件没有区别。

1. 点击下方的 Home Assistant 我的按钮，以在您的 Home Assistant 实例中打开该附加组件。

   [![在您的 Home Assistant 实例中打开此附加组件。][addon-badge]][addon]

1. 点击“安装”按钮以安装附加组件。
1. 检查“UniFi 网络应用程序”的日志以查看一切是否正常。
1. 点击“打开网页 UI”按钮，并按照初始向导进行操作。
1. 完成向导后，使用刚创建的凭据登录。
1. 进入设置（左下角的齿轮图标） -> 系统 -> 高级。
1. 在 `Inform Host` 标签旁，点击 `Override` 的复选框选项使其现在“已检查”。
1. 将 `Host for Inform` 更改为与运行 Home Assistant 的设备的 IP 或主机名匹配。
1. 点击“应用更改”按钮以激活设置。
1. 准备就绪！

## 配置

**注意**：_记得在更改配置时重启附加组件。_

附加组件配置示例，包含所有可用选项：

```yaml
log_level: info
memory_max: 2048
memory_init: 512
```

**注意**：_这只是一个示例，不要直接复制粘贴！创建您自己的配置！_

### 选项：`log_level`

`log_level` 选项控制附加组件的日志输出级别，可以更改为更详细或更简洁的输出，这在处理未知问题时可能很有用。可选值包括：

- `trace`：显示每个细节，例如所有被调用的内部函数。
- `debug`：显示详细的调试信息。
- `info`：正常（通常）有趣的事件。
- `warning`：不算错误的异常情况。
- `error`：不需要立即处理的运行时错误。
- `fatal`：发生了非常严重的问题。附加组件变得不可用。

请注意，每个级别会自动包含更高严重级别的日志消息，例如，`debug` 也会显示 `info` 消息。默认情况下，`log_level` 设置为 `info`，这是推荐的设置，除非您在进行故障排除。

### 选项：`memory_max`

此选项允许您更改 UniFi 网络应用程序被允许占用的内存量。默认情况下，此限制为 256 MB。您可能希望增加这个值，以减少 CPU 负载，或者减少这个值，以优化系统以实现更低的内存使用。

此选项以 Megabyte 为单位，例如，默认值为 256。

### 选项：`memory_init`

此选项允许您更改 UniFi 网络应用程序在启动时预留/消耗的初始内存量。默认情况下，此限制为 128MB。

此选项以 Megabyte 为单位，例如，默认值为 128。

## 自动备份

UniFi 网络应用程序附带自动备份功能。此功能正常工作，但已调整为将创建的备份放在不同的位置。

备份保存在 `/backup/unifi` 中。您可以使用正常的 Home Assistant 方法访问此文件夹（例如，使用 Samba、终端、SSH）。

## 手动接入设备

除了设置自定义的 inform 地址（安装步骤 7-9），您还可以通过以下步骤手动接入设备：

- 使用 `ubnt` 作为用户名和 `ubnt` 作为密码 SSH 登录设备
- `$ mca-cli`
- `$ set-inform http://<Hassio 的 IP>:<控制器端口（默认：8080）>/inform`
  - 例如 `$ set-inform http://192.168.1.14:8080/inform`

## 已知问题和局限性

- AP 似乎卡在“接入”状态：请仔细阅读安装说明。您需要更改某些控制器设置，以便此附加组件正常工作。使用 Ubiquiti Discovery 工具，或通过 SSH 登录 AP 并在接入后设置 INFORM 将解决此问题。（见：_手动接入设备_）
- 日志中可能会出现以下错误，但可以安全忽略：

  ```
    INFO: 在处理请求时捕获到的 I/O 异常 (java.net.ConnectException): 连接被拒绝 (Connection refused)
  ```

  这是一个已知问题，但附加组件正常运行。

- 由于 UniFi 网络应用程序软件中的安全政策，当前无法使用 `panel_iframe` 将 UniFI 网页界面添加到您的 Home Assistant 前端。
- EDU 类型 AP 的广播功能目前在此附加组件中无法使用。由于 Home Assistant 的限制，当前无法打开此功能所需的“范围”端口。
- 此附加组件由于 UniFi 软件的技术限制无法支持 Ingress。
- 通过 Home Assistant 进行此附加组件的备份时，该附加组件将暂时关闭，并在备份完成后重新启动。这可以防止在备份过程中发生数据损坏。

## 更新日志和版本

此代码库使用 [GitHub 的发布][releases] 功能保留变更日志。日志的格式基于 [保持变更日志][keepchangelog]。

版本基于 [语义化版本控制][semver]，格式为 `MAJOR.MINOR.PATCH`。简而言之，版本根据以下规则递增：

- `MAJOR`：不兼容或重大更改。
- `MINOR`：向后兼容的新功能和增强功能。
- `PATCH`：向后兼容的错误修复和软件包更新。

## 支持

有问题吗？

您有几个选项可以获得答案：

- [Home Assistant 社区附加组件 Discord 聊天服务器][discord] 以获得附加组件支持和功能请求。
- [Home Assistant Discord 聊天服务器][discord-ha] 用于一般的 Home Assistant 讨论和问题。
- Home Assistant [社区论坛][forum]。
- 加入 [Reddit 子论坛][reddit] (/r/homeassistant)[reddit]

您还可以在这里 [打开一个问题][issue] GitHub。

## 作者和贡献者

此代码库的最初设置由 [Franck Nijhof][frenck] 完成。

有关所有作者和贡献者的完整列表，请查看 [贡献者页面][contributors]。

## 许可证

MIT 许可证

版权所有 (c) 2018-2025 Franck Nijhof

特此授权，任何获得此软件及相关文档文件（以下称“软件”）副本的人，可以不受限制地使用、复制、修改、合并、出版、分发、再授权和/或销售该软件副本，并允许向其提供该软件的人这样做，需遵循以下条件：

上述版权声明和本许可声明应包含在所有副本或软件的重大部分中。

该软件按“原样”提供，不提供任何形式的担保，无论明示或暗示，包括但不限于对适销性、特定用途适用性和非侵权的担保。在任何情况下，作者或版权持有者均不对因使用该软件或其他交易而引起的任何索赔、损害或其他责任承担责任，无论是合同诉讼、侵权或其他。

[addon-badge]: https://my.home-assistant.io/badges/supervisor_addon.svg
[addon]: https://my.home-assistant.io/redirect/supervisor_addon/?addon=a0d7b954_unifi&repository_url=https%3A%2F%2Fgithub.com%2Fhassio-addons%2Frepository
[contributors]: https://github.com/hassio-addons/addon-unifi/graphs/contributors
[discord-ha]: https://discord.gg/c5DvZ4e
[discord]: https://discord.me/hassioaddons
[forum]: https://community.home-assistant.io/t/home-assistant-community-add-on-unifi-controller/56297?u=frenck
[frenck]: https://github.com/frenck
[issue]: https://github.com/hassio-addons/addon-unifi/issues
[keepchangelog]: http://keepachangelog.com/en/1.0.0/
[reddit]: https://reddit.com/r/homeassistant
[releases]: https://github.com/hassio-addons/addon-unifi/releases
[semver]: http://semver.org/spec/v2.0.0.htm