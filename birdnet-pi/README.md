# Home assistant 插件：birdnet-pi

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

_感谢每一个给我的仓库点赞的人！要点赞，请点击下面的图片，然后它会在右上角。谢谢！_

[![给 @alexbelgium/hassio-addons 的星标贡献者](https://raw.githubusercontent.com/alexbelgium/hassio-addons/master/.github/stars2.svg)](https://github.com/alexbelgium/hassio-addons/stargazers)

![下载演变](https://raw.githubusercontent.com/alexbelgium/hassio-addons/master/birdnet-pi/stats.png)

## 关于

_注意：如需在没有 HomeAssistant 的情况下使用（经典 Docker 容器），请见 [这里](https://github.com/alexbelgium/hassio-addons/blob/master/birdnet-pi/README_standalone.md)_

---

[birdnet-pi](https://github.com/Nachtzuster/BirdNET-Pi) 是一种用于持续鸟类监测和识别的 AI 解决方案，最初由 @mcguirepr89 在 GitHub 上开发 (https://github.com/mcguirepr89/BirdNET-Pi)，其工作现在由 @Nachtzuster 和其他开发人员在一个活跃的分支上继续进行 (https://github.com/Nachtzuster/BirdNET-Pi)

插件的特点：
- 由 [linuxserver](https://github.com/linuxserver/docker-baseimage-debian) 提供的强大基础映像
- 由于 https://github.com/gdraheim/docker-systemctl-replacement ，有效的 Docker 系统
- 使用 HA pulseaudio 服务器
- 使用 HA tmpfs 将临时文件存储在 RAM 中，避免硬盘磨损
- 将所有配置文件暴露到 /config，以允许持久性和便捷访问
- 允许更改存储鸟鸣声的位置（最好是外部硬盘）
- 支持入口，以允许在不暴露端口的情况下进行安全远程访问

## 配置

---

安装后首次启动插件
可以通过两种方式找到 Webui：
- 从 HA 访问（无密码，但某些功能无法使用）
- 直接访问 <http://homeassistant:port>，端口为 birdnet.conf 中定义的端口。当提示输入密码时，用户名为 `birdnet`，密码为您在 birdnet.con 中定义的密码（默认为空）。这与插件选项中的密码不同，后者是访问 Web 终端时必须使用的密码。

Web 终端访问：用户名 `pi`，密码：如插件选项中定义的那样

您需要一个麦克风：可以使用连接到 HA 的麦克风，或者使用 rstp 摄像头的音频流。

选项可以通过以下三种方式配置：

- 插件选项

```yaml
BIRDSONGS_FOLDER: 存储鸟鸣声音文件的文件夹 # 如果您想避免分析堵塞，应该使用 SSD
MQTT_DISABLED : 如果为 true，则禁用自动 MQTT 发布。仅在本地代理已可用时有效
LIVESTREAM_BOOT_ENABLED: 从启动开始直播，或从设置开始
PROCESSED_FOLDER_ENABLED : 如果启用，您需要在 birdnet.conf（或 birdnet 的设置）中设置临时文件夹“/tmp/Processed”中将保留的最后 wav 文件的数量（因此无硬盘磨损）。此数量可以通过插件选项调整
TZ: Etc/UTC 指定要使用的时区，见 https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List
pi_password: 设置访问 Web 终端的用户密码
localdisks: sda1 # 使用逗号分隔设备的硬件名称来挂载，或其标签，例如 sda1, sdb1, MYNAS...
networkdisks: "//SERVER/SHARE" # 可选，列出要挂载的 smb 服务器，以逗号分隔
cifsusername: "username" # 可选，smb 用户名，所有 smb共享相同
cifspassword: "password" # 可选，smb 密码
cifsdomain: "domain" # 可选，允许为 smb 共享设置域
```

- Config.yaml
可以使用在 /config/db21ed7f_birdnet-pi/config.yaml 中找到的 config.yaml 文件配置其他变量，使用 Filebrowser 插件

- Config_env.yaml
可以在此处配置其他环境变量

## 安装

---

此插件的安装非常简单，与安装任何其他插件没有区别。

1. 将我的插件库添加到您的 Home Assistant 实例（在 Supervisor 插件商店的右上角，或如果您已配置我的 HA，请单击下面的按钮）
   [![打开您的 Home Assistant 实例并显示添加插件库对话框，预填充特定插件库 URL。](https://my.home-assistant.io/badges/supervisor_add_addon_repository.svg)](https://my.home-assistant.io/redirect/supervisor_add_addon_repository/?repository_url=https%3A%2F%2Fgithub.com%2Falexbelgium%2Fhassio-addons)
2. 安装此插件。
3. 单击 `保存` 按钮以存储您的配置。
4. 根据您的喜好设置插件选项
5. 启动插件。
6. 检查插件的日志以查看一切是否正常。
7. 打开 WebUI 并调整软件选项

## 与 HA 的集成

---
### Apprise

您可以使用 apprise 通过 mqtt 发送通知，然后使用 HomeAssistant 对其进行操作
进一步信息： https://wander.ingstar.com/projects/birdnetpi.html

### 自动 mqtt

如果安装了 mqtt，该插件会在每次检测到物种时自动更新 birdnet 主题

## 使用 ssl

---

选项 1：安装 Let's Encrypt 插件，生成证书。默认情况下，它们存储在 /ssl 中的 certfile.pem 和 keyfile.pem。只需从插件选项中启用 ssl 即可正常工作。

选项 2：启用端口 80，将您的 BirdNET-Pi URL 定义为 https。证书将由 caddy 自动生成。

## 改进检测

---

### 增益设置

在“终端”选项卡中使用 alsamixer，确保音量足够高，但不过高（不要进入红色区域）
https://github.com/mcguirepr89/BirdNET-Pi/wiki/Adjusting-your-sound-card

### 铁氧体

在我的情况下，添加铁氧体珠导致了更严重的噪音。

### AUX 到 USB 适配器

根据我的测试，只有使用 KT0210（如 Ugreen 的）适配器有效。我无法检测基于 ALC 的适配器。

### 麦克风对比

推荐的麦克风（[完整讨论在这里](https://github.com/mcguirepr89/BirdNET-Pi/discussions/39)）：
- Clippy EM272 (https://www.veldshop.nl/en/smart-clippy-em272z1-mono-omni-microphone.html) + ugreen AUX 到 USB 连接器：最佳灵敏度，采用领夹麦克风技术
- Boya By-LM40：最佳性价比
- Hyperx Quadcast：最佳灵敏度，采用心形指向技术

结论，使用 Dahua 的麦克风已足够好，EM272 是最佳选择，但 Boya By-LM40 是一项非常好的折衷，因为 birdnet 模型分析了 0-15000Hz 范围内的声音。

![图片](https://github.com/alexbelgium/hassio-addons/assets/44178713/df992b79-7171-4f73-b0c0-55eb4256cd5b)

### 降噪 ([完整讨论在这里](https://github.com/mcguirepr89/BirdNET-Pi/discussions/597))

严重研究者对降噪持否定态度。然而，降噪似乎确实显著提高了检测质量！在 HA 中如何实现：
- 使用 Portainer 插件，进入 hassio_audio 容器，修改文件 /etc/pulse/system.pa，添加行 `load-module module-echo-cancel`
- 进入终端插件，输入 `ha audio restart`
- 在插件选项中选择取消回声的设备作为输入设备

### 高通滤波

应该避免，因为模型使用整个 0-15khz 范围

## 常见问题

暂未提供

## 支持

在 GitHub 上创建一个问题

---

![说明](https://raw.githubusercontent.com/tphakala/birdnet-pi/main/doc/birdnet-pi-dashboard.webp)