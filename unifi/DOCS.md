# Home Assistant Community Add-on: UniFi Network Application

此附加组件运行Ubiquiti Networks的UniFi Network Application软件，该软件允许您通过网页浏览器管理UniFi网络。此附加组件提供一键安装和运行的解决方案，让用户轻松地启动、运行和更新他们的网络。

## 安装

此附加组件的安装非常简单，与安装任何其他Home Assistant附加组件没有区别。

1. 点击下面的Home Assistant我的按钮，打开您的Home Assistant实例上的附加组件。

   [![在您的Home Assistant实例中打开此附加组件。][addon-badge]][addon]

1. 点击“安装”按钮以安装附加组件。
1. 检查“UniFi网络应用程序”的日志，以查看一切是否正常。
1. 点击“打开WEB UI”按钮，并按照初始向导进行操作。
1. 完成向导后，使用刚刚创建的凭据登录。
1. 转到设置（左下角的齿轮图标）-> 系统 -> 高级。
1. 在“Informat Host”标签旁，勾选“覆盖”选项，使其现在为“已勾选”。
1. 将“Inform的主机”更改为与运行Home Assistant的设备的IP或主机名匹配。
1. 点击“应用更改”按钮以激活设置。
1. 准备就绪！

## 配置

**注意**：_记住在更改配置时重启附加组件。_

示例附加组件配置，包含所有可用选项：

```yaml
log_level: info
memory_max: 2048
memory_init: 512
```

**注意**：_这只是一个示例，不要复制和粘贴！创建您自己的配置！_

### 选项：`log_level`

`log_level`选项控制附加组件的日志输出级别，可以更改为更详细或更简洁的记录，这在您处理未知问题时可能会很有用。可能的值包括：

- `trace`：显示每个细节，如所有调用的内部函数。
- `debug`：显示详细的调试信息。
- `info`：正常（通常）有趣的事件。
- `warning`：不属于错误的异常情况。
- `error`：运行时错误，不需要立即操作。
- `fatal`：出现了严重错误。附加组件变得无法使用。

请注意，每个级别自动包含来自更高严重级别的日志消息，例如，`debug`也显示`info`消息。默认情况下，`log_level`设置为`info`，这是推荐的设置，除非您正在进行故障排除。

### 选项：`memory_max`

此选项允许您更改UniFi Network Application允许消耗的内存量。默认情况下，此限制为256 MB。您可能希望增加这个值，以减少CPU负载，或者减少这个值，以优化您的系统以降低内存使用。

此选项以兆字节的数量为单位，例如，默认值为256。

### 选项：`memory_init`

此选项允许您在启动时更改UniFi Network Application将初始保留/消耗的内存量。默认情况下，此限制为128MB。

此选项以兆字节的数量为单位，例如，默认值为128。

## 自动备份

UniFi Network Application附带自动备份功能。此功能工作正常，但已调整以将创建的备份放在不同的位置。

备份在`/backup/unifi`中创建。您可以使用正常的Home Assistant方法访问此文件夹（例如，使用Samba、终端、SSH）。

## 手动添加设备

除了设置自定义的Inform地址（安装步骤7-9）外，您还可以通过以下步骤手动添加设备：

- 使用`ubnt`作为用户名和`ubnt`作为密码SSH进入设备
- `$ mca-cli`
- `$ set-inform http://<Hassio的IP>:<控制器端口（默认:8080)>/inform`
  - 例如，`$ set-inform http://192.168.1.14:8080/inform`

## 已知问题和限制

- AP似乎卡在“正在添加”状态：请仔细阅读安装说明。您需要更改一些控制器设置，以使此附加组件正常工作。使用Ubiquiti Discovery Tool，或者SSH进入AP并在添加后设置INFORM将解决此问题。（见：_手动添加设备_）
- 日志中可能会出现以下错误，但可以安全忽略：

  ```
    INFO: I/O exception (java.net.ConnectException) caught when processing
    request: Connection refused (Connection refused)
  ```

  这是一个已知问题，但是附加组件正常工作。

- 由于UniFi Network Application软件中的安全策略，目前不可能使用`panel_iframe`将UniFi网页界面添加到您的Home Assistant前端。
- EDU类型AP的广播功能当前无法与此附加组件一起使用。由于Home Assistant的限制，目前无法打开所需的“范围”端口以使此功能正常工作。
- 由于UniFi软件的技术限制，此附加组件无法支持Ingress。
- 在通过Home Assistant进行此附加组件的备份时，此附加组件将临时关闭并在备份完成后启动。这可以防止在备份过程中数据损坏。

## 日志记录 & 发布

该存储库使用[GitHub的发布][releases]功能保持更改日志。日志的格式基于[保持一个更改日志][keepchangelog]。

发布基于[语义版本控制][semver]，并使用`MAJOR.MINOR.PATCH`格式。简而言之，版本将根据以下内容递增：

- `MAJOR`：不兼容或重大更改。
- `MINOR`：向后兼容的新功能和增强。
- `PATCH`：向后兼容的错误修复和软件包更新。

## 支持

有问题？

您有多种选择来获取答案：

- [Home Assistant社区附加组件Discord聊天服务器][discord]以获取附加组件支持和功能请求。
- [Home Assistant Discord聊天服务器][discord-ha]以进行一般的Home Assistant讨论和问题。
- Home Assistant [社区论坛][forum]。
- 加入[Reddit子版块][reddit]在[/r/homeassistant][reddit]

您也可以在这里[提出问题][issue] GitHub。

## 作者 & 贡献者

该存储库的最初设置由[Franck Nijhof][frenck]完成。

有关所有作者和贡献者的完整列表，请查看[贡献者页面][contributors]。

## 许可证

MIT许可证

版权 (c) 2018-2025 Franck Nijhof

在此特此授予任何获得本软件及相关文档文件（“软件”）副本的人无偿使用、复制、修改、合并、出版、分发、再授权和/或出售该软件的权利，并允许向其提供软件的人这样做，条件是包括上述版权声明和本许可声明在所有副本或重要部分中。

该软件按“原样”提供，不提供任何类型的保证，无论是明示还是暗示，包括但不限于对适销性、特定用途适用性和非侵权的保证。在任何情况下，作者或版权持有人均不对因使用或其他交易引起的任何索赔、损害或其他责任负责，无论是在合同、侵权或其他方面。

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