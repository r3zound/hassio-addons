# 家庭助手插件：Paperless NGX

# ⚠️ 推荐使用这个新插件 (https://github.com/BenoitAnastay/home-assistant-addons-repository)。它更稳健，功能更多。 ⚠️

迁移（感谢 @eikeja）：
- 安装新插件
- 备份旧的 Paperless 目录。就我而言是 "/addon_configs/db21ed7f_paperless_ng"
- 查看新实例的文件夹结构，将旧实例的文件分配到新实例的文件夹中。

启动新的 Paperless - 所有数据均在！

文件夹分配：
/addon_configs/db21ed7f_paperless_ng/data → /addon_configs/ca5234a0_paperless-ngx/data

/addon_configs/db21ed7f_paperless_ng/media → /share/paperless

[![捐赠][donation-badge]](https://www.buymeacoffee.com/alexbelgium)
[![捐赠][paypal-badge]](https://www.paypal.com/donate/?hosted_button_id=DZFULJZTP3UQA)

![版本](https://img.shields.io/badge/dynamic/json?label=版本&query=%24.version&url=https%3A%2F%2Fraw.githubusercontent.com%2Falexbelgium%2Fhassio-addons%2Fmaster%2Fpaperless_ngx%2Fconfig.json)
![入口](https://img.shields.io/badge/dynamic/json?label=入口&query=%24.ingress&url=https%3A%2F%2Fraw.githubusercontent.com%2Falexbelgium%2Fhassio-addons%2Fmaster%2Fpaperless_ngx%2Fconfig.json)
![架构](https://img.shields.io/badge/dynamic/json?color=success&label=架构&query=%24.arch&url=https%3A%2F%2Fraw.githubusercontent.com%2Falexbelgium%2Fhassio-addons%2Fmaster%2Fpaperless_ngx%2Fconfig.json)

[![Codacy 徽章](https://app.codacy.com/project/badge/Grade/9c6cf10bdbba45ecb202d7f579b5be0e)](https://www.codacy.com/gh/alexbelgium/hassio-addons/dashboard?utm_source=github.com&utm_medium=referral&utm_content=alexbelgium/hassio-addons&utm_campaign=Badge_Grade)
[![GitHub Super-Linter](https://github.com/alexbelgium/hassio-addons/workflows/Lint%20Code%20Base/badge.svg)](https://github.com/marketplace/actions/super-linter)
[![构建器](https://github.com/alexbelgium/hassio-addons/workflows/Builder/badge.svg)](https://github.com/alexbelgium/hassio-addons/actions/workflows/builder.yaml)

[donation-badge]: https://img.shields.io/badge/Buy%20me%20a%20coffee%20(no%20paypal)-%23d32f2f?logo=buy-me-a-coffee&style=flat&logoColor=white
[paypal-badge]: https://img.shields.io/badge/Buy%20me%20a%20coffee%20with%20Paypal-0070BA?logo=paypal&style=flat&logoColor=white

_感谢所有给我的仓库加星的人！要给它加星，请点击下方的图片，然后将其放在右上角。谢谢！_

[![Stargazers repo roster for @alexbelgium/hassio-addons](https://raw.githubusercontent.com/alexbelgium/hassio-addons/master/.github/stars2.svg)](https://github.com/alexbelgium/hassio-addons/stargazers)

![下载演变](https://raw.githubusercontent.com/alexbelgium/hassio-addons/master/paperless_ngx/stats.png)

## 关于

[Paperless NGX](https://github.com/paperless-ngx/paperless-ngx) 是一个文档管理系统，可以将您的物理文档转换为可搜索的在线档案，以便您减少纸张使用。

替代高品质插件 : https://github.com/BenoitAnastay/home-assistant-addons-repository/tree/main/paperless-ngx

## 配置

默认的用户名:密码是 admin:admin。登录后，您可以在管理面板内更改它。

可以通过两种方式配置选项：

- 插件选项

```yaml
PGID: user
GPID: user
localdisks: sda1 #将要挂载的硬盘名称用逗号分隔，或其标签。例如，sda1, sdb1, MYNAS...
networkdisks: "<//SERVER/SHARE>" # 要挂载的 smbv2/3 服务器列表（可选）
cifsusername: "用户名" # smb 用户名（可选）
cifspassword: "密码" # smb 密码（可选）
CONFIG_LOCATION: config.yaml 的位置（见下文）
OCRLANG: eng fra # 此页面可以设置任何语言（始终三字母）[这里](https://tesseract-ocr.github.io/tessdoc/Data-Files#data-files-for-version-400-november-29-2016)。
TZ: Europe/Paris # 设置特定时区
```

- Config.yaml

可以将自定义环境变量添加到插件选项中引用的 config.yaml 文件。完整的环境变量可以在这里找到 : https://paperless-ngx.readthedocs.io/en/latest/configuration.html。必须以有效的 yaml 格式输入，该格式在插件启动时进行验证。

## 安装

这个插件的安装非常简单，与安装其他插件没有区别。

1. 将我的插件库添加到您的家庭助手实例（在管理者插件商店右上方，或如果您配置了我的 HA，则点击下方的按钮）
   [![打开您的家庭助手实例并展示添加插件库对话框，带有预填的特定库 URL。](https://my.home-assistant.io/badges/supervisor_add_addon_repository.svg)](https://my.home-assistant.io/redirect/supervisor_add_addon_repository/?repository_url=https%3A%2F%2Fgithub.com%2Falexbelgium%2Fhassio-addons)
2. 安装此插件。
3. 点击 `保存` 按钮以存储您的配置。
4. 根据您的偏好设置插件选项。
5. 启动插件。
6. 检查插件的日志以查看一切是否正常。
7. 打开 webUI 并调整软件选项。

## 与 HA 的集成

没有特别的集成，这是一个自托管系统。

## 支持

在 GitHub 上创建一个问题。

## 插图

---

![插图](https://paperless-ngx.readthedocs.io/en/latest/_images/documents-smallcards.png)