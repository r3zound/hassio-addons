# 家庭助手插件：battybirdnet-pi

[![捐赠][donation-badge]](https://www.buymeacoffee.com/alexbelgium)
[![捐赠][paypal-badge]](https://www.paypal.com/donate/?hosted_button_id=DZFULJZTP3UQA)

![版本](https://img.shields.io/badge/dynamic/json?label=版本&query=%24.version&url=https%3A%2F%2Fraw.githubusercontent.com%2Falexbelgium%2Fhassio-addons%2Fmaster%2Fbattybirdnet-pi%2Fconfig.json)
![入口](https://img.shields.io/badge/dynamic/json?label=入口&query=%24.ingress&url=https%3A%2F%2Fraw.githubusercontent.com%2Falexbelgium%2Fhassio-addons%2Fmaster%2Fbattybirdnet-pi%2Fconfig.json)
![架构](https://img.shields.io/badge/dynamic/json?color=success&label=架构&query=%24.arch&url=https%3A%2F%2Fraw.githubusercontent.com%2Falexbelgium%2Fhassio-addons%2Fmaster%2Fbattybirdnet-pi%2Fconfig.json)

[![Codacy Badge](https://app.codacy.com/project/badge/Grade/9c6cf10bdbba45ecb202d7f579b5be0e)](https://www.codacy.com/gh/alexbelgium/hassio-addons/dashboard?utm_source=github.com&utm_medium=referral&utm_content=alexbelgium/hassio-addons&utm_campaign=Badge_Grade)
[![GitHub Super-Linter](https://img.shields.io/github/actions/workflow/status/alexbelgium/hassio-addons/weekly-supelinter.yaml?label=代码质检)](https://github.com/alexbelgium/hassio-addons/actions/workflows/weekly-supelinter.yaml)
[![构建器](https://img.shields.io/github/actions/workflow/status/alexbelgium/hassio-addons/onpush_builder.yaml?label=构建器)](https://github.com/alexbelgium/hassio-addons/actions/workflows/onpush_builder.yaml)

[donation-badge]: https://img.shields.io/badge/给我买杯咖啡%20(没有%20paypal)-%23d32f2f?logo=buy-me-a-coffee&style=flat&logoColor=white
[paypal-badge]: https://img.shields.io/badge/用%20Paypal%20给我买杯咖啡-0070BA?logo=paypal&style=flat&logoColor=white

_感谢所有为我的仓库加星的人！要加星请点击下面的图片，然后它会显示在右上角。谢谢！_

[![为 @alexbelgium/hassio-addons 的 Stargazers 仓库名单](https://raw.githubusercontent.com/alexbelgium/hassio-addons/master/.github/stars2.svg)](https://github.com/alexbelgium/hassio-addons/stargazers)

![下载演变](https://raw.githubusercontent.com/alexbelgium/hassio-addons/master/BirdNET-Pi/stats.png)

## 关于

---

[battybirdnet-pi](https://github.com/rdz-oss/BattyBirdNET-Pi) 是一个基于 BattyBirdNET-Analyzer 的 Raspberry Pi 4/5 实时声学蝙蝠与鸟类分类系统。

插件的特点：
- 由 [linuxserver](https://github.com/linuxserver/docker-baseimage-debian) 提供的强大基础镜像
- 使用 https://github.com/gdraheim/docker-systemctl-replacement 提供的工作 docker 系统
- 使用 HA 的 pulseaudio 服务器
- 使用 HA 的 tmpfs 将临时文件存储在内存中以避免磁盘磨损
- 将所有配置文件公开到 /config 以实现持久性和便捷访问
- 允许修改存储鸟类歌曲的位置（最好是外接硬盘）
- 支持 ingress，以确保安全远程访问而不暴露端口

## 配置

---

安装后，第一次启动插件
Webui 可以通过两种方式找到：
- 从 HA 的入口（没有密码，但某些功能无法使用）
- 使用 <http://homeassistant:port> 直接访问，端口为在 birdnet.conf 中定义的端口。当要求输入密码时，用户名为 `birdnet`，密码为在 birdnet.con 中定义的密码（默认为空）。这与要访问 Web 终端所需的插件选项密码不同。

Web 终端访问：用户名 `pi`，密码：如插件选项中定义

您需要一个麦克风：可以使用连接到 HA 的麦克风或 rstp 摄像头的音频流。

可以通过三种方式配置选项：

- 插件选项

```yaml
BIRDSONGS_FOLDER: 存储鸟类歌曲文件的文件夹 # 如果想避免分析堵塞，应该是一个 SSD
MQTT_DISABLED : 如果为 true，则禁用自动 mqtt 发布。仅在有本地代理可用时有效
LIVESTREAM_BOOT_ENABLED: 从启动开始或从设置开始启动直播
PROCESSED_FOLDER_ENABLED : 如果启用，您需要在 birdnet.conf（或 birdnet 设置中）中设置要保存在 tmpfs 中临时文件夹 "/tmp/Processed" 中的最后 wav 文件数量（以避免磁盘磨损），以便您可以检索它们。此数量可以从插件选项中调整
TZ: Etc/UTC 指定要使用的时区，详见 https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List
pi_password: 设置访问 Web 终端的用户密码
localdisks: sda1 #将要挂载的硬盘的硬件名称用逗号分隔，或其标签。例：sda1, sdb1, MYNAS...
networkdisks: "//SERVER/SHARE" # 可选，要挂载的 smb 服务器列表，用逗号分隔
cifsusername: "用户名" # 可选，smb 用户名，所有 smb 共享均相同
cifspassword: "密码" # 可选，smb 密码
cifsdomain: "域" # 可选，允许为 smb 共享设置域
```

- Config.yaml
通过位于 /config/db21ed7f_battybirdnet-pi/config.yaml 的 config.yaml 文件可以配置其他变量，使用 Filebrowser 插件。

- Config_env.yaml
可以在这里配置其他环境变量。

## 安装

---

安装此插件非常简单，与安装其他插件没有区别。

1. 将我的插件仓库添加到您的家庭助手实例中（在管理插件商店的右上方，或如果您已配置好我的 HA，请单击下面的按钮）
   [![打开您的 Home Assistant 实例并显示添加插件仓库对话框，具体仓库 URL 预填写。](https://my.home-assistant.io/badges/supervisor_add_addon_repository.svg)](https://my.home-assistant.io/redirect/supervisor_add_addon_repository/?repository_url=https%3A%2F%2Fgithub.com%2Falexbelgium%2Fhassio-addons)
2. 安装此插件。
3. 点击 `保存` 按钮以存储您的配置。
4. 根据您的偏好设置插件选项
5. 启动插件。
6. 检查插件的日志以查看一切是否顺利。
7. 打开 WebUI 并调整软件选项。

## 与 HA 的集成

---
### Apprise

您可以使用 Apprise 通过 mqtt 发送通知，然后使用 HomeAssistant 对这些通知进行操作。
更多信息： https://wander.ingstar.com/projects/birdnetpi.html

### 自动 mqtt

如果已安装 mqtt，插件会在每次检测到物种时自动更新 birdnet 主题。

## 使用 ssl

---

选项 1：安装 Let's Encrypt 插件，生成证书。默认情况下，它们是存储在 /ssl 中的 certfile.pem 和 keyfile.pem。只需在插件选项中启用 ssl 即可生效。

选项 2：启用 80 端口，将您的 battybirdnet-pi URL 定义为 https。证书将由 caddy 自动生成。

## 改善检测

---

### 卡的增益

在终端选项卡中使用 alsamixer，确保音量水平足够高但不要过高（不要在红色部分）
https://github.com/mcguirepr89/BirdNET-Pi/wiki/Adjusting-your-sound-card

### 铁氧体

添加铁氧体珠导致我这边的噪音变得更糟。

### AUX 到 USB 适配器

根据我的测试，只有使用 KT0210（如 Ugreen 的）的适配器有效。我无法检测到基于 ALC 的适配器。

### 麦克风比较

推荐的麦克风（[完整讨论见此](https://github.com/mcguirepr89/BirdNET-Pi/discussions/39)）:
- Clippy EM272 (https://www.veldshop.nl/en/smart-clippy-em272z1-mono-omni-microphone.html) + ugreen aux 转 USB 连接器：最佳灵敏度与领夹技术相结合
- Boya By-LM40：最佳质量/价格比
- Hyperx Quadcast：最佳心型拾音技术灵敏度

结论，使用 Dahua 的麦克风相当不错，EM272 是最佳选择，但 Boya By-LM40 是一个非常好的折衷方案，因为鸟类模型分析的频率范围为 0-15000Hz。

![image](https://github.com/alexbelgium/hassio-addons/assets/44178713/df992b79-7171-4f73-b0c0-55eb4256cd5b)

### 去噪声 ([完整讨论见此](https://github.com/mcguirepr89/BirdNET-Pi/discussions/597))

去噪声在严谨的研究者中不被看好。然而，它确实似乎显著提高了检测质量！以下是在 HA 中的做法：
- 使用 Portainer 插件，进入 hassio_audio 容器，修改文件 /etc/pulse/system.pa，添加行 `load-module module-echo-cancel`
- 进入终端插件，输入 `ha audio restart`
- 在插件选项中选择回声消除设备作为输入设备

### 高通滤波

应避免使用，因为模型使用整个 0-15kHz 范围。

## 常见问题

尚未可用。

## 支持

在 GitHub 上创建问题。