# 家庭助理附加组件：Webtrees

[![捐赠][donation-badge]](https://www.buymeacoffee.com/alexbelgium)
[![捐赠][paypal-badge]](https://www.paypal.com/donate/?hosted_button_id=DZFULJZTP3UQA)

![版本](https://img.shields.io/badge/dynamic/json?label=Version&query=%24.version&url=https%3A%2F%2Fraw.githubusercontent.com%2Falexbelgium%2Fhassio-addons%2Fmaster%2Fwebtrees%2Fconfig.json)
![入口](https://img.shields.io/badge/dynamic/json?label=Ingress&query=%24.ingress&url=https%3A%2F%2Fraw.githubusercontent.com%2Falexbelgium%2Fhassio-addons%2Fmaster%2Fwebtrees%2Fconfig.json)
![架构](https://img.shields.io/badge/dynamic/json?color=success&label=Arch&query=%24.arch&url=https%3A%2F%2Fraw.githubusercontent.com%2Falexbelgium%2Fhassio-addons%2Fmaster%2Fwebtrees%2Fconfig.json)

[![Codacy 徽章](https://app.codacy.com/project/badge/Grade/9c6cf10bdbba45ecb202d7f579b5be0e)](https://www.codacy.com/gh/alexbelgium/hassio-addons/dashboard?utm_source=github.com&utm_medium=referral&utm_content=alexbelgium/hassio-addons&utm_campaign=Badge_Grade)
[![GitHub 超级代码检查器](https://img.shields.io/github/actions/workflow/status/alexbelgium/hassio-addons/weekly-supelinter.yaml?label=Lint%20code%20base)](https://github.com/alexbelgium/hassio-addons/actions/workflows/weekly-supelinter.yaml)
[![构建工具](https://img.shields.io/github/actions/workflow/status/alexbelgium/hassio-addons/onpush_builder.yaml?label=Builder)](https://github.com/alexbelgium/hassio-addons/actions/workflows/onpush_builder.yaml)

[donation-badge]: https://img.shields.io/badge/Buy%20me%20a%20coffee%20(no%20paypal)-%23d32f2f?logo=buy-me-a-coffee&style=flat&logoColor=white
[paypal-badge]: https://img.shields.io/badge/Buy%20me%20a%20coffee%20with%20Paypal-0070BA?logo=paypal&style=flat&logoColor=white

_感谢所有给我的项目点赞的人！要点赞，请点击下面的图片，然后它将在右上角。谢谢！_

[![点赞者的 repo 名单 @alexbelgium/hassio-addons](https://raw.githubusercontent.com/alexbelgium/hassio-addons/master/.github/stars2.svg)](https://github.com/alexbelgium/hassio-addons/stargazers)

![下载演变](https://raw.githubusercontent.com/alexbelgium/hassio-addons/master/webtrees/stats.png)

## 关于

[webtrees](http://www.webtrees.net) 是最领先的在线协作家族谱应用程序。

此附加组件基于 docker 镜像 https://github.com/NathanVaughn/webtrees-docker

## 配置

Webui 可以在 <http://homeassistant:PORT> 找到。

用户名和密码通过启动向导定义。

选项可以通过两种方式配置：

- 附加组件选项

```yaml
LANG: "en-US" # webtrees 的默认语言
BASE_URL: "http://192.168.178.69" # 访问 webtrees 的 url
DB_TYPE: "sqlite" # 数据库类型：sqlite 为自动配置，或 external 为手动配置
CONFIG_LOCATION: config.yaml 的位置（见下文）
localdisks: sda1 # 将硬盘的硬件名称用逗号分隔列出以挂载，或使用其标签。例如：sda1, sdb1, MYNAS...
networkdisks: "//SERVER/SHARE" # 可选，列出要挂载的 smb 服务器，使用逗号分隔
cifsusername: "username" # 可选，smb 用户名，所有 smb 共享使用相同的
cifspassword: "password" # 可选，smb 密码
trusted_headers: 单个地址，或 CIDR 格式的地址范围
base_url_portless: 不带端口的基础 url
```

- Config.yaml

可以将自定义环境变量添加到附加组件选项中引用的 config.yaml 文件中。完整的环境变量可以在这里找到：https://github.com/linuxserver/docker-paperless-ng。必须以有效的 yaml 格式输入，该格式在附加组件启动时会进行验证。

## 安装

此附加组件的安装非常简单，与安装其他附加组件没有不同。

1. 将我的附加组件库添加到您的家庭助理实例中（在监督员附加组件商店的右上角，或如果您已配置我的家庭助理，请单击下面的按钮）
   [![打开您的 Home Assistant 实例并显示带有特定库 URL 的添加附加组件库对话框。](https://my.home-assistant.io/badges/supervisor_add_addon_repository.svg)](https://my.home-assistant.io/redirect/supervisor_add_addon_repository/?repository_url=https%3A%2F%2Fgithub.com%2Falexbelgium%2Fhassio-addons)
1. 安装此附加组件。
1. 点击 `保存` 按钮以存储您的配置。
1. 设置附加组件选项以满足您的偏好
1. 启动附加组件。
1. 检查附加组件的日志以查看一切是否正常。
1. 打开 webUI 并调整软件选项

## 支持

在 GitHub 上创建一个问题

## 插图

![插图](https://installatron.infomaniak.com/installatron//images/ss2_webtrees.jpg)