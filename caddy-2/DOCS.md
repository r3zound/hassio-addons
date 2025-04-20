# Home Assistant 插件：Caddy 2

Caddy 2 是一个现代的、强大的、企业级开源Web服务器，旨在简化、安全和灵活。它的独特之处在于能够默认自动管理HTTPS，而无需复杂的配置。

## 目录

1. [插件安装](#插件安装)
2. [基本设置示例](#基本设置示例)
3. [配置选项](#配置选项)
4. [高级用法：自定义二进制文件和插件](#高级用法自定义二进制文件和插件)

## 插件安装

要安装 Caddy 2 插件，首先通过输入以下 URL 将库添加到您的 [Hass.io](https://home-assistant.io/hassio/) 实例：

`https://github.com/einschmidt/hassio-addons`

如果遇到任何问题，请参考 [官方文档](https://home-assistant.io/hassio/installing_third_party_addons/) 获取指导。

添加库后，搜索并安装 "Caddy 2" 插件。

## 基本设置示例

Caddy 2 插件提供多种设置方法，以适应不同的环境和网络配置。这些设置从简单到复杂不等，允许您选择符合需求的自定义级别。

### 默认代理服务器设置（简单）

默认情况下，Caddy 2 作为 Home Assistant 的代理服务器运行，无需 `Caddyfile`。它使用在插件设置中提供的配置，并自动为您处理HTTPS。

**注意**：如果在配置目录中找到 `Caddyfile`，将忽略 `non_caddyfile_config` 设置，而以 Caddyfile 为准。

#### 示例配置

**重要**：_在更改配置后，始终重新启动插件。_

对于基本的代理设置，将 `yourdomain.com` 转发到 Home Assistant，使用以下示例（无 `Caddyfile`）：

```yaml
non_caddyfile_config:
  email: your@email.com
  domain: yourdomain.com
  destination: localhost
  port: 8123
log_level: info
args: []
env_vars: []
```

**注意**：_这些示例仅供参考。根据您的需求进行自定义。_

### Caddyfile 设置（中级）

对于更高级的自定义，您可以创建并使用 Caddyfile 来定义代理服务器的配置。这允许您对路由、头部和SSL管理等设置有更大的控制。

要使用 Caddyfile，请将文件放置在插件配置目录中。您可以使用 [SSH][ssh] 或 [Samba][samba] 插件来访问此目录。插件只会在这个特定位置查找 Caddyfile。

#### 插件配置目录

Caddyfile 需要放置在插件的配置目录中，该目录位于：

```
/addon_configs/c80c7555_caddy-2
```

##### 访问配置目录

SSH：您可以通过SSH导航到 `/addon_configs/` 来访问配置目录。

Samba：或者，使用 Samba 插件，您可以通过网络访问此文件夹作为共享目录。查找 `addon_configs` 文件夹并找到相应的目录。

#### 管理证书

Caddy 2 可以自动生成SSL证书。如果您想使用其他插件（例如 Let’s Encrypt 插件）的证书，可以将它们放置在 `/ssl` 目录中。Caddy 2 插件将可以访问此文件夹，从而允许您使用外部证书或为其他服务创建证书。

#### 示例 Caddyfile

一个简单的 Caddyfile，用于将流量代理到 Home Assistant 安装可能如下所示：

```
{
  email your@email.com
}

yourdomain.com {
  reverse_proxy localhost:8123
}
```

有关更高级的配置，请参考 [Caddyfile 文档](https://caddyserver.com/docs/caddyfile)。

#### Caddyfile 示例配置

**重要**：_更改配置后重新启动插件。_

要指示插件使用和监视 `Caddyfile`，您的配置应如下所示：

```yaml
non_caddyfile_config: {}
log_level: info
args:
  - "--watch"
env_vars: []
```

**注意**：_根据您的特定设置自定义此示例。_

### 自定义 Caddy 二进制文件设置（高级）

对于高级用户，您可以用自定义的 Caddy 二进制文件替换默认的 Caddy 二进制文件。将您的 `caddy` 二进制文件放置在 [插件配置目录](#插件配置目录) 中，使用 [SSH][ssh] 或 [Samba][samba]。插件将使用在此文件夹中找到的二进制文件。

#### 示例配置

**重要**：_在任何配置更改后重新启动插件。_

以下是一个使用自定义 Caddy 二进制文件和 `Caddyfile` 的示例配置，启用自动更新和格式化：

```yaml
non_caddyfile_config: {}
log_level: info
args:
  - "--watch"
env_vars: []
caddy_upgrade: true
caddy_fmt: true
```

**注意**：_这些示例仅供参考。根据您的设置进行调整。_

## 配置选项

### 选项： `non_caddyfile_config.email`

定义用于与您的证书颁发机构（CA）创建ACME账户时使用的电子邮件地址。推荐使用它来帮助管理证书，以防出现问题。

**注意**：此选项仅用于默认反向代理设置。一旦在配置目录中找到 `Caddyfile`，将被忽略。

### 选项： `non_caddyfile_config.domain`

指定您的设置的域名。

**注意**：此选项仅适用于默认反向代理设置，如果配置目录中存在一个 `Caddyfile` ，将被忽略。

### 选项： `non_caddyfile_config.destination`

设置反向代理的上游地址。通常，对于大多数设置，`localhost` 就足够了。要针对特定地址，您可以将 IPv4 使用 `127.0.0.1` 或 IPv6 使用 `::1`。

**注意**：此选项仅用于默认反向代理设置，如果在配置目录中找到 `Caddyfile` 将被忽略。

### 选项： `non_caddyfile_config.port`

定义上游地址的端口。例如，Home Assistant 通常使用端口 `8123`。

**注意**：此设置仅应用于默认反向代理配置。如果配置目录中存在 `Caddyfile` 将被忽略。

### 选项： `caddy_upgrade`

启用自定义 Caddy 二进制文件及其插件的自动升级。将此选项设置为 `true` 以允许更新，或设置为 `false` 以禁用。默认值为 `false`。

**注意**：此功能仅适用于自定义二进制文件（Caddy 版本 2.4 或更高版本），如果使用默认 Caddy 二进制文件则不需要。

### 选项： `caddy_fmt`

启用对 `Caddyfile` 的自动格式化和美化。将此选项设置为 `true` 以启用格式化，或 `false` 以禁用。默认情况下，禁用。

**注意**：此功能需要有效的 `Caddyfile` 才能正常工作。

### 选项： `args`

允许您为 Caddy 2 指定额外的命令行参数。将一个或多个参数添加到列表中，它们将在每次插件启动时执行。

**注意**： `--config` 参数自动添加。如需更多信息，请参考官方 [Caddy 文档](https://caddyserver.com/docs/command-line#caddy-run)。

### 选项： `env_vars`

允许您定义多个环境变量，通常用于自定义 Caddy 二进制文件构建。这些变量可以按以下格式设置：

示例：

```yaml
env_vars:
  - name: NAMECHEAP_API_USER
    value: xxxx
  - name: NAMECHEAP_API_KEY
    value: xxxx
```

### 选项： `env_vars.name`

指定环境变量的名称。

### 选项： `env_vars.value`

指定分配给环境变量的值。

### 选项： `log_level`

控制插件的日志输出的详细程度。此设置对于调试或监视插件的行为非常有用。可用的日志级别有：

- `trace`：显示详细信息，包括所有内部函数调用。
- `debug`：提供广泛的调试信息。
- `info`：显示典型事件和信息。
- `warning`：记录意外情况但不是错误。
- `error`：记录运行时错误，但不需要立即采取行动。
- `fatal`：使插件无法使用的严重错误。

每个级别包括更严重级别的消息。例如，`debug` 还包括 `info` 消息。默认设置为 `info`，建议在故障排除时使用。

## 高级用法：自定义二进制文件和插件

### 概述

此插件使用单个二进制文件启动 Caddy，这使其具有高度可定制性。您可以运行具有所需版本和插件的自定义 Caddy 构建，为高级用户提供最大灵活性。

### 自定义 Caddy 二进制文件

要构建您自己的 Caddy 版本，包括特定插件或特性，您可以按照官方 Caddy 文档中的说明使用 [`xcaddy` 工具](https://caddyserver.com/docs/build#xcaddy)。这允许您编译自己的 Caddy 版本，使用在默认二进制文件中未包含的自定义模块或插件。

### 安装自定义二进制文件

要使用自定义构建的 Caddy 二进制文件，请按照以下步骤操作：

1. 使用 `xcaddy` 构建您的自定义 Caddy 二进制文件或获取适合您需求的预构建版本。
2. 将 `caddy` 二进制文件放入插件配置文件夹中。
3. 重新启动 Caddy 2 插件以开始使用您自定义版本的 Caddy。

#### 访问配置文件夹

插件配置文件夹可以在以下位置找到：

```
/addon_configs/c80c7555_caddy-2
```

这是您应放置自定义 `caddy` 二进制文件和任何相关配置文件的地方。

一旦插件重启，Caddy 将使用您提供的自定义二进制文件，从而允许您利用任何包含在自定义构建中的额外功能或插件。

[ssh]: https://home-assistant.io/addons/ssh/
[samba]: https://home-assistant.io/addons/samba/