# 家庭助理附加组件：Codex

[![捐赠][donation-badge]](https://www.buymeacoffee.com/alexbelgium)
[![捐赠][paypal-badge]](https://www.paypal.com/donate/?hosted_button_id=DZFULJZTP3UQA)

![版本](https://img.shields.io/badge/dynamic/json?label=Version&query=%24.version&url=https%3A%2F%2Fraw.githubusercontent.com%2Falexbelgium%2Fhassio-addons%2Fmaster%2Fcodex%2Fconfig.json)
![入口](https://img.shields.io/badge/dynamic/json?label=Ingress&query=%24.ingress&url=https%3A%2F%2Fraw.githubusercontent.com%2Falexbelgium%2Fhassio-addons%2Fmaster%2Fcodex%2Fconfig.json)
![架构](https://img.shields.io/badge/dynamic/json?color=success&label=Arch&query=%24.arch&url=https%3A%2F%2Fraw.githubusercontent.com%2Falexbelgium%2Fhassio-addons%2Fmaster%2Fcodex%2Fconfig.json)

[![Codacy徽章](https://app.codacy.com/project/badge/Grade/9c6cf10bdbba45ecb202d7f579b5be0e)](https://www.codacy.com/gh/alexbelgium/hassio-addons/dashboard?utm_source=github.com&utm_medium=referral&utm_content=alexbelgium/hassio-addons&utm_campaign=Badge_Grade)
[![GitHub超级Lint](https://img.shields.io/github/actions/workflow/status/alexbelgium/hassio-addons/weekly-supelinter.yaml?label=Lint%20code%20base)](https://github.com/alexbelgium/hassio-addons/actions/workflows/weekly-supelinter.yaml)
[![构建器](https://img.shields.io/github/actions/workflow/status/alexbelgium/hassio-addons/onpush_builder.yaml?label=Builder)](https://github.com/alexbelgium/hassio-addons/actions/workflows/onpush_builder.yaml)

[donation-badge]: https://img.shields.io/badge/Buy%20me%20a%20coffee%20(no%20paypal)-%23d32f2f?logo=buy-me-a-coffee&style=flat&logoColor=white
[paypal-badge]: https://img.shields.io/badge/Buy%20me%20a%20coffee%20with%20Paypal-0070BA?logo=paypal&style=flat&logoColor=white

_感谢每一个为我的代码库加星的人！要加星，请点击下面的图片，然后它将显示在右上角。谢谢！_

[![@alexbelgium/hassio-addons的观星者代码库列表](https://raw.githubusercontent.com/alexbelgium/hassio-addons/master/.github/stars2.svg)](https://github.com/alexbelgium/hassio-addons/stargazers)

![下载演变](https://raw.githubusercontent.com/alexbelgium/hassio-addons/master/codex/stats.png)

## 关于

---

[Codex](https://github.com/ajslater/codex) 是一个基于网页的漫画档案浏览器和阅读器
此附加组件基于官方docker镜像：https://hub.docker.com/r/ajslater/codex

## 安装

---

此附加组件的安装相当简单，与安装其他附加组件没有区别。

1. 将我的附加组件库添加到您的家庭助理实例（在主管附加组件商店右上角，或如果您已配置了我的HA，请点击下面的按钮）
   [![打开您的家庭助理实例并显示添加附加组件库对话框，预填特定库URL。](https://my.home-assistant.io/badges/supervisor_add_addon_repository.svg)](https://my.home-assistant.io/redirect/supervisor_add_addon_repository/?repository_url=https%3A%2F%2Fgithub.com%2Falexbelgium%2Fhassio-addons)
2. 安装此附加组件。
3. 点击`保存`按钮以存储您的配置。
4. 根据您的喜好设置附加组件选项。
5. 启动附加组件。
6. 检查附加组件的日志以确保一切正常。
7. 打开webUI并调整软件选项。

## 配置

Webui可以在<http://homeassistant:PORT>找到。
默认的用户名/密码：在启动日志中描述。
可以通过应用的webUI进行配置，除了以下选项。

## 添加主题/骨架

您可以将主题/骨架的用户文件夹放置在/share/codex/www/user中，

## 选项

```yaml
PGID: user
GPID: user
TZ : 将明确指定时区，采用长格式（例如 "America/Los Angeles"）。这在Docker内部很有用，因为codex无法自动检测主机机器的时区。
CODEX_RESET_ADMIN=1 : 启动codex时将重置管理员用户及其密码为默认值。
CODEX_SKIP_INTEGRITY_CHECK=1 : 启动codex时将跳过运行的数据库完整性修复。
csrf_allowed : 允许访问该应用的地址的逗号分隔列表。
localdisks: sda1 # 将要挂载的驱动器的硬件名称用逗号分隔，或其标签。例如：sda1, sdb1, MYNAS...
networkdisks: "//SERVER/SHARE" # 可选，要挂载的smb服务器列表，用逗号分隔。
cifsusername: "username" # 可选，smb用户名，所有smb共享相同。
cifspassword: "password" # 可选，smb密码。
```

## 插图

![图像](https://github.com/alexbelgium/hassio-addons/assets/44178713/f1cf3cad-5bda-46df-a0f5-864b127d7b6b)

## 支持

在GitHub上创建一个问题

[库]: https://github.com/alexbelgium/hassio-addons