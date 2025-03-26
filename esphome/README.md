# ESPHome设备构建器

[![ESPHome logo][logo]][website]

[![GitHub stars][github-stars-shield]][repository]
[![Discord][discord-shield]][discord]

## 关于

这个插件允许您编写配置，将您的微控制器直接转变为智能家居设备，通过Home Assistant **无需编程经验**。
您只需要撰写YAML配置文件；其他（无线更新、编译）均由ESPHome处理。

<p align="center">
<img title="ESPHome设备构建器截图" src="https://github.com/esphome/home-assistant-addon/raw/main/esphome/images/screenshot.png" width="700px"></img>
</p>

[查看ESPHome文档][website]

## 示例

使用ESPHome，您可以从几行YAML代码直接生成定制的固件。举例来说，要包括[DHT22][dht22]温湿度传感器，您只需在配置文件中包含8行YAML代码：

<img title="ESPHome DHT配置示例" src="https://github.com/esphome/home-assistant-addon/raw/main/esphome/images/dht-example.png" width="500px"></img>

然后只需点击上传，传感器将神奇地出现在Home Assistant中：

<img title="ESPHome Home Assistant发现" src="https://github.com/esphome/home-assistant-addon/raw/main/esphome/images/temperature-humidity.png" width="600px"></img>

[discord]: https://discord.gg/KhAMKrd
[repository]: https://github.com/esphome/esphome
[discord-shield]: https://img.shields.io/discord/429907082951524364.svg
[github-stars-shield]: https://img.shields.io/github/stars/esphome/esphome.svg?style=social&label=Star&maxAge=2592000
[dht22]: https://esphome.io/components/sensor/dht.html
[releases]: https://esphome.io/changelog/index.html
[logo]: https://github.com/esphome/home-assistant-addon/raw/main/esphome/logo.png
[website]: https://esphome.io/