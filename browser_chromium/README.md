# 家庭助理附加组件：chromium

我在业余时间维护这个和其他家庭助理附加组件：跟踪上游变化、家庭助理变化以及在真实硬件上测试都需要花费大量的时间（以及一些金钱）。我经常使用大约5-10个我的>110个附加组件，所以我安装了测试机器（并购买了一些测试服务，如vpn），这些服务我自己并不使用，以解决故障和改进附加组件。

如果这个附加组件为您节省了时间或使您的设置更简单，我将非常感谢您的支持！

[![请我喝杯咖啡][donation-badge]](https://www.buymeacoffee.com/alexbelgium)
[![通过PayPal捐赠][paypal-badge]](https://www.paypal.com/donate/?hosted_button_id=DZFULJZTP3UQA)

## 附加组件信息

![版本](https://img.shields.io/badge/dynamic/yaml?label=Version&query=%24.version&url=https%3A%2F%2Fraw.githubusercontent.com%2Falexbelgium%2Fhassio-addons%2Fmaster%2Fchromium%2Fconfig.yaml)
![入站](https://img.shields.io/badge/dynamic/yaml?label=Ingress&query=%24.ingress&url=https%3A%2F%2Fraw.githubusercontent.com%2Falexbelgium%2Fhassio-addons%2Fmaster%2Fchromium%2Fconfig.yaml)
![架构](https://img.shields.io/badge/dynamic/yaml?color=success&label=Arch&query=%24.arch&url=https%3A%2F%2Fraw.githubusercontent.com%2Falexbelgium%2Fhassio-addons%2Fmaster%2Fchromium%2Fconfig.yaml)

[![Codacy徽章](https://app.codacy.com/project/badge/Grade/9c6cf10bdbba45ecb202d7f579b5be0e)](https://www.codacy.com/gh/alexbelgium/hassio-addons/dashboard?utm_source=github.com&utm_medium=referral&utm_content=alexbelgium/hassio-addons&utm_campaign=Badge_Grade)
[![GitHub Super-Linter](https://img.shields.io/github/actions/workflow/status/alexbelgium/hassio-addons/weekly-supelinter.yaml?label=Lint%20code%20base)](https://github.com/alexbelgium/hassio-addons/actions/workflows/weekly-supelinter.yaml)
[![Builder](https://img.shields.io/github/actions/workflow/status/alexbelgium/hassio-addons/onpush_builder.yaml?label=Builder)](https://github.com/alexbelgium/hassio-addons/actions/workflows/onpush_builder.yaml)

[donation-badge]: https://img.shields.io/badge/Buy%20me%20a%20coffee-%23d32f2f?logo=buy-me-a-coffee&style=flat&logoColor=white
[paypal-badge]: https://img.shields.io/badge/Donate%20via%20PayPal-0070BA?logo=paypal&style=flat&logoColor=white

_感谢每一位给我的仓库点星标的人！要星标它，请点击下面的图片，然后它就会出现在右上角。谢谢！_

[![@alexbelgium/hassio-addons 的星标仓库列表](https://raw.githubusercontent.com/alexbelgium/hassio-addons/master/.github/stars2.svg)](https://github.com/alexbelgium/hassio-addons/stargazers)

![下载趋势](https://raw.githubusercontent.com/alexbelgium/hassio-addons/master/chromium/stats.png)

## 关于

[chromium](https://chromium.com/) 是一款快速、隐私和安全的多平台网页浏览器，适用于PC、Mac和移动设备。
此附加组件基于 docker 图像 https://github.com/linuxserver/docker-chromium

## 配置

使用附加组件 `env_vars` 选项传递额外的环境变量（大写或小写名称）。有关详细信息，请参阅 https://github.com/alexbelgium/hassio-addons/wiki/Add-Environment-variables-to-your-Addon-2。

Webui 可以通过入站或通过 <http://homeassistant:PORT> 访问。端口默认禁用，但可以通过附加组件选项启用。

默认情况下，镜像基于 abc 用户，我们建议使用此用户，因为所有的 init/config 都基于它。默认密码也是 abc 。如果您想更改此密码并需要在访问界面时进行身份验证，请在容器中的 GUI 终端中执行 passwd 命令。然后当访问 Web 界面时，请使用以下路径：

http://localhost:3000/?login=true

应用安装不会持久，您需要通过附加组件选项进行操作。然而，它们的配置是。

如果图形功能不起作用，请使用 DRINODE 功能来选择您的图形设备。

在此处查看所有潜在的环境变量：https://docs.linuxserver.io/images/docker-chromium#optional-environment-variables

```yaml
TZ: 时区；根据 https://manpages.ubuntu.com/manpages/trusty/man3/DateTime::TimeZone::Catalog.3pm.html 指定的国家/城市
additional_apps: engrampa,thunderbird # 允许安装应用，因为它们不持久
DRINODE: 指定自定义图形设备，默认为 /dev/dri/renderD128
DNS_servers: 8.8.8.8,1.1.1.1 # 保持空白以使用路由器的 DNS，或设置自定义 DNS 以避免本地 DNS 广告移除
localdisks: sda1 # 放置您的驱动器的硬件名称以挂载，用逗号分隔，或其标签。例如：sda1, sdb1, MYNAS...
networkdisks: "//SERVER/SHARE" # 可选，挂载的 smb 服务器列表，用逗号分隔
cifsusername: "username" # 可选，smb 用户名，对于所有 smb 共享相同
cifspassword: "password" # 可选，smb 密码
cifsdomain: "domain" # 可选，允许设置 smb 共享的域
```

## 安装

此附加组件的安装相当简单，与安装任何其他附加组件没有区别。

1. 将我的附加组件存储库添加到您的家庭助理实例中（在总监附加组件商店右上角，或单击下面的按钮如果您已配置我的 HA）
   [![打开您的家庭助理实例并显示带有特定存储库 URL 预填充的添加附加组件存储库对话框](https://my.home-assistant.io/badges/supervisor_add_addon_repository.svg)](https://my.home-assistant.io/redirect/supervisor_add_addon_repository/?repository_url=https%3A%2F%2Fgithub.com%2Falexbelgium%2Fhassio-addons)
1. 安装此附加组件。
1. 单击“保存”按钮以存储您的配置。
1. 将附加组件选项设置为您喜欢的偏好。
1. 启动附加组件。
1. 检查附加组件的日志以查看一切是否顺利。
1. 打开 WebUI 并调整软件选项

## 支持

在 github 上创建问题

## 图解

---

**⚠️ This resource is intended to help Chinese Home Assistant users more easily install excellent add-ons. If you are not a Chinese user, please read repository readme first**

**⚠️ 这个资源用来帮助中国Home Assistant用户更容易地安装优秀的插件。如果您不是中国用户，请先阅读仓库的README，以下为收集者（汉化，加速）信息，非原作者信息**

---

## 📱 关注我

扫描下面二维码，关注我。有需要可以随时给我留言：

<img src="https://gitee.com/desmond_GT/hassio-addons/raw/main/WeChat_QRCode.png" width="50%" /> 📲

## ☕ 赞助支持

如果您觉得我花费大量时间维护这个库对您有帮助，欢迎请我喝杯奶茶，您的支持将是我持续改进的动力！

<div style="display: flex; justify-content: space-between;">
  <img src="https://gitee.com/desmond_GT/hassio-addons/raw/main/1_readme/Ali_Pay.jpg" height="350px" />
  <img src="https://gitee.com/desmond_GT/hassio-addons/raw/main/1_readme/WeChat_Pay.jpg" height="350px" />
</div> 💖

感谢您的支持与鼓励！
