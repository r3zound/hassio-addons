# Home assistant 插件: Homebox

Homebox 是为家庭用户构建的库存和组织系统！Homebox 专注于简单性和易用性，是满足您家庭库存、组织和管理需求的完美解决方案。在开发这个项目时，我一直牢记以下原则：

- _简单_ - Homebox 的设计旨在简单易用。无需复杂的设置或配置。可以使用单个 Docker 容器，或通过为您选择的平台编译二进制文件自行部署。
- _极快_ - Homebox 使用 Go 编写，这使其极其快速，部署时所需资源最小。一般而言，整个容器的空闲内存使用量小于 50MB。
- _可移植_ - Homebox 旨在可移植并可以在任何地方运行。我们使用 SQLite 和嵌入式 Web UI，方便部署、使用和备份。

_感谢所有给我仓库加星的人！要加星，请点击下面的图像，然后它将出现在右上角。谢谢！_

[![Stargazers repo roster for @jdeath/homeassistant-addons](https://reporoster.com/stars/jdeath/homeassistant-addons)](https://github.com/jdeath/homeassistant-addons/stargazers)

## 关于

该插件使用 [docker 镜像](https://github.com/sysadminsmedia/homebox)。

## 安装

此插件的安装非常简单，与安装任何其他 Hass.io 插件没有什么不同。

1. [将我的 Hass.io 插件库][repository] 添加到您的 Hass.io 实例。
1. 安装此插件。
1. 点击 `保存` 按钮以存储您的配置。
1. 启动插件。
1. 检查插件的日志，查看一切是否顺利。
1. 打开的 WebUI 应可通过 ingress 或 <your-ip>:port 访问。
1. 注册用户
1. 如果您愿意，可以前往插件配置并禁用用户注册。

## 配置

```
port : 7745 #您想运行的端口。
```

Webui 可以在 `<your-ip>:port` 找到。

[repository]: https://github.com/jdeath/homeassistant-addons