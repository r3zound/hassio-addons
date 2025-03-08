# pigpio

将 C 控制库 [pigpio](https://github.com/joan2937/pigpio) 以 Home Assistant 附加组件的形式封装，方便安装。

[![Release][release-badge]][release]
![Addon Stage][stage-badge]

[![Donate][donation-badge]][donation-url]

## 使用方法

此附加组件运行 pigpio 守护进程，它监听 http 命令并相应地控制 Raspberry Pi 的 GPIO（当前仅支持 PI 4）。
运行该组件并在 Home Assistant 配置中使用指向 `localhost` 的 [remote_rpi_gpio integration](https://www.home-assistant.io/integrations/remote_rpi_gpio/) 将连接这两个世界。

要获得更多守护进程的附加选项，请使用可选的附加组件设置 `additional_options`。
选项 `-g -f` 将始终设置！

## 安全性

它访问主机上的 `/dev/mem`，并且具有对原始 IO 数据的完全访问权限。


[stage-badge]: https://img.shields.io/badge/Addon%20stage-stable-green.svg

[release-badge]: https://img.shields.io/badge/version-v1.5.3-blue.svg
[release]: https://github.com/Poeschl-HomeAssistant-Addons/pigpio/tree/v1.5.3

[donation-badge]: https://img.shields.io/badge/Buy%20me%20a%20coffee-%23d32f2f?logo=buy-me-a-coffee&style=for-the-badge&logoColor=white
[donation-url]: https://www.buymeacoffee.com/Poeschl