## &#9888; 开放问题 : [🐛 [BattybirdNET-Pi Docker 独立版] 您无法编辑此安装的设置 (已打开于 2025-03-26)](https://github.com/alexbelgium/hassio-addons/issues/1821) 由 [@Bongo2](https://github.com/Bongo2)
# 家庭助手插件: battybirdnet-pi

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

_感谢所有给我的仓库加星的人！要加星，请点击下方图片，然后它将出现在右上角。谢谢！_

[![给 @alexbelgium/hassio-addons 的 Stargazers 仓库名单](https://raw.githubusercontent.com/alexbelgium/hassio-addons/master/.github/stars2.svg)](https://github.com/alexbelgium/hassio-addons/stargazers)

![下载演变](https://raw.githubusercontent.com/alexbelgium/hassio-addons/master/BirdNET-Pi/stats.png)

## 关于

---

[battybirdnet-pi](https://github.com/rdz-oss/BattyBirdNET-Pi) 是一个基于 BattyBirdNET-Analyzer 为 Raspberry Pi 4/5 构建的实时声学蝙蝠和鸟类分类系统。

插件的特点：
- 由 [linuxserver](https://github.com/linuxserver/docker-baseimage-debian) 提供的稳健基础镜像
- 借助 https://github.com/gdraheim/docker-systemctl-replacement 实现的工作 docker 系统
- 使用 HA pulseaudio 服务器
- 使用 HA tmpfs 在内存中存储临时文件以避免磁盘磨损
- 将所有配置文件暴露到 /config 以允许持久化和便捷访问
- 允许修改存储鸟鸣的位置信息（最好指向外部硬盘）
- 支持入口，实现安全的远程访问而不暴露端口

## 配置

---

安装后，首次启动插件
WebUI 可以通过两种方式找到：
- 从 HA 的入口访问（无密码，但某些功能无法使用）
- 直接访问 <http://homeassistant:port>，port 是在 birdnet.conf 中定义的。要求输入密码时，用户名为 `birdnet`，密码是您可以在 birdnet.conf 中定义的（默认为空）。这与插件选项中的密码不同，后者是访问 Web 终端时必须使用的密码。

Web 终端访问：用户名 `pi`，密码 : 按插件选项中定义的内容。

您需要一个麦克风：可以使用连接到 HA 的麦克风或 RSTP 摄像头的音频流。

选项可以通过三种方式配置：

- 插件选项

```yaml
BIRDSONGS_FOLDER: 存储鸟鸣文件的文件夹 # 如果您希望避免分析堵塞，应该是一个 ssd
MQTT_DISABLED : 如果为真，则禁用自动 mqtt 发布。仅在本地代理已可用时有效
LIVESTREAM_BOOT_ENABLED: 在引导时启动直播，或从设置启动
PROCESSED_FOLDER_ENABLED : 如果启用，您需要在 birdnet.conf（或 birdnet 的设置）中设置最后保存到临时文件夹 "/tmp/Processed" 中的 wav 文件数量（因此没有磁盘磨损），如果您希望检索它们。此数量可以从插件选项中调整
TZ: Etc/UTC 指定要使用的时区，请参阅 https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List
pi_password: 设置访问 Web 终端的用户密码
localdisks: sda1 #将您的驱动器的硬件名称用逗号分隔，或其标签。例如 sda1, sdb1, MYNAS...
networkdisks: "//SERVER/SHARE" # 可选，要挂载的 smb 服务器列表，用逗号分隔
cifsusername: "用户名" # 可选，smb 用户名，所有 smb 共享相同
cifspassword: "密码" # 可选，smb 密码
cifsdomain: "域" # 可选，允许为 smb 共享设置域
```

- Config.yaml
其他变量可以通过在 /config/db21ed7f_battybirdnet-pi/config.yaml 中找到的 config.yaml 文件进行配置，使用 Filebrowser 插件。

- Config_env.yaml
可以在这里配置其他环境变量。

## 安装

---

安装此插件相当简单，与安装其他任何插件没有区别。

1. 将我的插件库添加到您的家庭助手实例（在监督添加存储的右上角，或如果您已配置了我的 HA，则单击下面的按钮）
   [![打开您的 Home Assistant 实例并显示添加插件库对话框，具体库 URL 预填。](https://my.home-assistant.io/badges/supervisor_add_addon_repository.svg)](https://my.home-assistant.io/redirect/supervisor_add_addon_repository/?repository_url=https%3A%2F%2Fgithub.com%2Falexbelgium%2Fhassio-addons)
2. 安装此插件。
3. 单击 `保存` 按钮以存储您的配置。
4. 根据需要设置插件选项。
5. 启动插件。
6. 检查插件的日志以查看一切是否顺利进行。
7. 打开 WebUI 并调整软件选项。

## 与 HA 的集成

---
### Apprise

您可以使用 apprise 发送带有 mqtt 的通知，然后使用 HomeAssistant 对其进行操作
更多信息： https://wander.ingstar.com/projects/birdnetpi.html

### 自动 mqtt

如果安装了 mqtt，此插件会在每次检测到物种时自动更新 birdnet 主题。

## 使用 ssl

---

选项 1 : 安装 let's encrypt 插件，生成证书。默认情况下，它们是存储在 /ssl 中的 certfile.pem 和 keyfile.pem。只需从插件选项中启用 ssl，它将工作。

选项 2 : 启用 80 端口，将您的 battybirdnet-pi URL 定义为 https。证书将由 caddy 自动生成。

## 改善检测

---

### 音量设置

在终端标签页中使用 alsamixer，确保音量足够高但不太高（不要进入红色部分）。
https://github.com/mcguirepr89/BirdNET-Pi/wiki/Adjusting-your-sound-card

### 铁氧体

在我的案例中，添加铁氧体珠会导致更糟糕的噪音。

### Aux转usb适配器

根据我的测试，只有使用 KT0210 的适配器（例如 Ugreen 的）才能正常工作。我无法让基于 ALC 的适配器被检测到。

### 麦克风比较

推荐的麦克风（[完整讨论在此](https://github.com/mcguirepr89/BirdNET-Pi/discussions/39)）：
- Clippy EM272 (https://www.veldshop.nl/en/smart-clippy-em272z1-mono-omni-microphone.html) + Ugreen Aux 转 USB 连接器：最佳灵敏度，使用领夹技术
- Boya By-LM40 : 最佳性价比
- Hyperx Quadcast : 最佳灵敏度，使用心形指向技术

总结，使用 Dahua 的麦克风就足够了，EM272 是最佳选择，但 Boya By-LM40 是很好的折中，因为 birndet 模型分析 0-15000Hz 范围内的声音。

![图像](https://github.com/alexbelgium/hassio-addons/assets/44178713/df992b79-7171-4f73-b0c0-55eb4256cd5b)

### 降噪 ([完整讨论在此](https://github.com/mcguirepr89/BirdNET-Pi/discussions/597))

降噪受到严肃研究人员的反对。然而，它似乎显著提高了检测质量！在 HA 中进行降噪的方法：
- 使用 Portainer 插件，进入 hassio_audio 容器，并修改文件 /etc/pulse/system.pa，添加行 `load-module module-echo-cancel`
- 进入终端插件，输入 `ha audio restart`
- 在插件选项中选择回声消除设备作为输入设备。

### 高通滤波

应避免使用，因为模型使用整个 0-15khz 的频率范围。

## 常见问题

尚未可用。

## 支持

在 GitHub 上创建问题。