## &#9888; 开放问题 : [🐛 [BattybirdNET-Pi Docker 独立版] 您不能编辑此安装的设置 (创建于 2025-03-26)](https://github.com/alexbelgium/hassio-addons/issues/1821) by [@Bongo2](https://github.com/Bongo2)
# Home Assistant 插件: battybirdnet-pi

[![捐赠][donation-badge]](https://www.buymeacoffee.com/alexbelgium)
[![捐赠][paypal-badge]](https://www.paypal.com/donate/?hosted_button_id=DZFULJZTP3UQA)

![版本](https://img.shields.io/badge/dynamic/json?label=Version&query=%24.version&url=https%3A%2F%2Fraw.githubusercontent.com%2Falexbelgium%2Fhassio-addons%2Fmaster%2Fbattybirdnet-pi%2Fconfig.json)
![入口](https://img.shields.io/badge/dynamic/json?label=Ingress&query=%24.ingress&url=https%3A%2F%2Fraw.githubusercontent.com%2Falexbelgium%2Fhassio-addons%2Fmaster%2Fbattybirdnet-pi%2Fconfig.json)
![架构](https://img.shields.io/badge/dynamic/json?color=success&label=Arch&query=%24.arch&url=https%3A%2F%2Fraw.githubusercontent.com%2Falexbelgium%2Fhassio-addons%2Fmaster%2Fbattybirdnet-pi%2Fconfig.json)

[![Codacy Badge](https://app.codacy.com/project/badge/Grade/9c6cf10bdbba45ecb202d7f579b5be0e)](https://www.codacy.com/gh/alexbelgium/hassio-addons/dashboard?utm_source=github.com&utm_medium=referral&utm_content=alexbelgium/hassio-addons&utm_campaign=Badge_Grade)
[![GitHub Super-Linter](https://img.shields.io/github/actions/workflow/status/alexbelgium/hassio-addons/weekly-supelinter.yaml?label=Lint%20code%20base)](https://github.com/alexbelgium/hassio-addons/actions/workflows/weekly-supelinter.yaml)
[![构建器](https://img.shields.io/github/actions/workflow/status/alexbelgium/hassio-addons/onpush_builder.yaml?label=Builder)](https://github.com/alexbelgium/hassio-addons/actions/workflows/onpush_builder.yaml)

[donation-badge]: https://img.shields.io/badge/Buy%20me%20a%20coffee%20(no%20paypal)-%23d32f2f?logo=buy-me-a-coffee&style=flat&logoColor=white
[paypal-badge]: https://img.shields.io/badge/Buy%20me%20a%20coffee%20with%20Paypal-0070BA?logo=paypal&style=flat&logoColor=white

_感谢所有给我的仓库点赞的人！要点赞请点击下面的图片，之后会在右上角显示。谢谢！_

[![@alexbelgium/hassio-addons 的 Stargazers 仓库名单](https://raw.githubusercontent.com/alexbelgium/hassio-addons/master/.github/stars2.svg)](https://github.com/alexbelgium/hassio-addons/stargazers)

![下载演变](https://raw.githubusercontent.com/alexbelgium/hassio-addons/master/BirdNET-Pi/stats.png)

## 关于

---

[battybirdnet-pi](https://github.com/rdz-oss/BattyBirdNET-Pi) 是一个针对 Raspberry Pi 4/5 构建的实时声学蝙蝠和鸟类分类系统，基于 BattyBirdNET-Analyzer。

插件的特点：
- 由 [linuxserver](https://github.com/linuxserver/docker-baseimage-debian) 提供的稳健基础镜像
- 通过 https://github.com/gdraheim/docker-systemctl-replacement 实现的工作 docker 系统
- 使用 HA pulseaudio 服务器
- 使用 HA tmpfs 将临时文件存储在内存中以避免磁盘磨损
- 将所有配置文件暴露到 /config 以允许持久性和便捷访问
- 允许修改存储鸟类歌曲的位置（最好是外部硬盘）
- 支持入口，允许安全的远程访问而无需暴露端口

## 配置

---

安装后，首次启动插件
Webui 可通过两种方式找到：
- 从 HA 入口（无密码但某些功能无法使用）
- 通过 <http://homeassistant:port> 直接访问，端口是 birdnet.conf 中定义的端口。当提示输入密码时，用户名为 `birdnet`，密码是您可以在 birdnet.con 中定义的（默认为空）。此密码与插件选项中的密码不同，后者是访问 Web 终端时必须使用的密码。

Web 终端访问：用户名 `pi`，密码：根据插件选项定义

您需要一个麦克风：可以使用连接到 HA 的麦克风或 rstp 摄像头的音频流。

选项可以通过三种方式配置：

- 插件选项

```yaml
BIRDSONGS_FOLDER: 存储鸟鸣文件的文件夹 # 如果您想避免分析堵塞，它应该是一个 SSD
MQTT_DISABLED : 如果为真，则禁用自动 mqtt 发布。仅在已有本地代理的情况下有效
LIVESTREAM_BOOT_ENABLED: 从启动或从设置开始直播
PROCESSED_FOLDER_ENABLED : 如果启用，您需要在 birdnet.conf（或 birdnet 设置）中设置将在 tmpfs 中的临时文件夹 "/tmp/Processed" 中保存的最后 wav 文件数量（如此可以避免磁盘磨损），以便您随时取回。这一数额可以在插件选项中调整
TZ: Etc/UTC 指定要使用的时区，请参见 https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List
pi_password: 设置访问 Web 终端的用户密码
localdisks: sda1 # 将您的驱动器的硬件名称用逗号分隔地放入，或其标签。例如 sda1, sdb1, MYNAS...
networkdisks: "//SERVER/SHARE" # 可选，要挂载的 smb 服务器列表，用逗号分隔
cifsusername: "用户名" # 可选，smb 用户名，所有 smb 共享共用
cifspassword: "密码" # 可选，smb 密码
cifsdomain: "域" # 可选，允许为 smb 共享设置域
```

- Config.yaml
可以使用在 /config/db21ed7f_battybirdnet-pi/config.yaml 中找到的 config.yaml 文件配置其他变量，使用 Filebrowser 插件。

- Config_env.yaml
可以在此配置其他环境变量。

## 安装

---

安装此插件相当简单，与安装任何其他插件没有区别。

1. 将我的插件仓库添加到您的 Home Assistant 实例（在 supervisor addons store 的右上角，或如果您已配置我的 HA，点击下面的按钮）
   [![打开您的 Home Assistant 实例并显示添加插件仓库对话框，预填充特定仓库 URL。](https://my.home-assistant.io/badges/supervisor_add_addon_repository.svg)](https://my.home-assistant.io/redirect/supervisor_add_addon_repository/?repository_url=https%3A%2F%2Fgithub.com%2Falexbelgium%2Fhassio-addons)
2. 安装此插件。
3. 点击 `保存` 按钮以存储您的配置。
4. 设置插件选项以满足您的偏好
5. 启动插件。
6. 检查插件的日志，以查看一切是否正常。
7. 打开 WebUI 并调整软件选项。

## 与 HA 集成

---
### Apprise

您可以使用 apprise 通过 mqtt 发送通知，然后在 HomeAssistant 中对此进行操作。
更多信息请参考 : https://wander.ingstar.com/projects/birdnetpi.html

### 自动 mqtt

如果安装了 mqtt，插件会在每次检测到物种时自动更新 birdnet 主题。

## 使用 ssl

---

选项 1：安装 let's encrypt 插件，生成证书。默认存储在 /ssl 的 certfile.pem 和 keyfile.pem。只需在插件选项中启用 ssl，它将生效。

选项 2：启用 80 端口，定义您的 battybirdnet-pi URL 为 https。证书将由 caddy 自动生成。

## 提高检测效果

---

### 卡的增益

在终端标签页使用 alsamixer，确保音量足够高但不过高（不在红色区域）
https://github.com/mcguirepr89/BirdNET-Pi/wiki/Adjusting-your-sound-card

### 铁氧体

根据我的经验，添加铁氧体珠会导致更差的噪声。

### Aux 到 usb 转接器

根据我的测试，只有使用 KT0210（例如 Ugreen 产品）的转接器可用。我无法使基于 ALC 的转接器被检测到。

### 麦克风比较

推荐的麦克风（[完整讨论在此](https://github.com/mcguirepr89/BirdNET-Pi/discussions/39)）：
- Clippy EM272 (https://www.veldshop.nl/en/smart-clippy-em272z1-mono-omni-microphone.html) + ugreen aux 到 usb 连接器：最好的灵敏度，使用领夹技术
- Boya By-LM40 : 性价比最高
- Hyperx Quadcast : 最好的灵敏度，使用心形指向技术

结论，使用 Dahua 的麦克风已经足够好，EM272 是最佳选择，但 Boya by-lm40 是一个非常好的折中选择，因为鸟类检测模型分析了 0-15000Hz 范围。

![image](https://github.com/alexbelgium/hassio-addons/assets/44178713/df992b79-7171-4f73-b0c0-55eb4256cd5b)

### 降噪 ([完整讨论在此](https://github.com/mcguirepr89/BirdNET-Pi/discussions/597))

降噪在严谨的研究者中受到批评。但是它似乎确实显著提高了检测质量！在 HA 中的方法如下：
- 使用 Portainer 插件，进入 hassio_audio 容器，修改 /etc/pulse/system.pa 文件添加行 `load-module module-echo-cancel`
- 进入终端插件，输入 `ha audio restart`
- 在插件选项中选择回声取消设备作为输入设备。

### 高通滤波

应避免使用，因为模型使用整个 0-15khz 范围。

## 常见问题

尚未提供。

## 支持

在 GitHub 上创建一个问题。