# Home Assistant 插件：DHCP 服务器

## 安装

按照以下步骤在您的系统上安装插件：

1. 在您的 Home Assistant 前端中导航至 **设置** -> **插件** -> **插件商店**。
2. 找到 "DHCP 服务器" 插件并点击它。
3. 点击 "安装" 按钮。
4. 根据需要修改配置。

## 如何使用

1. 设置 `domain` 选项，例如 `mynetwork.local`。
2. 点击 "保存" 按钮以保存插件配置。
3. 启动插件。

## 配置

DHCP 服务器插件可以根据您的喜好进行调整。此部分描述插件的每个配置选项。

示例插件配置：

```yaml
domain: mynetwork.local
dns:
  - 8.8.8.8
  - 8.8.4.4
ntp:
  - 192.168.1.0
default_lease: 86400
max_lease: 172800
networks:
  - subnet: 192.168.1.0
    netmask: 255.255.255.0
    range_start: 192.168.1.100
    range_end: 192.168.1.200
    broadcast: 192.168.1.255
    gateway: 192.168.1.1
    interface: end0
hosts:
  - name: webcam_xy
    mac: aa:bb:ee:cc
    ip: 192.168.1.40
```

### 选项：`domain`（必需）

您的网络域名，例如 `mynetwork.local` 或 `home.local`。

### 选项：`dns`（必需）

您的 DHCP 服务器为客户端提供的 DNS 服务器。此选项可以包含服务器列表。默认配置为使用 Google 的公共 DNS 服务器：`"8.8.8.8", "8.8.4.4"`。

### 选项：`ntp`（必需）

您的 DHCP 服务器为客户端提供的 NTP 服务器。此选项可以包含服务器列表。默认情况下，没有配置 ([])

### 选项：`default_lease`（必需）

IP 地址租给客户端的默认时间（以秒为单位）。默认为 `86400`，即一天。

### 选项：`max_lease`（必需）

IP 地址租给客户端的最长时间（以秒为单位）。默认为 `172800`，即两天。

### 选项：`networks`（必需一项）

此选项定义 DHCP 服务器为其分配 IP 地址的一项或多项网络设置。

您的配置中至少需要一个网络定义，才能使 DHCP 服务器正常工作。

#### 选项：`networks.subnet`

您的网络架构/子网。例如，如果您的 IP 地址是 `192.168.1.x`，则子网为 `192.168.1.0`。

#### 选项：`networks.netmask`

您的网络子网掩码。例如，如果您的 IP 地址是 `192.168.1.x`，则子网掩码为 `255.255.255.0`。

#### 选项：`networks.range_start`

定义 DHCP 服务器租用 IP 的起始 IP 地址。与 `range_end` 选项一起使用，以定义 DHCP 服务器操作的 IP 地址范围。

#### 选项：`networks.range_end`

定义 DHCP 服务器租用 IP 的结束 IP 地址。

#### 选项：`networks.broadcast`

租用范围特定的广播地址。例如，如果您的 IP 地址是 `192.168.1.x`，则广播地址通常是 `192.168.1.255`。

#### 选项：`networks.gateway`

设置 DHCP 服务器分配给其客户端的网关地址。通常是您的路由器的 IP 地址。

#### 选项：`networks.interface`

该网络要监听的网络接口，例如 `end0`。

### 选项：`hosts`（可选）

此选项定义 DHCP 服务器的一个或多个主机定义设置。

它允许您将主机固定到特定的 IP 地址。

默认情况下，没有配置任何主机。

#### 选项：`hosts.name`

您希望为其固定地址的主机名。

#### 选项：`hosts.mac`

客户端设备的 MAC 地址。

#### 选项：`hosts.ip`

您希望 DHCP 服务器分配的 IP 地址。

## 支持

有问题吗？

您可以通过多种方式获得答案：

- [Home Assistant Discord 聊天服务器][discord]。
- Home Assistant [社区论坛][forum]。
- 加入 [Reddit 子版块][reddit] 在 [/r/homeassistant][reddit]。

如果您发现了错误，请 [在我们的 GitHub 上打开一个问题][issue]。

[discord]: https://discord.gg/c5DvZ4e
[forum]: https://community.home-assistant.io
[issue]: https://github.com/home-assistant/addons/issues
[reddit]: https://reddit.com/r/homeassistant
[repository]: https://github.com/hassio-addons/repository