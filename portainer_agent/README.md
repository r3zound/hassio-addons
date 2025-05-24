# 家庭助理插件：Portainer_agent

[![捐赠][donation-badge]](https://www.buymeacoffee.com/alexbelgium)
[![捐赠][paypal-badge]](https://www.paypal.com/donate/?hosted_button_id=DZFULJZTP3UQA)

![版本](https://img.shields.io/badge/dynamic/json?label=Version&query=%24.version&url=https%3A%2F%2Fraw.githubusercontent.com%2Falexbelgium%2Fhassio-addons%2Fmaster%2Fportainer_agent%2Fconfig.json)
![入口](https://img.shields.io/badge/dynamic/json?label=Ingress&query=%24.ingress&url=https%3A%2F%2Fraw.githubusercontent.com%2Falexbelgium%2Fhassio-addons%2Fmaster%2Fportainer_agent%2Fconfig.json)
![架构](https://img.shields.io/badge/dynamic/json?color=success&label=Arch&query=%24.arch&url=https%3A%2F%2Fraw.githubusercontent.com%2Falexbelgium%2Fhassio-addons%2Fmaster%2Fportainer_agent%2Fconfig.json)

[![Codacy徽章](https://app.codacy.com/project/badge/Grade/9c6cf10bdbba45ecb202d7f579b5be0e)](https://www.codacy.com/gh/alexbelgium/hassio-addons/dashboard?utm_source=github.com&utm_medium=referral&utm_content=alexbelgium/hassio-addons&utm_campaign=Badge_Grade)
[![GitHub超级代码检查器](https://img.shields.io/github/actions/workflow/status/alexbelgium/hassio-addons/weekly-supelinter.yaml?label=Lint%20code%20base)](https://github.com/alexbelgium/hassio-addons/actions/workflows/weekly-supelinter.yaml)
[![构建工具](https://img.shields.io/github/actions/workflow/status/alexbelgium/hassio-addons/onpush_builder.yaml?label=Builder)](https://github.com/alexbelgium/hassio-addons/actions/workflows/onpush_builder.yaml)

[donation-badge]: https://img.shields.io/badge/Buy%20me%20a%20coffee%20(no%20paypal)-%23d32f2f?logo=buy-me-a-coffee&style=flat&logoColor=white
[paypal-badge]: https://img.shields.io/badge/Buy%20me%20a%20coffee%20with%20Paypal-0070BA?logo=paypal&style=flat&logoColor=white

_感谢所有给我的仓库点过星的人！要给我点星，请点击下面的图片，然后它会在右上角。谢谢！_

[![@alexbelgium/hassio-addons的星标用户](https://raw.githubusercontent.com/alexbelgium/hassio-addons/master/.github/stars2.svg)](https://github.com/alexbelgium/hassio-addons/stargazers)

![下载演变](https://raw.githubusercontent.com/alexbelgium/hassio-addons/master/portainer_agent/stats.png)

## 关于

---

Portainer Agent 是一种解决 Docker API 限制的变通方法，该限制在使用 Docker API 管理 Docker 环境时会出现。用户与特定资源（容器、网络、卷和镜像）的交互仅限于那些在 Docker API 请求所针对的节点上可用的资源。

该容器基于官方 docker 镜像（https://github.com/portainer/agent），使用 @homecentr 的逻辑（https://github.com/homecentr/docker-portainer-agent）进行了修改，以便在 homeassistant 基础镜像中使用。

## 警告

portainer_agent 插件非常强大，几乎可以让您访问整个系统。虽然这个插件是小心创建和维护的，并考虑到安全性，但在错误或缺乏经验的手中，可能会损坏您的系统。

## 安装

---

安装此插件非常简单，并没有与安装其他任何插件不同。

1. 将我的插件库添加到您的家庭助理实例中（在超级管理员插件商店右上角，或者如果您已配置我的 HA，请点击下面的按钮）
   [![打开您的家庭助理实例并显示添加插件库对话框，特定库 URL 预填充。](https://my.home-assistant.io/badges/supervisor_add_addon_repository.svg)](https://my.home-assistant.io/redirect/supervisor_add_addon_repository/?repository_url=https%3A%2F%2Fgithub.com%2Falexbelgium%2Fhassio-addons)
2. 安装此插件。
3. 点击 `保存` 按钮以存储您的配置。
4. 根据您的偏好设置插件选项
5. 启动插件。
6. 检查插件的日志以查看是否一切正常。
7. 打开 WebUI 并调整软件选项

说明（感谢 @Mincka）：
禁用保护模式，然后从其他 Portainer 集群中，添加一个类型为 “Agent” 的新环境，使用 HA 的 IP 地址和端口 9001

![图像](https://github.com/alexbelgium/hassio-addons/assets/6184289/f5c5f264-69d0-4d3c-b900-476e21aef05a)

## 配置

---

主要选项：
```yaml
    "PORTAINER_AGENT_ARGS": 传递给 portainer-agent 可执行文件的命令行参数
```

其他选项：见 https://github.com/portainer/agent#deployment-options

## 支持

在 GitHub 上创建一个问题