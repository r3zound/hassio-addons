# Home Assistant 插件: Zigbee2MQTT Proxy

[![Docker Pulls](https://img.shields.io/docker/pulls/zigbee2mqtt/zigbee2mqtt-proxy-amd64.svg?style=flat-square&logo=docker)](https://cloud.docker.com/u/zigbee2mqtt/repository/docker/dwelch2101/zigbee2mqtt-proxy-amd64)

⚠️ 此插件不包含 Zigbee2MQTT ⚠️

此插件充当与外部运行的 Zigbee2MQTT 实例的代理。
此插件的唯一目的是在 Home Assistant 的侧边栏添加一个 Zigbee2MQTT 图标，点击后会打开外部运行的 Zigbee2MQTT 实例的前端。

## 选项

- `server`（必填）：这应该是运行 Zigbee2MQTT 前端的本地 URL，例如 `http://192.168.2.43:8080`。确保没有尾部斜杠！
- `auth_token`（可选）：仅在 Zigbee2MQTT 配置的前端设置了 `auth_token` 时使用。