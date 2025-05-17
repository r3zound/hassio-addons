# ESPHome 设备构建器（开发分支）

[![ESPHome logo][logo]][website]

[![GitHub stars][github-stars-shield]][repository]
[![Discord][discord-shield]][discord]

## 关于

此插件允许运行不需要编程经验的用户在Home Assistant中直接编写配置
并将微控制器转换为智能家居设备。您只需编写YAML配置文件，其余的（无线更新、编译）都由ESPHome处理。

<p align="center">
<img title="ESPHome 设备构建器截图" src="https://github.com/esphome/home-assistant-addon/raw/main/esphome-dev/images/screenshot.png" width="700px"></img>
</p>

[查看ESPHome文档][website]

## 示例

使用ESPHome，您可以从几行YAML直接创建一个定制的固件。例如，要包含一个[DHT22][dht22] 温湿度传感器，您只需在配置文件中包含8行YAML：

<img title="ESPHome DHT配置示例" src="https://github.com/esphome/home-assistant-addon/raw/main/esphome-dev/images/dht-example.png" width="500px"></img>

然后只需点击上传，传感器将神奇地出现在Home Assistant中：

<img title="ESPHome Home Assistant发现" src="https://github.com/esphome/home-assistant-addon/raw/main/esphome-dev/images/temperature-humidity.png" width="600px"></img>

[discord]: https://discord.gg/KhAMKrd
[repository]: https://github.com/esphome/esphome
[discord-shield]: https://img.shields.io/discord/429907082951524364.svg
[github-stars-shield]: https://img.shields.io/github/stars/esphome/esphome.svg?style=social&label=Star&maxAge=2592000
[dht22]: https://next.esphome.io/components/sensor/dht.html
[releases]: https://next.esphome.io/changelog/index.html
[logo]: https://github.com/esphome/home-assistant-addon/raw/main/esphome-dev/logo.png
[website]: https://next.esphome.io/