## &#9888; 打开问题 : [🐛 [BattybirdNET-Pi Docker 独立] 您无法编辑此安装的设置 (开启于2025-03-26)](https://github.com/alexbelgium/hassio-addons/issues/1821) 作者 [@Bongo2](https://github.com/Bongo2)
# 家庭助手插件: battybirdnet-pi

[![捐赠][donation-badge]](https://www.buymeacoffee.com/alexbelgium)
[![捐赠][paypal-badge]](https://www.paypal.com/donate/?hosted_button_id=DZFULJZTP3UQA)

![版本](https://img.shields.io/badge/dynamic/json?label=Version&query=%24.version&url=https%3A%2F%2Fraw.githubusercontent.com%2Falexbelgium%2Fhassio-addons%2Fmaster%2Fbattybirdnet-pi%2Fconfig.json)
![入口](https://img.shields.io/badge/dynamic/json?label=Ingress&query=%24.ingress&url=https%3A%2F%2Fraw.githubusercontent.com%2Falexbelgium%2Fhassio-addons%2Fmaster%2Fbattybirdnet-pi%2Fconfig.json)
![架构](https://img.shields.io/badge/dynamic/json?color=success&label=Arch&query=%24.arch&url=https%3A%2F%2Fraw.githubusercontent.com%2Falexbelgium%2Fhassio-addons%2Fmaster%2Fbattybirdnet-pi%2Fconfig.json)

[![Codacy 勋章](https://app.codacy.com/project/badge/Grade/9c6cf10bdbba45ecb202d7f579b5be0e)](https://www.codacy.com/gh/alexbelgium/hassio-addons/dashboard?utm_source=github.com&utm_medium=referral&utm_content=alexbelgium/hassio-addons&utm_campaign=Badge_Grade)
[![GitHub Super-Linter](https://img.shields.io/github/actions/workflow/status/alexbelgium/hassio-addons/weekly-supelinter.yaml?label=Lint%20code%20base)](https://github.com/alexbelgium/hassio-addons/actions/workflows/weekly-supelinter.yaml)
[![构建器](https://img.shields.io/github/actions/workflow/status/alexbelgium/hassio-addons/onpush_builder.yaml?label=Builder)](https://github.com/alexbelgium/hassio-addons/actions/workflows/onpush_builder.yaml)

[donation-badge]: https://img.shields.io/badge/Buy%20me%20a%20coffee%20(no%20paypal)-%23d32f2f?logo=buy-me-a-coffee&style=flat&logoColor=white
[paypal-badge]: https://img.shields.io/badge/Buy%20me%20a%20coffee%20with%20Paypal-0070BA?logo=paypal&style=flat&logoColor=white

_感谢所有给我仓库加星的朋友！要加星，请点击下面的图片，然后它将位于右上角。谢谢！_

[![@alexbelgium/hassio-addons 的星标倉庫名單](https://raw.githubusercontent.com/alexbelgium/hassio-addons/master/.github/stars2.svg)](https://github.com/alexbelgium/hassio-addons/stargazers)

![下载演变](https://raw.githubusercontent.com/alexbelgium/hassio-addons/master/BirdNET-Pi/stats.png)

## 关于

---

[battybirdnet-pi](https://github.com/rdz-oss/BattyBirdNET-Pi) 是一个为 Raspberry Pi 4/5 构建的实时声学蝙蝠与鸟类分类系统，基于 BattyBirdNET-Analyzer。

插件的特点：
- 由 [linuxserver](https://github.com/linuxserver/docker-baseimage-debian) 提供的稳健基础镜像
- 得益于 https://github.com/gdraheim/docker-systemctl-replacement 的工作 Docker 系统
- 使用 HA pulseaudio 服务器
- 使用 HA tmpfs 将临时文件存储在内存中，避免磁盘磨损
- 将所有配置文件暴露到 /config，以便持久性和便于访问
- 允许修改存储鸟鸣的地点（最好是外接硬盘）
- 支持入口，允许安全的远程访问而不暴露端口

## 配置

---

安装后，第一次启动插件
Webui可以通过两种方式找到：
- 从 HA 进入（无密码但某些功能无法使用）
- 通过 <http://homeassistant:port> 直接访问，端口为 birdnet.conf 中定义的端口。当要求提供密码时，用户名是 `birdnet`，密码是您可以在 birdnet.con 中定义的（默认空白）。这与插件选项中的密码不同，后者是用于访问 web 终端的密码。

Web 终端访问：用户名 `pi`，密码：如插件选项中定义。

您需要一个麦克风：可以使用连接到 HA 的麦克风或 RSTP 摄像头的音频流。

选项可以通过以下三种方式进行配置：

- 插件选项

```yaml
BIRDSONGS_FOLDER: 存储鸟鸣文件的文件夹 # 如果您想避免分析堵塞，应该是一个 SSD
MQTT_DISABLED : 如果为真，禁用自动 MQTT 发布。仅当本地代理可用时有效
LIVESTREAM_BOOT_ENABLED: 从启动开始直播，或从设置开始
PROCESSED_FOLDER_ENABLED : 如果启用，您需要在 birdnet.conf（或 birdnet 的设置）中设置将在 tmpfs 中的临时文件夹 "/tmp/Processed" 中保存的最后几个 wav 文件的数量（以避免磁盘磨损），如果您想检索它们。此数量可以从插件选项中进行调整
TZ: Etc/UTC 指定要使用的时区，参见 https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List
pi_password: 设置用户密码以访问 web 终端
localdisks: sda1 # 将要挂载的驱动器的硬件名称用逗号分隔，或其标签。例：sda1, sdb1, MYNAS...
networkdisks: "//SERVER/SHARE" # 可选，要挂载的 smb 服务器列表，用逗号分隔
cifsusername: "用户名" # 可选，smb 用户名，对所有 smb 共享相同
cifspassword: "密码" # 可选，smb 密码
cifsdomain: "域" # 可选，允许为 smb 共享设置域
```

- Config.yaml
可以使用在 /config/db21ed7f_battybirdnet-pi/config.yaml 中找到的 config.yaml 文件配置附加变量，使用文件浏览器插件

- Config_env.yaml
可以在此配置附加环境变量

## 安装

---

安装此插件相当简单，与安装其他插件并无不同。

1. 将我的插件仓库添加到您的家庭助手实例中（在监督员插件商店右上角，或如果您已配置我的 HA，请单击下面按钮）
   [![打开您的 Home Assistant 实例并显示添加插件仓库对话框，预填充特定仓库 URL。](https://my.home-assistant.io/badges/supervisor_add_addon_repository.svg)](https://my.home-assistant.io/redirect/supervisor_add_addon_repository/?repository_url=https%3A%2F%2Fgithub.com%2Falexbelgium%2Fhassio-addons)
2. 安装此插件。
3. 点击 `保存` 按钮以存储您的配置。
4. 将插件选项设置为您的偏好。
5. 启动插件。
6. 检查插件的日志以查看一切是否顺利。
7. 打开 webUI，调整软件选项

## 与 HA 的集成

---
### Apprise

您可以使用 apprise 通过 mqtt 发送通知，然后通过 HomeAssistant 对其进行操作
更多信息： https://wander.ingstar.com/projects/birdnetpi.html

### 自动 mqtt

如果安装了 mqtt，插件将在检测到的每个物种上自动更新 birdnet 主题

## 使用 ssl

---

选项 1：安装 Let's Encrypt 插件，生成证书。默认情况下，证书为 certfile.pem 和 keyfile.pem，存储在 /ssl。只需从插件选项中启用 ssl 即可工作。

选项 2：启用 80 端口，将您的 battybirdnet-pi URL 定义为 https。证书将由 Caddy 自动生成。

## 提高检测效果

---

### 卡片增益

在终端选项卡中使用 alsamixer，确保音量足够高，但不要太高（不要进入红色区域）
https://github.com/mcguirepr89/BirdNET-Pi/wiki/Adjusting-your-sound-card

### 铁氧体

添加铁氧体珠在我的情况下导致更糟的噪音

### Aux 到 usb 适配器

根据我的测试，只有使用 KT0210（如 Ugreen 的）适配器才有效。我无法检测到基于 ALC 的适配器。

### 麦克风比较

推荐的麦克风（[完整讨论在这里](https://github.com/mcguirepr89/BirdNET-Pi/discussions/39)）：
- Clippy EM272 (https://www.veldshop.nl/en/smart-clippy-em272z1-mono-omni-microphone.html) + ugreen aux to usb 连接器：最佳灵敏度，采用领夹麦克风技术
- Boya By-LM40：最佳性价比
- Hyperx Quadcast：最佳灵敏度，采用心形指向技术

结论，使用 Dahua 的麦克风已经足够好，EM272 是最佳选择，但 Boya By-LM40 是一个非常好的折衷，因为鸟类检测模型分析的是 0-15000Hz 范围。

![图片](https://github.com/alexbelgium/hassio-addons/assets/44178713/df992b79-7171-4f73-b0c0-55eb4256cd5b)

### 噪声消除 ([完整讨论在这里](https://github.com/mcguirepr89/BirdNET-Pi/discussions/597))

噪声消除在严肃的研究者中不受欢迎。然而，它确实似乎显著提高了检测质量！在 HA 中可以这样做：
- 使用 Portainer 插件，进入 hassio_audio 容器，修改文件 /etc/pulse/system.pa，添加行 `load-module module-echo-cancel`
- 进入终端插件，输入 `ha audio restart`
- 在插件选项中将回声消除设备选为输入设备

### 高通滤波

应避免使用，因为该模型使用整个 0-15kHz 范围。

## 常见问题

目前尚未提供。

## 支持

在 GitHub 上创建一个问题

---