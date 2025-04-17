# Home Assistant 插件：DuckDNS

自动通过 Let's Encrypt 集成的 HTTPS 支持更新你的 Duck DNS IP 地址。

![支持 aarch64 架构][aarch64-shield] ![支持 amd64 架构][amd64-shield] ![支持 armhf 架构][armhf-shield] ![支持 armv7 架构][armv7-shield] ![支持 i386 架构][i386-shield]

## 关于

[Duck DNS][duckdns] 是一个免费的服务，可以将 DNS（duckdns.org 的子域名）指向你选择的 IP。此插件包括对 Let's Encrypt 的支持，并自动创建和续订你的证书。使用此插件之前，你需要注册一个 Duck DNS 账户。

[aarch64-shield]: https://img.shields.io/badge/aarch64-yes-green.svg
[amd64-shield]: https://img.shields.io/badge/amd64-yes-green.svg
[armhf-shield]: https://img.shields.io/badge/armhf-yes-green.svg
[armv7-shield]: https://img.shields.io/badge/armv7-yes-green.svg
[i386-shield]: https://img.shields.io/badge/i386-yes-green.svg
[duckdns]: https://www.duckdns.org