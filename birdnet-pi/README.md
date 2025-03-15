# 家庭助理附加组件：birdnet-pi

[![捐赠][donation-badge]](https://www.buymeacoffee.com/alexbelgium)
[![捐赠][paypal-badge]](https://www.paypal.com/donate/?hosted_button_id=DZFULJZTP3UQA)

![版本](https://img.shields.io/badge/dynamic/json?label=Version&query=%24.version&url=https%3A%2F%2Fraw.githubusercontent.com%2Falexbelgium%2Fhassio-addons%2Fmaster%2Fbirdnet-pi%2Fconfig.json)
![入口](https://img.shields.io/badge/dynamic/json?label=Ingress&query=%24.ingress&url=https%3A%2F%2Fraw.githubusercontent.com%2Falexbelgium%2Fhassio-addons%2Fmaster%2Fbirdnet-pi%2Fconfig.json)
![架构](https://img.shields.io/badge/dynamic/json?color=success&label=Arch&query=%24.arch&url=https%3A%2F%2Fraw.githubusercontent.com%2Falexbelgium%2Fhassio-addons%2Fmaster%2Fbirdnet-pi%2Fconfig.json)

[![Codacy 徽章](https://app.codacy.com/project/badge/Grade/9c6cf10bdbba45ecb202d7f579b5be0e)](https://www.codacy.com/gh/alexbelgium/hassio-addons/dashboard?utm_source=github.com&utm_medium=referral&utm_content=alexbelgium/hassio-addons&utm_campaign=Badge_Grade)
[![GitHub Super-Linter](https://img.shields.io/github/actions/workflow/status/alexbelgium/hassio-addons/weekly-supelinter.yaml?label=Lint%20code%20base)](https://github.com/alexbelgium/hassio-addons/actions/workflows/weekly-supelinter.yaml)
[![构建器](https://img.shields.io/github/actions/workflow/status/alexbelgium/hassio-addons/onpush_builder.yaml?label=Builder)](https://github.com/alexbelgium/hassio-addons/actions/workflows/onpush_builder.yaml)

[donation-badge]: https://img.shields.io/badge/Buy%20me%20a%20coffee%20(no%20paypal)-%23d32f2f?logo=buy-me-a-coffee&style=flat&logoColor=white
[paypal-badge]: https://img.shields.io/badge/Buy%20me%20a%20coffee%20with%20Paypal-0070BA?logo=paypal&style=flat&logoColor=white

_感谢每一个给我的仓库加星的朋友！要加星，请点击下面的图片，然后会在右上角显示。谢谢！_

[![Stargazers repo roster for @alexbelgium/hassio-addons](https://raw.githubusercontent.com/alexbelgium/hassio-addons/master/.github/stars2.svg)](https://github.com/alexbelgium/hassio-addons/stargazers)

![下载演变](https://raw.githubusercontent.com/alexbelgium/hassio-addons/master/birdnet-pi/stats.png)

## 关于

_注意：如果要在没有 HomeAssistant 的情况下使用（经典的 Docker 容器），请参见 [这里](https://github.com/alexbelgium/hassio-addons/blob/master/birdnet-pi/README_standalone.md)_

---

[birdnet-pi](https://github.com/Nachtzuster/BirdNET-Pi) 是一个用于持续鸟类监测和识别的 AI 解决方案，最初由 @mcguirepr89 在 GitHub 上开发 (https://github.com/mcguirepr89/BirdNET-Pi)，目前的工作由 @Nachtzuster 和其他开发者在一个活跃的分支上继续进行 (https://github.com/Nachtzuster/BirdNET-Pi)

附加组件的特性：
- 强大的基础镜像由 [linuxserver](https://github.com/linuxserver/docker-baseimage-debian) 提供
- 多亏于 https://github.com/gdraheim/docker-systemctl-replacement，工作 Docker 系统
- 使用 HA pulseaudio 服务器
- 使用 HA tmpfs 将临时文件存储在内存中，避免磁盘磨损
- 将所有配置文件暴露到 /config 以便于持久存储和轻松访问
- 允许修改存储鸟鸣的路径（最好是外部硬盘）
- 支持 ingress，以允许安全的远程访问而不暴露端口

## 配置

---

安装后，首次启动附加组件
Webui 可以通过两种方式找到：
- 从 HA 进行 Ingress（无密码，但某些功能无法使用）
- 直接访问 <http://homeassistant:port>，port 是在 birdnet.conf 中定义的端口。当询问密码时，用户名为 `birdnet`，密码是您可以在 birdnet.conf 中定义的密码（默认为空）。这与附加组件选项中的密码不同，必须使用该密码才能访问 Web 终端。

Web 终端访问：用户名 `pi`，密码：如附加组件选项中定义

您需要一个麦克风：可以使用连接到 HA 的麦克风或 rstp 摄像头的音频流。

选项可以通过三种方式进行配置：

- 附加组件选项

```yaml
BIRDSONGS_FOLDER: 存储鸟鸣文件的文件夹 # 如果要避免分析堵塞，应该是SSD
MQTT_DISABLED: 如果为真，禁用自动 MQTT 发布。仅在本地代理已经可用时有效
LIVESTREAM_BOOT_ENABLED: 从启动开始直播，还是从设置开始
PROCESSED_FOLDER_ENABLED: 如果启用，您需要在 birdnet.conf（或 birdnet 的设置中）设置临时文件夹 "/tmp/Processed" 中将保存的最后 wav 文件数量（以避免磁盘磨损）。这个数量可以从附加组件选项中调整
TZ: Etc/UTC 指定要使用的时区，请参阅 https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List
pi_password: 设置访问 Web 终端的用户密码
localdisks: sda1 #用逗号分隔的您的驱动器的硬件名称，或其标签。e.g. sda1, sdb1, MYNAS...
networkdisks: "//SERVER/SHARE" # 可选，要挂载的 smb 服务器列表，用逗号分隔
cifsusername: "username" # 可选，smb 用户名，所有 smb 共享相同
cifspassword: "password" # 可选，smb 密码
cifsdomain: "domain" # 可选，允许为 smb 共享设置域
```

- Config.yaml
可以使用在 /config/db21ed7f_birdnet-pi/config.yaml 中找到的 config.yaml 文件配置附加变量，使用 Filebrowser 附加组件

- Config_env.yaml
可以在这里配置附加环境变量

## 安装

---

安装此附加组件非常简单，与安装任何其他附加组件没有不同。

1. 将我的附加组件库添加到您的家庭助理实例中（在监督者附加组件商店右上角，或者如果您已配置我的 HA，请单击下面的按钮）
   [![打开您的 Home Assistant 实例并显示添加附加组件库对话框，预填充特定库 URL](https://my.home-assistant.io/badges/supervisor_add_addon_repository.svg)](https://my.home-assistant.io/redirect/supervisor_add_addon_repository/?repository_url=https%3A%2F%2Fgithub.com%2Falexbelgium%2Fhassio-addons)
2. 安装此附加组件。
3. 单击 `保存` 按钮以存储您的配置。
4. 根据您的偏好设置附加组件选项
5. 启动附加组件。
6. 检查附加组件的日志以查看是否一切顺利。
7. 打开 WebUI 并调整软件选项

## 与 HA 的集成

---
### Apprise

您可以使用 apprise 通过 mqtt 发送通知，然后使用 HomeAssistant 对其进行操作
进一步信息： https://wander.ingstar.com/projects/birdnetpi.html

### 自动 mqtt

如果已安装 mqtt，附加组件会在每次检测到物种时自动更新 birdnet 主题

## 使用 ssl

---

选项 1：安装 Let's Encrypt 附加组件，生成证书。它们默认是 certfile.pem 和 keyfile.pem，存储在 /ssl 中。只需在附加组件选项中启用 ssl，它就会工作。

选项 2：启用端口 80，将您的 BirdNET-Pi URL 定义为 https。证书将由 caddy 自动生成

## 改善检测

---

### 声卡增益

在终端选项卡中使用 alsamixer，确保音量足够高但不太高（不要进入红色区域）
https://github.com/mcguirepr89/BirdNET-Pi/wiki/Adjusting-your-sound-card

### 铁氧体

在我的案例中，添加铁氧体珠会导致更糟的噪声

### AUX 转 USB 适配器

根据我的测试，只有使用 KT0210（例如 Ugreen 的适配器）才能工作。我无法让基于 ALC 的适配器被检测到。

### 麦克风比较

推荐的麦克风（[完整讨论在这里](https://github.com/mcguirepr89/BirdNET-Pi/discussions/39)）：
- Clippy EM272 (https://www.veldshop.nl/en/smart-clippy-em272z1-mono-omni-microphone.html) + ugreen AUX 转 USB 连接器：最佳灵敏度与领夹技术
- Boya By-LM40：最佳性价比
- Hyperx Quadcast：最佳灵敏度与心型指向技术

结论是，使用 Dahua 的麦克风就足够了，EM272 是最佳选择，但 Boya By-LM40 是一个非常好的折中选择，因为 birdnet 模型分析的是 0-15000Hz 范围

![image](https://github.com/alexbelgium/hassio-addons/assets/44178713/df992b79-7171-4f73-b0c0-55eb4256cd5b)

### 去噪 ([完整讨论在这里](https://github.com/mcguirepr89/BirdNET-Pi/discussions/597))

去噪在严肃的研究者中不受欢迎。然而，它似乎显著提高了检测质量！以下是如何在 HA 中实现它：
- 使用 Portainer 附加组件，进入 hassio_audio 容器，修改文件 /etc/pulse/system.pa，添加行 `load-module module-echo-cancel`
- 进入终端附加组件，输入 `ha audio restart`
- 在附加组件选项中选择取消回声的设备作为输入设备

### 高通滤波器

应避免使用，因为模型使用的是整个 0-15khz 范围

## 常见问题

尚未提供

## 支持

在 GitHub 上创建一个问题

---

![插图](https://raw.githubusercontent.com/tphakala/birdnet-pi/main/doc/birdnet-pi-dashboard.webp)