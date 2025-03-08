![项目阶段][project-stage-shield]
![维护][maintenance-shield]
[![许可证][license-shield]](https://github.com/expaso/hassos-addon-pgadmin4/blob/main/LICENSE)

# Home Assistant 插件: [pgAdmin 4](https://www.pgadmin.org/)

<a href="https://www.buymeacoffee.com/expaso" target="_blank"><img src="https://cdn.buymeacoffee.com/buttons/default-orange.png" alt="请我喝杯咖啡" height="41" width="174"></a>

## 介绍

pgAdmin 是最流行、功能最丰富的 PostgreSQL 开源管理和开发平台，PostgreSQL 是世界上最先进的开源数据库。

此插件可用于控制您网络上的任何 PostgreSQL 数据库，包括通过 TimescaleDB 插件提供的数据库，该插件也可以从同一附加库安装。

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

指示插件 UI 将从 80 端口还是 443 端口提供服务（使用提供的证书）。

### 选项: `certfile`

您在 `ssl` 文件夹中 SSL 证书的文件名。

### 选项: `keyfile`

您在 `ssl` 文件夹中私钥文件的文件名。

### 选项: `system_packages`

在插件启动期间将安装的可选额外 Alpine 包。

**注意**: 添加大量包可能会导致启动时间延长。

### 选项: `init_commands`

在插件启动期间将运行的任何额外命令。

### 选项: `leave_front_door_open`

在没有 Home Assistant 用户身份验证保护的情况下提供网站服务。

**警告！！**

设置此选项是潜在的安全风险，应尽可能避免。
如果您不知道自己在做什么，请不要启用此选项。

## 支持

- 有问题吗？
  [在这里打开一个问题][issues]

- 一般仓库问题或附加建议？ [在这里打开一个问题][repo-issues]

[issues]: https://github.com/expaso/hassos-addon-pgadmin4/issues
[repo-issues]: https://github.com/expaso/hassos-addons/issues

[project-stage-shield]: https://img.shields.io/badge/project%20stage-production%20ready-brightgreen.svg
[release-shield]: https://img.shields.io/badge/version-v3.2.0-blue.svg
[release]: https://github.com/expaso/hassos-addon-pgadmin4/tree/v3.2.0
[license-shield]: https://img.shields.io/github/license/expaso/hassos-addon-pgAdmin4.svg
[maintenance-shield]: https://img.shields.io/maintenance/yes/2024.svg