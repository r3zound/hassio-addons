# Home Assistant 社区附加组件：Freenom-DNS-Updater
![支持 aarch64 架构][aarch64-shield] ![支持 amd64 架构][amd64-shield] ![支持 armhf 架构][armhf-shield] ![支持 armv7 架构][armv7-shield] ![支持 i386 架构][i386-shield]
![项目维护][maintenance-shield]

Freenom DNS 更新程序用于 Homeassistant OS

## 关于

Freenom 是一个（免费）注册服务提供商。这是一个基于 @maxisoft 的 [Freenom DNS Updater](https://github.com/maxisoft/Freenom-dns-updater) 工作的 docker 镜像。<br />
完整的功能列表可以在这里找到。

## 安装

[![FaserF Homeassistant 附加组件](https://my.home-assistant.io/badges/supervisor_add_addon_repository.svg)](https://my.home-assistant.io/redirect/supervisor_add_addon_repository/?repository_url=https%3A%2F%2Fgithub.com%2FFaserF%2Fhassio-addons)
<br />
安装这个附加组件非常简单，与安装其他自定义 Home Assistant 附加组件没有区别。<br />
只需点击上面的链接或将我的仓库添加到 hassio 附加组件仓库： <https://github.com/FaserF/hassio-addons>

将您的配置文件放在 /share 的某个地方<br />

## 配置

**注意**：_请记住在更改配置后重启附加组件。_

附加组件配置示例：

```yaml
config_file: /share/freenom.yaml
update_time_in_seconds: 86400
```

**注意**：_这只是一个示例，请不要直接复制粘贴！创建您自己的！_

### 选项：`config_file`

这个选项是必需的。根据您的配置文件在 Home Assistant 安装中的位置进行更改。

**注意**：_它必须位于 `/share/` 文件夹中的某个地方！其他文件夹对该附加组件不可见。_

### 选项：`update_time_in_seconds`

输入更新应该进行的时间（续订域名、续订 IP 地址等）的秒数。

## 支持

有问题或疑问？

您可以在 GitHub 上 [这里打开一个问题][issue]。
请记住，该软件仅在 Raspberry Pi 4 上运行的 armv7 进行了测试。

## 作者 & 贡献者

原始程序来自 maxisoft。有关更多信息，请访问此页面： <https://github.com/maxisoft/Freenom-dns-updater>
该 hassio 附加组件由 [FaserF] 提供。

## 许可证

MIT 许可证

版权 (c) 2019-2023 FaserF & maxisoft

特此免费授予任何获得本软件及相关文档文件（“软件”）副本的人在不受限制的情况下使用、复制、修改、合并、发布、分发、再授权和/或销售该软件的副本，并允许被提供软件的人员这样做，条件是：

上述版权通知和本许可通知应包含在软件的所有副本或重要部分中。

软件是按“原样”提供的，不附有任何类型的保证，无论是明示的还是暗示的，包括但不限于适销性、适合特定用途和不侵权的保证。在任何情况下，作者或版权持有人均不对因使用软件或与软件的使用或其他交易有关的任何索赔、损害或其他责任承担责任，无论是合同行为、侵权行为还是其他行为。

[maintenance-shield]: https://img.shields.io/maintenance/yes/2023.svg
[aarch64-shield]: https://img.shields.io/badge/aarch64-yes-green.svg
[amd64-shield]: https://img.shields.io/badge/amd64-yes-green.svg
[armhf-shield]: https://img.shields.io/badge/armhf-yes-green.svg
[armv7-shield]: https://img.shields.io/badge/armv7-yes-green.svg
[i386-shield]: https://img.shields.io/badge/i386-yes-green.svg
[FaserF]: https://github.com/FaserF/
[issue]: https://github.com/FaserF/hassio-addons/issues