# pigpio

将 C 控制库 [pigpio](https://github.com/joan2937/pigpio) 封装成 Home Assistant 插件，以便于安装。

[![Release][release-badge]][release]
![Addon Stage][stage-badge]

[![Donate][donation-badge]][donation-url]

## 使用方法

此插件运行 pigpio 守护进程，它监听 http 命令，并相应地控制树莓派的 GPIO（目前仅支持至 PI 4）。
运行此插件并在 Home Assistant 配置中使用指向 `localhost` 的 [remote_rpi_gpio 集成](https://www.home-assistant.io/integrations/remote_rpi_gpio/) 将连接两个世界。

对于守护进程的其他选项，请使用可选的插件设置 `additional_options`。
选项 `-g -f` 将始终被设置！

## 安全性

它访问主机上的 `/dev/mem`，并且对原始 io 数据具有完全访问权限。

[stage-badge]: https://img.shields.io/badge/Addon%20stage-stable-green.svg

[release-badge]: https://img.shields.io/badge/version-v1.5.3-blue.svg
[release]: https://github.com/Poeschl-HomeAssistant-Addons/pigpio/tree/v1.5.3

[donation-badge]: https://img.shields.io/badge/Buy%20me%20a%20coffee-%23d32f2f?logo=buy-me-a-coffee&style=for-the-badge&logoColor=white
[donation-url]: https://www.buymeacoffee.com/Poeschl