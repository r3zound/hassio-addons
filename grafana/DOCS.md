# Home Assistant社区插件：Grafana

用于所有指标的分析平台。

Grafana允许您查询、可视化、警报和理解您的指标，无论它们存储在哪里。创建、探索和分享仪表板。使用引人注目的图形和其他数据可视化来了解您的家庭自动化系统。

将此插件与InfluxDB插件结合使用，以获得您家中极其强大的洞察。

## 安装

该插件的安装相当简单，与安装任何其他Home Assistant插件没有区别。

1. 点击下面的Home Assistant My按钮，以打开您Home Assistant实例中的插件。

   [![在您的Home Assistant实例中打开此插件。][addon-badge]][addon]

2. 点击“安装”按钮以安装插件。
3. 启动“Grafana”插件。
4. 检查“Grafana”的日志以查看一切是否顺利。
5. 打开Web UI。

**注意**：由于该插件现在支持Ingress和直接访问，默认的 `admin` 用户的密码为 `hassio`。**由于实现原因，密码无法更改，但您可以删除并创建新用户，如果这样做，请确保更新 `grafana_ingress_user` 选项。**

## 配置

**注意**：_更改配置时，请记得重启插件。_

示例插件配置：

```yaml
log_level: info
grafana_ingress_user: frenck
plugins:
  - ayoungprogrammer-finance-datasource
  - grafana-clock-panel
env_vars:
  - name: GF_DEFAULT_INSTANCE_NAME
    value: Hassio
```

**注意**：_这只是一个示例，不要复制和粘贴！创建您自己的！_

### 选项：`log_level`

`log_level` 选项控制插件的日志输出级别，可以更改为更多或更少的详细信息，这在处理未知问题时可能非常有用。可能的值包括：

- `trace`：显示每个细节，例如所有调用的内部函数。
- `debug`：显示详细的调试信息。
- `info`：正常（通常）有趣的事件。
- `warning`：非错误的异常事件。
- `error`：不需要立即处理的运行时错误。
- `fatal`：发生了严重错误。插件变得不可用。

请注意，每个级别自动包括来自更严重级别的日志消息，例如，`debug` 还会显示 `info` 消息。默认情况下，`log_level` 设置为 `info`，这是推荐的设置，除非您在排除故障。

### 选项：`grafana_ingress_user`

在使用Ingress时，Grafana默认将使用用户名 `admin` 自动登录。如果需要不同的用户，则可以设置此选项。

### 选项：`plugins`

允许您指定要安装到Grafana设置中的额外Grafana插件。有关可用插件的列表，请参见：

<https://grafana.com/plugins>

**注意**：_添加插件将导致插件启动时间更长。_

### 选项：`custom_plugins`

允许您从URL指定要安装到Grafana设置中的额外Grafana自定义插件。
您必须在插件配置中指定 `url` 属性。

如果要安装未签名的插件，您还必须将 `unsigned` 属性设置为 `true`：

```yaml
custom_plugins:
  - name: my-plugin-name
    url: https://github.com/my-repo/my-plugin-name/releases/download/0.1.0/my-plugin-name-0.1.0.zip
    unsigned: true
```

### 选项：`env_vars`

此选项允许您通过使用环境变量设置配置选项来调整Grafana的每个方面。请查看本章开头的示例以了解配置的样子。

有关使用这些变量的更多信息，请参见官方Grafana文档：

<http://docs.grafana.org/installation/configuration/#using-environment-variables>

**注意**：_仅接受以 `GF_` 开头的环境变量。_

## 与InfluxDB社区插件一起使用

Grafana并未预先配置，但让它与社区[InfluxDB插件][influxdb-addon]进行交互相当简单。请按照有关如何为Home Assistant[创建数据库][create-db]的说明进行操作。

1. 在InfluxDB上为Grafana创建一个新用户
   （InfluxDB管理员 -> 用户和“+ 创建用户”）
2. 登录到Grafana
3. 创建一个新的数据源：

- 名称：您想要的任何名称，例如，Home Assistant
- 类型：InfluxDB
- HTTP > URL: `http://a0d7b954-influxdb:8086`
- HTTP > 访问：服务器（默认）
- 认证：（全部保持未选中）
- InfluxDB详细信息 > 数据库：_您的Home Assistant InfluxDB数据库_，
  例如，`homeassistant`
- InfluxDB详细信息 > 用户：_在步骤1中定义的Grafana InfluxDB用户名_
- InfluxDB详细信息 > 密码：_在步骤1中定义的Grafana InfluxDB用户密码_

4. 点击保存并测试

## 匿名访问

在本地网络上可以通过在插件配置中暴露端口以及设置以下环境变量来实现匿名访问：

```yaml
env_vars:
  - name: GF_AUTH_ANONYMOUS_ENABLED
    value: "true"
  - name: GF_AUTH_ANONYMOUS_ORG_NAME
    value: "Main Org."
  - name: GF_AUTH_ANONYMOUS_ORG_ROLE
    value: "Viewer"
```

使用Home Assistant Cloud无法启用匿名或非管理员访问。这包括在仪表板内嵌入Grafana资源的iframe或渲染图像。有关更多详细信息，请参见[匿名登录不起作用，Grafana插件3.0.0 #55](https://github.com/hassio-addons/addon-grafana/issues/55)。

## 已知问题和限制

- 该插件支持基于ARM的设备，但它们必须至少是ARMv7设备。（不支持Raspberry Pi 1和Zero）。
- `要渲染面板图像，您必须安装Grafana图像渲染器插件。`
  此消息在ARM设备上显示，例如Raspberry Pi。该Grafana图像渲染器插件不适用于这些设备。

## 更新日志和版本

该存储库使用[GitHub的发布][releases]功能保持更新日志。

发布基于[语义版本控制][semver]，并使用`MAJOR.MINOR.PATCH`的格式。简而言之，版本将根据以下内容进行递增：

- `MAJOR`：不兼容或重大更改。
- `MINOR`：向后兼容的新功能和增强。
- `PATCH`：向后兼容的错误修复和软件包更新。

## 支持

有问题？

您有几种选择可以获得答案：

- Home Assistant社区插件Discord聊天服务器[discord]以获取插件支持和功能请求。
- Home Assistant Discord聊天服务器[discord-ha]以进行一般Home Assistant讨论和问题。
- Home Assistant[社区论坛][forum]。
- 加入[Reddit子版块][reddit]的[/r/homeassistant][reddit]。

您还可以在这里[提出问题][issue] GitHub。

## 作者和贡献者

该存储库的初始设置由[Franck Nijhof][frenck]提供。

有关所有作者和贡献者的完整列表，请查看[贡献者页面][contributors]。

## 许可

MIT许可证

版权所有 (c) 2018-2025 Franck Nijhof

特此免费授权任何获得本软件及其相关文档文件（以下简称“软件”）副本的人，未经限制地使用、复制、修改、合并、发布、分发、再授权和/或销售本软件的副本，并允许向其提供本软件的人这样做，前提是满足以下条件：

上述版权声明和本许可声明应包含在所有副本或实质性部分的软件中。

本软件是按“原样”提供的，不对任何形式的担保，包括但不限于适销性、特定用途的适用性和非侵权。作者或版权持有人在任何情况下均不对因使用或其他交易中的软件或本软件而引起的任何索赔、损害或其他责任承担责任，无论是在合同诉讼、侵权或其他情况下。

[addon-badge]: https://my.home-assistant.io/badges/supervisor_addon.svg
[addon]: https://my.home-assistant.io/redirect/supervisor_addon/?addon=a0d7b954_grafana&repository_url=https%3A%2F%2Fgithub.com%2Fhassio-addons%2Frepository
[contributors]: https://github.com/hassio-addons/addon-grafana/graphs/contributors
[create-db]: https://github.com/hassio-addons/addon-influxdb/blob/main/influxdb/DOCS.md#integrating-into-home-assistant
[discord-ha]: https://discord.gg/c5DvZ4e
[discord]: https://discord.me/hassioaddons
[forum]: https://community.home-assistant.io/t/home-assistant-community-add-on-grafana/54674?u=frenck
[frenck]: https://github.com/frenck
[influxdb-addon]: https://github.com/hassio-addons/addon-influxdb
[issue]: https://github.com/hassio-addons/addon-grafana/issues
[reddit]: https://reddit.com/r/homeassistant
[releases]: https://github.com/hassio-addons/addon-grafana/releases
[semver]: https://semver.org/spec/v2.0.0.html