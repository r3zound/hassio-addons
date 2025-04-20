## &#9888; 打开问题 : [🐛 [BattybirdNET-Pi Docker 独立版] 您无法编辑此安装的设置 (创建于 2025-03-26)](https://github.com/alexbelgium/hassio-addons/issues/1821) 由 [@Bongo2](https://github.com/Bongo2)

# Home Assistant 插件: birdnet-pi

[![捐赠][donation-badge]](https://www.buymeacoffee.com/alexbelgium)
[![捐赠][paypal-badge]](https://www.paypal.com/donate/?hosted_button_id=DZFULJZTP3UQA)

![版本](https://img.shields.io/badge/dynamic/json?label=版本&query=%24.version&url=https%3A%2F%2Fraw.githubusercontent.com%2Falexbelgium%2Fhassio-addons%2Fmaster%2Fbirdnet-pi%2Fconfig.json)
![入口](https://img.shields.io/badge/dynamic/json?label=入口&query=%24.ingress&url=https%3A%2F%2Fraw.githubusercontent.com%2Falexbelgium%2Fhassio-addons%2Fmaster%2Fbirdnet-pi%2Fconfig.json)
![架构](https://img.shields.io/badge/dynamic/json?color=success&label=架构&query=%24.arch&url=https%3A%2F%2Fraw.githubusercontent.com%2Falexbelgium%2Fhassio-addons%2Fmaster%2Fbirdnet-pi%2Fconfig.json)

[![Codacy 徽章](https://app.codacy.com/project/badge/Grade/9c6cf10bdbba45ecb202d7f579b5be0e)](https://www.codacy.com/gh/alexbelgium/hassio-addons/dashboard?utm_source=github.com&utm_medium=referral&utm_content=alexbelgium/hassio-addons&utm_campaign=Badge_Grade)
[![GitHub 超级 Linter](https://img.shields.io/github/actions/workflow/status/alexbelgium/hassio-addons/weekly-supelinter.yaml?label=Lint%20代码%20库)](https://github.com/alexbelgium/hassio-addons/actions/workflows/weekly-supelinter.yaml)
[![构建器](https://img.shields.io/github/actions/workflow/status/alexbelgium/hassio-addons/onpush_builder.yaml?label=构建器)](https://github.com/alexbelgium/hassio-addons/actions/workflows/onpush_builder.yaml)

[donation-badge]: https://img.shields.io/badge/请给我喝杯咖啡%20(不%20支持%20paypal)-%23d32f2f?logo=buy-me-a-coffee&style=flat&logoColor=white
[paypal-badge]: https://img.shields.io/badge/用%20Paypal%20请我喝咖啡-0070BA?logo=paypal&style=flat&logoColor=white

_感谢所有给我的仓库加星的人！要加星，请点击下面的图像，然后它将在右上角。谢谢！_

[![为 @alexbelgium/hassio-addons 的 Stargazers 仓库名单](https://raw.githubusercontent.com/alexbelgium/hassio-addons/master/.github/stars2.svg)](https://github.com/alexbelgium/hassio-addons/stargazers)

![下载演变](https://raw.githubusercontent.com/alexbelgium/hassio-addons/master/birdnet-pi/stats.png)

## 关于

_注意 : 有关在没有 HomeAssistant 的情况下使用，请参见 [这里](https://github.com/alexbelgium/hassio-addons/blob/master/birdnet-pi/README_standalone.md)_

---

[birdnet-pi](https://github.com/Nachtzuster/BirdNET-Pi) 是一个用于持续鸟类监测和识别的 AI 解决方案，最初由 @mcguirepr89 在 GitHub 上开发 (https://github.com/mcguirepr89/BirdNET-Pi)，其工作由 @Nachtzuster 和其他开发者在一个活跃的分支上继续 (https://github.com/Nachtzuster/BirdNET-Pi)

插件的特点：
- 由 [linuxserver](https://github.com/linuxserver/docker-baseimage-debian) 提供的强大基础镜像
- 多亏 https://github.com/gdraheim/docker-systemctl-replacement，能够工作的 docker 系统
- 使用 HA pulseaudio 服务器
- 使用 HA tmpfs 在内存中存储临时文件，避免磁盘磨损
- 将所有配置文件暴露到 /config，以便于持久化和轻松访问
- 允许修改存储鸟叫声的地点（最好是外部 HDD）
- 支持入口，允许安全的远程访问而无需公开端口

## 配置

---

安装后，第一次启动插件
Webui 可以通过两种方式找到：
- 从 HA 入口（没有密码，但某些功能不起作用）
- 通过 <http://homeassistant:port> 直接访问，端口是 birdnet.conf 中定义的那个。当请求输入密码时，用户名为 `birdnet`，密码是您可以在 birdnet.conf 中定义的内容（默认为空）。这与插件选项中的密码不同，插件选项中的密码用于访问 Web 终端。

Web 终端访问：用户名 `pi`，密码：在插件选项中定义的内容。

您需要一个麦克风：可以使用连接到 HA 的麦克风或 RSTP 摄像头的音频流。

可以通过三种方式配置选项：

- 插件选项

```yaml
BIRDSONGS_FOLDER: 存储鸟叫声文件的文件夹 # 如果您希望避免分析堵塞，应该是 SSD
MQTT_DISABLED : 如果为 true，则禁用自动 mqtt 发布。仅在本地代理已可用时有效
LIVESTREAM_BOOT_ENABLED: 启动时从开机启动直播，或从设置中启动
PROCESSED_FOLDER_ENABLED : 如果启用，您需要在 birdnet.conf（或 birdnet 的设置中）设置将保存在临时文件夹“/tmp/Processed”中的最后若干个 wav 文件的数量（因此不会有磁盘磨损）以便您想要检索它们。这个数量可以从插件选项中进行调整
TZ: 具体时区指定，参见 https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List
pi_password: 设置用户密码以访问 web 终端
localdisks: sda1 #将您要挂载的硬盘驱动器的硬件名称用逗号分开，或其标签。例如 sda1, sdb1, MYNAS...
networkdisks: "//SERVER/SHARE" # 可选，要挂载的 smb 服务器列表，用逗号分隔
cifsusername: "用户名" # 可选，smb 用户名，对于所有 smb 共享相同
cifspassword: "密码" # 可选，smb 密码
cifsdomain: "域" # 可选，允许为 smb 共享设置域
```

- Config.yaml
您可以使用在 /config/db21ed7f_birdnet-pi/config.yaml 中找到的 config.yaml 文件配置其他变量，使用 Filebrowser 插件。

- Config_env.yaml
可以在此配置其他环境变量。

## 安装

---

这个插件的安装相当简单，与安装其他插件没有区别。

1. 将我的插件库添加到您的 Home Assistant 实例中（在超级用户插件商店的右上角，或者如果您已配置我的 HA，请单击下面的按钮）
   [![打开您的 Home Assistant 实例并显示添加插件库对话框，具体库 URL 预填充。](https://my.home-assistant.io/badges/supervisor_add_addon_repository.svg)](https://my.home-assistant.io/redirect/supervisor_add_addon_repository/?repository_url=https%3A%2F%2Fgithub.com%2Falexbelgium%2Fhassio-addons)
2. 安装该插件。
3. 点击 `保存` 按钮以存储您的配置。
4. 根据您的偏好设置插件选项。
5. 启动插件。
6. 检查插件的日志以查看一切是否顺利。
7. 打开 webUI 并调整软件选项。

## 与 HA 的集成

---
### Apprise

您可以使用 apprise 通过 mqtt 发送通知，然后在 HomeAssistant 中进行处理。
更多信息： https://wander.ingstar.com/projects/birdnetpi.html

### 自动 mqtt

如果安装了 mqtt，插件将在每次检测到物种时自动更新 birdnet 主题。

## 使用 ssl

---

选项 1 : 安装 let's encrypt 插件，生成证书。默认情况下，它们存储在 /ssl 中，文件名为 certfile.pem 和 keyfile.pem。只需在插件选项中启用 ssl 即可使用。

选项 2 : 启用 80 端口，将您的 BirdNET-Pi URL 定义为 https。证书将由 caddy 自动生成。

## 改进检测

---

### 增益调整

在终端选项卡中使用 alsamixer，确保音量足够高但不要过高（不在红色区域）。
https://github.com/mcguirepr89/BirdNET-Pi/wiki/Adjusting-your-sound-card

### 铁氧体

在我的情况下，添加铁氧体珠会导致更差的噪音。

### Aux 转 usb 适配器

根据我的测试，只有使用 KT0210（如 Ugreen 的）适配器有效。我无法检测基于 ALC 的适配器。

### 麦克风比较

推荐的麦克风（[完整讨论在这里](https://github.com/mcguirepr89/BirdNET-Pi/discussions/39)）：
- Clippy EM272 (https://www.veldshop.nl/en/smart-clippy-em272z1-mono-omni-microphone.html) + ugreen aux to usb 连接器：最佳灵敏度的领夹式麦克风
- Boya By-LM40 : 最佳性价比
- Hyperx Quadcast : 最佳灵敏度的心形拾音技术

结论：使用来自 Dahua 的麦克风已经足够好，EM272 是最佳选择，但 Boya by-lm40 是一个非常好的折中选择，因为 birdnet 模型分析的是 0-15000Hz 频率范围。

![image](https://github.com/alexbelgium/hassio-addons/assets/44178713/df992b79-7171-4f73-b0c0-55eb4256cd5b)

### 降噪 ([完整讨论在这里](https://github.com/mcguirepr89/BirdNET-Pi/discussions/597))

降噪在严肃的研究者中不受欢迎。然而，它确实似乎显著提高了检测质量！在 HA 中进行降噪的方法：
- 使用 Portainer 插件，进入 hassio_audio 容器，并修改文件 /etc/pulse/system.pa，添加行 `load-module module-echo-cancel`
- 进入终端插件，输入 `ha audio restart`
- 在插件选项中选择被降噪设备作为输入设备。

### 高通滤波

应该避免，因为模型使用整个 0-15khz 范围。

## 常见问题

尚未提供。

## 支持

在 GitHub 上创建一个问题。

---

![插图](https://raw.githubusercontent.com/tphakala/birdnet-pi/main/doc/birdnet-pi-dashboard.webp)