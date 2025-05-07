# 家庭助手附加组件：Homebox

Homebox 是为家庭用户构建的库存和组织系统！Homebox专注于简单性和易用性，是您家庭库存、组织和管理需求的完美解决方案。在开发这个项目时，我尽量遵循以下原则：

- _简单_ - Homebox 旨在简单易用，无需复杂的设置或配置。可以使用单一的 Docker 容器，或通过为您选择的平台编译二进制文件自行部署。
- _极快_ - Homebox 是用 Go 语言编写的，这使得它极其快速，并且部署所需的资源极少。一般情况下，整个容器的闲置内存使用量低于 50MB。
- _可移植_ - Homebox 设计为可移植，可以在任何地方运行。我们使用 SQLite 和嵌入式 Web UI，使其易于部署、使用和备份。

_感谢所有给我的仓库加星的人！要给它加星，请点击下面的图像，然后它会出现在右上角。谢谢！_

[![Stargazers repo roster for @jdeath/homeassistant-addons](https://reporoster.com/stars/jdeath/homeassistant-addons)](https://github.com/jdeath/homeassistant-addons/stargazers)

## 关于

此附加组件使用 [docker 镜像](https://github.com/sysadminsmedia/homebox)。

## 安装

此附加组件的安装非常简单，与安装其他 Hass.io 附加组件没有区别。

1. [将我的 Hass.io 附加组件库][repository] 添加到您的 Hass.io 实例。
1. 安装此附加组件。
1. 点击 `保存` 按钮以存储您的配置。
1. 启动附加组件。
1. 检查附加组件的日志，以查看一切是否正常。
1. 可以通过入口或 <your-ip>:port 打开 WebUI。
1. 注册一个用户
1. 如果您希望，可以进入附加组件配置并禁用用户注册。

## 配置

```
port : 7745 #您想要运行的端口。
```

Webui 可以在 `<your-ip>:port` 找到。

[repository]: https://github.com/jdeath/homeassistant-addons