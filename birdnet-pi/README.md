## &#9888; 开放问题 : [🐛 [BattybirdNET-Pi Docker Standalone] 您无法编辑此安装的设置 (已打开 2025-03-26)](https://github.com/alexbelgium/hassio-addons/issues/1821) 由 [@Bongo2](https://github.com/Bongo2)

# Home Assistant 插件: birdnet-pi

[![捐赠][donation-badge]](https://www.buymeacoffee.com/alexbelgium)
[![捐赠][paypal-badge]](https://www.paypal.com/donate/?hosted_button_id=DZFULJZTP3UQA)

![版本](https://img.shields.io/badge/dynamic/json?label=Version&query=%24.version&url=https%3A%2F%2Fraw.githubusercontent.com%2Falexbelgium%2Fhassio-addons%2Fmaster%2Fbirdnet-pi%2Fconfig.json)
![入口](https://img.shields.io/badge/dynamic/json?label=Ingress&query=%24.ingress&url=https%3A%2F%2Fraw.githubusercontent.com%2Falexbelgium%2Fhassio-addons%2Fmaster%2Fbirdnet-pi%2Fconfig.json)
![架构](https://img.shields.io/badge/dynamic/json?color=success&label=Arch&query=%24.arch&url=https%3A%2F%2Fraw.githubusercontent.com%2Falexbelgium%2Fhassio-addons%2Fmaster%2Fbirdnet-pi%2Fconfig.json)

[![Codacy 评级徽章](https://app.codacy.com/project/badge/Grade/9c6cf10bdbba45ecb202d7f579b5be0e)](https://www.codacy.com/gh/alexbelgium/hassio-addons/dashboard?utm_source=github.com&utm_medium=referral&utm_content=alexbelgium/hassio-addons&utm_campaign=Badge_Grade)
[![GitHub Super-Linter](https://img.shields.io/github/actions/workflow/status/alexbelgium/hassio-addons/weekly-supelinter.yaml?label=Lint%20code%20base)](https://github.com/alexbelgium/hassio-addons/actions/workflows/weekly-supelinter.yaml)
[![构建器](https://img.shields.io/github/actions/workflow/status/alexbelgium/hassio-addons/onpush_builder.yaml?label=Builder)](https://github.com/alexbelgium/hassio-addons/actions/workflows/onpush_builder.yaml)

[donation-badge]: https://img.shields.io/badge/Buy%20me%20a%20coffee%20(no%20paypal)-%23d32f2f?logo=buy-me-a-coffee&style=flat&logoColor=white
[paypal-badge]: https://img.shields.io/badge/Buy%20me%20a%20coffee%20with%20Paypal-0070BA?logo=paypal&style=flat&logoColor=white

_感谢所有给我的回购加星的人！要加星请点击下面的图像，然后它将出现在右上角。谢谢！_

[![@alexbelgium/hassio-addons 的星标用户列表](https://raw.githubusercontent.com/alexbelgium/hassio-addons/master/.github/stars2.svg)](https://github.com/alexbelgium/hassio-addons/stargazers)

![下载演变](https://raw.githubusercontent.com/alexbelgium/hassio-addons/master/birdnet-pi/stats.png)

## 关于

_注意 : 若要在没有 Home Assistant 的情况下使用 (经典的 docker 容器)，请见 [这里](https://github.com/alexbelgium/hassio-addons/blob/master/birdnet-pi/README_standalone.md)_

---

[birdnet-pi](https://github.com/Nachtzuster/BirdNET-Pi) 是一种用于持续鸟类监测和识别的人工智能解决方案，最初由 @mcguirepr89 在 GitHub 上开发 (https://github.com/mcguirepr89/BirdNET-Pi)，其工作由 @Nachtzuster 和其他开发者在一个活跃的分支上继续进行 (https://github.com/Nachtzuster/BirdNET-Pi)

插件的功能：
- 由 [linuxserver](https://github.com/linuxserver/docker-baseimage-debian) 提供的强大基础镜像
- 感谢 https://github.com/gdraheim/docker-systemctl-replacement，工作中的 docker 系统
- 使用 HA 脉冲音频服务器
- 使用 HA tmpfs 将临时文件存储在内存中，以避免磁盘磨损
- 将所有配置文件暴露到 /config，以便持久性和轻松访问
- 允许修改存储鸟类歌曲的位置（最好是外部硬盘）
- 支持 ingress，允许安全远程访问而无需暴露端口

## 配置

---

安装后，首次启动插件
Web UI 可以通过两种方式找到：
- 从 HA 入口（没有密码，但某些功能无法工作）
- 通过直接访问 <http://homeassistant:port>，端口是 birdnet.conf 中定义的端口。当被要求输入密码时，用户名为 `birdnet`，密码是您可以在 birdnet.conf 中定义的密码（默认为空）。这与插件选项中的密码不同，后者是用于访问 Web 终端的密码。

Web 终端访问：用户名 `pi`，密码：如插件选项中定义

您需要一个麦克风：可以使用连接到 HA 的麦克风或 rstp 摄像头的音频流。

可以通过三种方式配置选项：

- 插件选项

```yaml
BIRDSONGS_FOLDER: 存储鸟歌曲文件的文件夹 # 如果您想避免分析堵塞，最好是一个 SSD
MQTT_DISABLED : 如果为真，则禁用自动 mqtt 发布。仅在本地代理可用时有效
LIVESTREAM_BOOT_ENABLED: 从启动开始直播，或从设置开始
PROCESSED_FOLDER_ENABLED : 如果启用，则需要在 birdnet.conf (或 birdnet 的设置) 中设置要保存在临时文件夹 "/tmp/Processed" 中的最后 wav 文件数量（因此不会磨损磁盘），以防您想要检索它们。此数量可以在插件选项中进行调整
TZ: Etc/UTC 指定要使用的时区，见 https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List
pi_password: 设置用户密码以访问 Web 终端
localdisks: sda1 # 将驱动器挂载的硬件名称用逗号分隔，或者其标签。例：sda1, sdb1, MYNAS...
networkdisks: "//SERVER/SHARE" # 可选，挂载的 smb 服务器列表，用逗号分隔
cifsusername: "用户名" # 可选，smb 用户名，所有 smb 共享相同
cifspassword: "密码" # 可选，smb 密码
cifsdomain: "域" # 可选，允许设置 smb 共享的域
```

- Config.yaml
可以通过 /config/db21ed7f_birdnet-pi/config.yaml 中找到的 config.yaml 文件使用其他变量进行配置，使用 Filebrowser 插件。

- Config_env.yaml
可以在那里配置其他环境变量。

## 安装

---

此插件的安装非常简单，与安装其他插件没有什么不同。

1. 将我的插件存储库添加到您的 home assistant 实例（在主管插件商店的右上角，或者如果您已配置了我的 HA，请点击下面的按钮）
   [![打开您的 Home Assistant 实例并显示添加插件存储库对话框，预填充特定存储库 URL。](https://my.home-assistant.io/badges/supervisor_add_addon_repository.svg)](https://my.home-assistant.io/redirect/supervisor_add_addon_repository/?repository_url=https%3A%2F%2Fgithub.com%2Falexbelgium%2Fhassio-addons)
2. 安装此插件。
3. 点击 `保存` 按钮以存储您的配置。
4. 根据您的喜好设置插件选项
5. 启动插件。
6. 检查插件的日志以查看是否一切正常。
7. 打开 WebUI 并调整软件选项。

## 与 HA 的集成

---
### Apprise

您可以使用 apprise 通过 mqtt 发送通知，然后使用 HomeAssistant 对它们进行操作。
进一步的信息： https://wander.ingstar.com/projects/birdnetpi.html

### 自动 mqtt

如果安装了 mqtt，插件会在每次检测到物种时自动更新 birdnet 主题。

## 使用 ssl

---

选项 1 : 安装 Let's Encrypt 插件，生成证书。默认情况下，它们是存储在 /ssl 中的 certfile.pem 和 keyfile.pem。只需通过插件选项启用 ssl，它就会工作。

选项 2 : 启用 80 端口，将您的 BirdNET-Pi URL 定义为 https。证书将由 caddy 自动生成。

## 提升检测

---

### 增益调节

在终端标签中使用 alsamixer，确保音量足够高但不要过高（不在红色部分）
https://github.com/mcguirepr89/BirdNET-Pi/wiki/Adjusting-your-sound-card

### 铁氧体

在我的情况下，添加铁氧体珠导致更糟的噪音。

### AUX 到 USB 适配器

根据我的测试，仅使用 KT0210 的适配器（如 Ugreen 的）有效。我无法让基于 ALC 的适配器被检测到。

### 麦克风比较

推荐的麦克风（[完整讨论在此](https://github.com/mcguirepr89/BirdNET-Pi/discussions/39)）：
- Clippy EM272 (https://www.veldshop.nl/en/smart-clippy-em272z1-mono-omni-microphone.html) + ugreen aux 到 usb 连接器：最佳灵敏度与领夹麦克风技术
- Boya By-LM40 : 性价比最佳
- Hyperx Quadcast : 采用心形指向性的最佳灵敏度

结论是，使用 Dahua 的麦克风已经足够好，EM272 是最佳选择，而 Boya by-lm40 是一个非常不错的折中方案，因为 birdnet 模型分析的是 0-15000Hz 范围内的声音。

![image](https://github.com/alexbelgium/hassio-addons/assets/44178713/df992b79-7171-4f73-b0c0-55eb4256cd5b)

### 降噪 ([完整讨论在此](https://github.com/mcguirepr89/BirdNET-Pi/discussions/597))

降噪在严肃研究者中不被赞成。然而，它似乎确实显著提高了检测的质量！以下是在 HA 中实现的方法：
- 使用 Portainer 插件，进入 hassio_audio 容器，修改文件 /etc/pulse/system.pa，添加行 `load-module module-echo-cancel`
- 转到终端插件，输入 `ha audio restart`
- 在插件选项中选择回声取消的设备作为输入设备。

### 高通滤波

应避免使用，因为模型使用整个 0-15khz 范围。

## 常见问题

尚不可用。

## 支持

在 GitHub 上创建一个问题。

---

![插图](https://raw.githubusercontent.com/tphakala/birdnet-pi/main/doc/birdnet-pi-dashboard.webp)