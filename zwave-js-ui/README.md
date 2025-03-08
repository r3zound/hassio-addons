# Home Assistant Community Add-on: Z-Wave JS UI

[![Release][release-shield]][release] ![项目阶段][project-stage-shield] ![项目维护][maintenance-shield]

[![Discord][discord-shield]][discord] [![社区论坛][forum-shield]][forum]

[![通过 GitHub Sponsors 支持 Frenck][github-sponsors-shield]][github-sponsors]

[![在 Patreon 上支持 Frenck][patreon-shield]][patreon]

完全可配置的 Z-Wave JS 控制面板和 MQTT 网关。

![Z-Wave JS UI][logo]

## 关于

Z-Wave JS UI 插件提供了一个额外的控制面板，让你可以配置 Z-Wave 网络的每一个方面。它提供了一个解耦的网关，可以使用 Z-Wave JS WebSockets（由 Home Assistant Z-Wave JS 集成使用）和 MQTT 进行通信（甚至可以同时使用）。

一些优势和使用案例：

- 兼容 Home Assistant Z-Wave JS 集成。
- 在 Home Assistant 重启之间，你的 Z-Wave 网络将持续运行。
- 你可以直接使用 Node-RED 等工具与 Z-Wave 网络协作，同时它也可以为 Home Assistant 提供服务。
- 允许基于 [ESPHome.io][esphome] 的 ESP 设备直接回应或与 Z-Wave 网络进行交互。
- 在找到时会自动与 Mosquitto 插件进行预配置。

该插件使用 [Z-Wave JS UI][zwave-js-ui] 软件。

[discord-shield]: https://img.shields.io/discord/478094546522079232.svg
[discord]: https://discord.me/hassioaddons
[esphome]: https://esphome.io/components/mqtt.html#on-message-trigger
[forum-shield]: https://img.shields.io/badge/community-forum-brightgreen.svg
[forum]: https://community.home-assistant.io/?u=frenck
[github-sponsors-shield]: https://frenck.dev/wp-content/uploads/2019/12/github_sponsor.png
[github-sponsors]: https://github.com/sponsors/frenck
[logo]: https://github.com/hassio-addons/addon-zwave-js-ui/raw/main/zwave-js-ui/logo.png
[maintenance-shield]: https://img.shields.io/maintenance/yes/2025.svg
[patreon-shield]: https://frenck.dev/wp-content/uploads/2019/12/patreon.png
[patreon]: https://www.patreon.com/frenck
[project-stage-shield]: https://img.shields.io/badge/project%20stage-production%20ready-brightgreen.svg
[release-shield]: https://img.shields.io/badge/version-v3.22.0-blue.svg
[release]: https://github.com/hassio-addons/addon-zwave-js-ui/tree/v3.22.0
[zwave-js-ui]: https://github.com/zwave-js/zwave-js-ui