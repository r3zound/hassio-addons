# 家庭助理附加组件：calibre

[![捐赠][donation-badge]](https://www.buymeacoffee.com/alexbelgium)
[![捐赠][paypal-badge]](https://www.paypal.com/donate/?hosted_button_id=DZFULJZTP3UQA)

![版本](https://img.shields.io/badge/dynamic/json?label=Version&query=%24.version&url=https%3A%2F%2Fraw.githubusercontent.com%2Falexbelgium%2Fhassio-addons%2Fmaster%2Fcalibre%2Fconfig.json)
![入口](https://img.shields.io/badge/dynamic/json?label=Ingress&query=%24.ingress&url=https%3A%2F%2Fraw.githubusercontent.com%2Falexbelgium%2Fhassio-addons%2Fmaster%2Fcalibre%2Fconfig.json)
![架构](https://img.shields.io/badge/dynamic/json?color=success&label=Arch&query=%24.arch&url=https%3A%2F%2Fraw.githubusercontent.com%2Falexbelgium%2Fhassio-addons%2Fmaster%2Fcalibre%2Fconfig.json)

[![Codacy Badge](https://app.codacy.com/project/badge/Grade/9c6cf10bdbba45ecb202d7f579b5be0e)](https://www.codacy.com/gh/alexbelgium/hassio-addons/dashboard?utm_source=github.com&utm_medium=referral&utm_content=alexbelgium/hassio-addons&utm_campaign=Badge_Grade)
[![GitHub Super-Linter](https://img.shields.io/github/actions/workflow/status/alexbelgium/hassio-addons/weekly-supelinter.yaml?label=Lint%20code%20base)](https://github.com/alexbelgium/hassio-addons/actions/workflows/weekly-supelinter.yaml)
[![构建器](https://img.shields.io/github/actions/workflow/status/alexbelgium/hassio-addons/onpush_builder.yaml?label=Builder)](https://github.com/alexbelgium/hassio-addons/actions/workflows/onpush_builder.yaml)

[donation-badge]: https://img.shields.io/badge/Buy%20me%20a%20coffee%20(no%20paypal)-%23d32f2f?logo=buy-me-a-coffee&style=flat&logoColor=white
[paypal-badge]: https://img.shields.io/badge/Buy%20me%20a%20coffee%20with%20Paypal-0070BA?logo=paypal&style=flat&logoColor=white

_感谢所有给我的仓库加星的人！要加星请点击下面的图片，然后它会在右上角。谢谢！_

[![Stargazers repo roster for @alexbelgium/hassio-addons](https://raw.githubusercontent.com/alexbelgium/hassio-addons/master/.github/stars2.svg)](https://github.com/alexbelgium/hassio-addons/stargazers)

![下载演变](https://raw.githubusercontent.com/alexbelgium/hassio-addons/master/calibre/stats.png)

## 关于

---

[Calibre](https://calibre-ebook.com/) 是一个强大且易于使用的电子书管理器。用户表示它出色且必备。它让您几乎可以做任何事情，并且在普通电子书软件的基础上更进一步。它也是完全免费的开源软件，非常适合普通用户和计算机专家。

这个附加组件是基于docker镜像 [https://github.com/linuxserver/docker-calibre](https://github.com/linuxserver/docker-calibre)

## 安装

---

这个附加组件的安装过程相当简单，与安装任何其他附加组件没有区别。

1. 将我的附加组件库添加到您的家庭助理实例中（在监督员附加组件商店右上角，或者如果您已配置我的家庭助理，请点击下面的按钮）
   [![打开您的家庭助理实例并显示带有特定库网址预填的添加附加组件库对话框。](https://my.home-assistant.io/badges/supervisor_add_addon_repository.svg)](https://my.home-assistant.io/redirect/supervisor_add_addon_repository/?repository_url=https%3A%2F%2Fgithub.com%2Falexbelgium%2Fhassio-addons)
2. 安装这个附加组件。
3. 点击 `保存` 按钮以存储您的配置。
4. 根据您的偏好设置附加组件选项
5. 启动附加组件。
6. 检查附加组件的日志以查看一切是否正常。
7. 打开webUI并调整软件选项

## 配置

---

webui可以在 <http://homeassistant:PORT> 找到。
配置可以通过应用程序webUI完成，除了以下选项。
请阅读上游容器文档以获取更多信息 : https://github.com/linuxserver/docker-calibre/blob/35b5e3ae06ba95f666687150ca5fd632b8db9e87/README.md#application-setup

特别是，网络服务器和无线连接需要从桌面应用手动启用，以便能够访问，分别使用端口8081和9090。

```yaml
PGID: user
GPID: user
TZ: timezone
PASSWORD: 可选的GUI密码
CLI_ARGS: 可选地传递cli启动参数给calibre
localdisks: sda1 #将您要挂载的驱动器的硬件名称用逗号分隔，或其标签。例如sda1, sdb1, MYNAS...
networkdisks: "//SERVER/SHARE" # 可选，挂载的smb服务器列表，用逗号分隔
cifsusername: "username" # 可选，smb用户名，对所有smb共享相同
cifspassword: "password" # 可选，smb密码
```

## 支持

在github上创建一个问题

## 插图

---

![插图](https://calibre.com/img/slider/artistdetails.png)

[repository]: https://github.com/alexbelgium/hassio-addons