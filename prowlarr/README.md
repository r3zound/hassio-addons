# 家庭助手附加组件: Prowlarr

[![捐赠][donation-badge]](https://www.buymeacoffee.com/alexbelgium)
[![捐赠][paypal-badge]](https://www.paypal.com/donate/?hosted_button_id=DZFULJZTP3UQA)

![版本](https://img.shields.io/badge/dynamic/json?label=Version&query=%24.version&url=https%3A%2F%2Fraw.githubusercontent.com%2Falexbelgium%2Fhassio-addons%2Fmaster%2Fprowlarr%2Fconfig.json)
![入口](https://img.shields.io/badge/dynamic/json?label=Ingress&query=%24.ingress&url=https%3A%2F%2Fraw.githubusercontent.com%2Falexbelgium%2Fhassio-addons%2Fmaster%2Fprowlarr%2Fconfig.json)
![架构](https://img.shields.io/badge/dynamic/json?color=success&label=Arch&query=%24.arch&url=https%3A%2F%2Fraw.githubusercontent.com%2Falexbelgium%2Fhassio-addons%2Fmaster%2Fprowlarr%2Fconfig.json)

[![Codacy徽章](https://app.codacy.com/project/badge/Grade/9c6cf10bdbba45ecb202d7f579b5be0e)](https://www.codacy.com/gh/alexbelgium/hassio-addons/dashboard?utm_source=github.com&utm_medium=referral&utm_content=alexbelgium/hassio-addons&utm_campaign=Badge_Grade)
[![GitHub超级代码检查](https://img.shields.io/github/actions/workflow/status/alexbelgium/hassio-addons/weekly-supelinter.yaml?label=Lint%20code%20base)](https://github.com/alexbelgium/hassio-addons/actions/workflows/weekly-supelinter.yaml)
[![构建器](https://img.shields.io/github/actions/workflow/status/alexbelgium/hassio-addons/onpush_builder.yaml?label=Builder)](https://github.com/alexbelgium/hassio-addons/actions/workflows/onpush_builder.yaml)

[donation-badge]: https://img.shields.io/badge/Buy%20me%20a%20coffee%20(no%20paypal)-%23d32f2f?logo=buy-me-a-coffee&style=flat&logoColor=white
[paypal-badge]: https://img.shields.io/badge/Buy%20me%20a%20coffee%20with%20Paypal-0070BA?logo=paypal&style=flat&logoColor=white

_感谢每一个给我的仓库加星的人！点击下面的图片为其加星，之后它将出现在右上角。谢谢！_

[![@alexbelgium/hassio-addons的星级用户列表](https://raw.githubusercontent.com/alexbelgium/hassio-addons/master/.github/stars2.svg)](https://github.com/alexbelgium/hassio-addons/stargazers)

![下载演变](https://raw.githubusercontent.com/alexbelgium/hassio-addons/master/prowlarr/stats.png)

## 关于

---

[Prowlarr](https://github.com/Prowlarr/Prowlarr) 是一种索引器管理器/代理，基于流行的 arr .net/reactjs 栈构建，用于与您的各种 PVR 应用集成。
该附加组件基于 docker 镜像 https://github.com/linuxserver/docker-prowlarr

## 安装

---

此附加组件的安装非常简单，与安装任何其他附加组件没有区别。

1. 将我的附加组件库添加到您的家庭助手实例中（在监督者附加组件商店的右上角，或者如果您已配置我的 HA 请点击下面的按钮）
   [![打开您的家庭助手实例并显示添加附加组件库对话框，预填充特定的库 URL。](https://my.home-assistant.io/badges/supervisor_add_addon_repository.svg)](https://my.home-assistant.io/redirect/supervisor_add_addon_repository/?repository_url=https%3A%2F%2Fgithub.com%2Falexbelgium%2Fhassio-addons)
2. 安装此附加组件。
3. 点击 `保存` 按钮以保存您的配置。
4. 将附加组件选项设置为您喜欢的选项。
5. 启动附加组件。
6. 检查附加组件的日志，以查看一切是否正常。
7. 打开 webUI 并根据需要调整软件选项。

## 配置

---

WebUI 可以在 <http://homeassistant:PORT> 找到。
默认的用户名/密码：在启动日志中描述。
可以通过 app webUI 进行配置，除了以下选项：

```yaml
PGID: user
GPID: user
TZ: timezone
localdisks: sda1 #将要挂载的驱动器的硬件名称用逗号分隔，或其标签。例如 sda1, sdb1, MYNAS...
networkdisks: "//SERVER/SHARE" # 可选，要挂载的 smb 服务器列表，用逗号分隔
cifsusername: "用户名" # 可选，smb 用户名，所有 smb 共享相同
cifspassword: "密码" # 可选，smb 密码
```

## 支持

在 GitHub 上创建一个问题。

## 插图

---

![插图](https://wiki.servarr.com/assets/prowlarr/hist_1_history.png)

[仓库]: https://github.com/alexbelgium/hassio-addons