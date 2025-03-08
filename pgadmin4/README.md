![项目阶段][project-stage-shield]
![维护][maintenance-shield]
[![许可证][license-shield]](https://github.com/expaso/hassos-addon-pgadmin4/blob/main/LICENSE)

# Home Assistant 插件: [pgAdmin 4](https://www.pgadmin.org/)

<a href="https://www.buymeacoffee.com/expaso" target="_blank"><img src="https://cdn.buymeacoffee.com/buttons/default-orange.png" alt="请我喝咖啡" height="41" width="174"></a>

## 介绍

pgAdmin 是最流行且功能最丰富的开源 PostgreSQL 管理与开发平台，它是全球最先进的开源数据库。

此插件可用于控制您网络上的任何 PostgreSQL 数据库，包括使用 TimescaleDB 插件提供的数据库，该插件也可以从同一插件库中安装。

## 配置

示例插件配置：

```
 {
    "ssl": true,
    "certfile": "fullchain.pem",
    "keyfile": "privkey.pem",
    "system_packages": [],
    "init_commands": [],
    "leave_front_door_open": false
 }
```

### 选项: `ssl`

指示插件 UI 将从端口 80 或端口 443（使用提供的证书）提供服务。

### 选项: `certfile`

`ssl` 文件夹中您的 SSL 证书的文件名。

### 选项: `keyfile`

`ssl` 文件夹中您的私钥文件的文件名。

### 选项: `system_packages`

在插件启动期间将安装的可选额外 Alpine 软件包。
**注意**：添加大量软件包可能导致启动时间较长。

### 选项: `init_commands`

在插件启动期间将运行的任何额外命令。

### 选项: `leave_front_door_open`

在没有家庭助手用户身份验证保护的情况下提供网站服务。

**警告!!**

设置此选项存在潜在的安全风险，应该尽量避免。如果您不知道自己在做什么，请保持此选项关闭。

## 支持

- 有问题？
  [在这里打开一个问题][issues]

- 有一般仓库问题或插件想法？ [在这里打开一个问题][repo-issues]

[issues]: https://github.com/expaso/hassos-addon-pgadmin4/issues
[repo-issues]: https://github.com/expaso/hassos-addons/issues

[project-stage-shield]: https://img.shields.io/badge/project%20stage-production%20ready-brightgreen.svg
[release-shield]: https://img.shields.io/badge/version-v3.2.0-blue.svg
[release]: https://github.com/expaso/hassos-addon-pgadmin4/tree/v3.2.0
[license-shield]: https://img.shields.io/github/license/expaso/hassos-addon-pgAdmin4.svg
[maintenance-shield]: https://img.shields.io/maintenance/yes/2024.svg