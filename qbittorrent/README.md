# Home Assistant 插件: qbittorrent

[![捐赠][donation-badge]](https://www.buymeacoffee.com/alexbelgium)
[![捐赠][paypal-badge]](https://www.paypal.com/donate/?hosted_button_id=DZFULJZTP3UQA)

![版本](https://img.shields.io/badge/dynamic/json?label=Version&query=%24.version&url=https%3A%2F%2Fraw.githubusercontent.com%2Falexbelgium%2Fhassio-addons%2Fmaster%2Fqbittorrent%2Fconfig.json)
![Ingress](https://img.shields.io/badge/dynamic/json?label=Ingress&query=%24.ingress&url=https%3A%2F%2Fraw.githubusercontent.com%2Falexbelgium%2Fhassio-addons%2Fmaster%2Fqbittorrent%2Fconfig.json)
![架构](https://img.shields.io/badge/dynamic/json?color=success&label=Arch&query=%24.arch&url=https%3A%2F%2Fraw.githubusercontent.com%2Falexbelgium%2Fhassio-addons%2Fmaster%2Fqbittorrent%2Fconfig.json)

[![Codacy Badge](https://app.codacy.com/project/badge/Grade/9c6cf10bdbba45ecb202d7f579b5be0e)](https://www.codacy.com/gh/alexbelgium/hassio-addons/dashboard?utm_source=github.com&utm_medium=referral&utm_content=alexbelgium/hassio-addons&utm_campaign=Badge_Grade)
[![GitHub Super-Linter](https://img.shields.io/github/actions/workflow/status/alexbelgium/hassio-addons/weekly-supelinter.yaml?label=Lint%20code%20base)](https://github.com/alexbelgium/hassio-addons/actions/workflows/weekly-supelinter.yaml)
[![构建器](https://img.shields.io/github/actions/workflow/status/alexbelgium/hassio-addons/onpush_builder.yaml?label=Builder)](https://github.com/alexbelgium/hassio-addons/actions/workflows/onpush_builder.yaml)

[donation-badge]: https://img.shields.io/badge/Buy%20me%20a%20coffee%20(no%20paypal)-%23d32f2f?logo=buy-me-a-coffee&style=flat&logoColor=white
[paypal-badge]: https://img.shields.io/badge/Buy%20me%20a%20coffee%20with%20Paypal-0070BA?logo=paypal&style=flat&logoColor=white

_感谢所有关注我的仓库的人！要关注，请点击下面的图片，然后在右上角点击。谢谢！_

[![Stargazers repo roster for @alexbelgium/hassio-addons](https://raw.githubusercontent.com/alexbelgium/hassio-addons/master/.github/stars2.svg)](https://github.com/alexbelgium/hassio-addons/stargazers)

![下载演变](https://raw.githubusercontent.com/alexbelgium/hassio-addons/master/qbittorrent/stats.png)

## 关于

---

[Qbittorrent](https://github.com/qbittorrent/qBittorrent) 是一个跨平台的免费开源 BitTorrent 客户端。
这个插件基于来自 [linuxserver.io](https://www.linuxserver.io/) 的 Docker 镜像。

这个插件有几个可配置选项：

- 允许从插件挂载本地外部驱动器或 smb 共享
- [替代 webUI](https://github.com/qbittorrent/qBittorrent/wiki/List-of-known-alternate-WebUIs)
- 使用 ssl
- ingress
- 可选的 openvpn 支持
- 允许设置特定的 DNS 服务器

## 配置

---

WebUI 可以在 <http://homeassistant:8080> 找到，或者通过侧边栏使用 Ingress。
默认的用户名/密码：在启动日志中描述。
配置可以通过应用的 webUI 完成，以下选项除外

网络磁盘挂载到 /mnt/share 名称

如果您希望获得最佳速度和连接，您需要在路由器中映射暴露的端口。

```yaml
PGID: user
GPID: user
ssl: true/false
certfile: fullchain.pem # ssl 证书，必须位于 /ssl
keyfile: privkey.pem # ssl 密钥文件，必须位于 /ssl
whitelist: "localhost,192.168.0.0/16" # 输入 `null` 来禁用。列出无需密码的 IP 子网（可选）
customUI: 从列表中选择 # 可在此处设置替代 webUI。每次插件启动时最新版本被设置。选择 'custom' 在 webui 中手动填写
DNS_servers: 8.8.8.8,1.1.1.1 # 保持为空以使用路由器的 DNS，或者设置自定义 DNS，以避免在本地 DNS 广告移除器发生垃圾邮件
SavePath: "/share/qbittorrent" # 定义下载目录
localdisks: sda1 # 将您要挂载的驱动器的硬件名称用逗号分隔放入，或其标签。例：sda1, sdb1, MYNAS...
networkdisks: "//SERVER/SHARE" # 可选，要挂载的 smb 服务器列表，用逗号分隔
cifsusername: "username" # 可选，smb 用户名，对所有 smb 共享相同
cifspassword: "password" # 可选，smb 密码
cifsdomain: "domain" # 可选，允许为 smb 共享设置域
openvpn_enabled: true/false # qbittorrent 启动是否需要 openvpn
openvpn_config: 例如 "config.ovpn" # 位于 /config/openvpn 的文件名。如果为空，将使用随机文件
openvpn_username: 用户名
openvpn_password: 您的密码
openvpn_alt_mode: 在容器级别绑定，而不是应用级别
run_duration: 12h # 插件运行多长时间。必须格式化为数字 + 时间单位（例如：5s，或 2m，或 12h，或 5d...）
silent: true # suppresses debug messages
```

## 安装

---

这个插件的安装非常简单，与安装其他任何插件没有区别。

1. 将我的插件库添加到您的 Home Assistant 实例（在 supervisor 插件商店右上角，或者如果您已经配置了我的 HA，点击下面的按钮）
   [![打开您的 Home Assistant 实例并显示添加插件库对话框，预填特定仓库 URL。](https://my.home-assistant.io/badges/supervisor_add_addon_repository.svg)](https://my.home-assistant.io/redirect/supervisor_add_addon_repository/?repository_url=https%3A%2F%2Fgithub.com%2Falexbelgium%2Fhassio-addons)
2. 安装此插件。
3. 点击 `保存` 按钮以存储您的配置。
4. 根据您的偏好设置插件选项。
5. 启动插件。
6. 检查插件的日志以查看是否一切顺利。
7. 打开 webUI，调整软件选项。

## 与 HA 集成

使用 [qBittorrent 集成](https://www.home-assistant.io/integrations/qbittorrent/)

您可以使用以下代码片段检查和设置备用速度（上面的 HA 集成不需要此项）

```bash
shell_command:
  toggle_torrent_speed: curl -X POST https://<您的 HA IP>:8081/api/v2/transfer/toggleSpeedLimitsMode -k
sensor:
  - platform: command_line
    name: get_torrent_speed
    command: curl https://<您的 HA IP>:8081/api/v2/transfer/speedLimitsMode -k
```

如果您不使用 SSL 选项，可以跳过 -k 参数，并在 URL 中使用 http 代替 https。

这些行将公开一个 `sensor.get_torrent_speed`，每 60 秒更新一次，返回 1 表示已启用备用速度模式，返回 0 表示未启用，以及一个可以在您的自动化中作为服务调用的 `shell_command.toggle_torrent_speed`。

## 常见问题

<details>
  <summary>### openvpn 的 ipv6 问题 (@happycoo)</summary>
将此代码添加到您的 .ovpn 配置中

```bash
# 不通过 vpn 路由 lan
route 192.168.1.0 255.255.255.0 net_gateway

# 禁用 ipv6
pull-filter ignore "dhcp-option DNS6"
pull-filter ignore "tun-ipv6"
pull-filter ignore "ifconfig-ipv6"
```
</details>

<details>
  <summary>### 监视文件夹 (@FaliseDotCom)</summary>

- 转到 config\addons_config\qBittorrent
- 找到 (或创建) 文件 watched_folders.json
- 粘贴或调整如下内容：

```json
{
    "folder/to/watch": {
        "add_torrent_params": {
            "category": "",
            "content_layout": "Original",
            "download_limit": -1,
            "download_path": "[folder/for/INCOMPLETE_downloads]",
            "operating_mode": "AutoManaged",
            "ratio_limit": -2,
            "save_path": "[folder/for/COMPLETED_downloads]",
            "seeding_time_limit": -2,
            "skip_checking": false,
            "stopped": false,
            "tags": [
            ],
            "upload_limit": -1,
            "use_auto_tmm": false,
            "use_download_path": true
        },
        "recursive": false
    }
}
```
</details>

<details>
  <summary>### nginx 错误代码 (@Nanianmichaels)</summary>

> [cont-init.d] 30-nginx.sh: 执行中...
> [cont-init.d] 30-nginx.sh: 退出 1。

等待几分钟并重启插件，这可能是 github 的临时不可用。

### 带无效参数的本地挂载 (@antonio1475)

> [cont-init.d] 00-local_mounts.sh: 执行中...
> 本地驱动器挂载...
> mount: mounting /dev/sda1 on /mnt/sda1 failed: 无效参数
> [19:19:44] 致命错误: 无法挂载本地驱动器！请检查名称。
> [cont-init.d] 00-local_mounts.sh: 退出 0。

尝试将分区标签放入 "localdisks" 选项中，而不是硬件名称。
</details>

<details>
  <summary>### openvpn 使用几天后元数据获取丢失 (@almico)</summary>

在您的 config.ovpn 中添加 `ping-restart 60`。
</details>

<details>
  <summary>### 小窗口中下载信息为空 (@aviadlevy)</summary>

当我的窗口宽度小于 960 像素时，我的下载信息为空。
解决方法是重置 Vuetorrent 设置。
</details>

## 支持

在 GitHub 创建一个问题，或在 [Home Assistant 论坛](https://community.home-assistant.io/t/home-assistant-addon-qbittorrent/279247) 上询问。

---

![插图](https://raw.githubusercontent.com/alexbelgium/hassio-addons/master/qbittorrent/illustration.png)