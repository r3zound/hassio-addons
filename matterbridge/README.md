# Home Assistant Community Add-on: Matterbridge
![支持 aarch64 架构][aarch64-shield] ![支持 amd64 架构][amd64-shield] ![支持 armhf 架构][armhf-shield] ![支持 armv7 架构][armv7-shield]
![项目维护][maintenance-shield]

Matterbridge for Homeassistant OS

## 关于

一个简单的聊天桥<br />
让人们能在他们想要的地方。<br />
跨越越来越多的协议桥接。<br />

## 安装

[![FaserF Homeassistant Addons](https://my.home-assistant.io/badges/supervisor_add_addon_repository.svg)](https://my.home-assistant.io/redirect/supervisor_add_addon_repository/?repository_url=https%3A%2F%2Fgithub.com%2FFaserF%2Fhassio-addons)
<br />
此附加组件的安装非常简单，与安装任何其他自定义 Home Assistant 附加组件并无不同。<br />
只需点击上面的链接或将我的仓库添加到 hassio 附加组件库： <https://github.com/FaserF/hassio-addons>

将您的网站文件放到 /share/htdocs<br />
您的 index.html 应位于的示例文件位置： /share/htdocs/index.html <br />

如果您想将您的网站与 MariaDB 数据库集成，请确保已安装 MariaDB 附加组件！

## 配置

**注意**：_在更改配置时，请记得重启附加组件。_

附加组件配置示例：

```yaml
config_path: /share/matterbridge.toml
```

**注意**：_这只是一个示例，请不要复制粘贴！请创建您自己的配置！_

### 选项： `config_path`

您的 matterbridge 配置文件的路径。请查看这里的示例配置： <https://github.com/42wim/matterbridge/blob/master/matterbridge.toml.sample>

**注意**：_它必须放置在 /share 文件夹中的某个地方！_

## 支持

有问题或疑问？

您可以在这里 [打开一个问题][issue] GitHub。
请记住，此软件仅在 Raspberry Pi 4 上的 armv7 上进行了测试。

## 作者与贡献者

原始程序来自 42wim。有关更多信息，请访问此页面： <https://github.com/42wim/matterbridge><br />
该 hassio 附加组件由 [FaserF] 为您提供。

## 许可证

MIT 许可证

版权 (c) 2019-2025 FaserF & 42wim

特此无偿授予任何获得本软件及相关文档文件（以下称“软件”）副本的人，处理该软件的权利，不受限制，包括但不限于使用、复制、修改、合并、出版、分发、再授权及/或出售该软件副本的权利，并允许提供软件的人这样做，前提是遵循以下条件：

上述版权声明和本许可声明应包含在所有软件的副本或实质性部分中。

该软件是按“原样”提供的，不提供任何类型的保证，明示或暗示，包括但不限于对适销性、特定用途适用性和不侵权的保证。在任何情况下，作者或版权持有者对因使用、或其他与该软件与该软件的使用或其他交易所引起的任何索赔、损害或其他责任均不承担责任，无论是在合同、侵权或其他行为中。

[maintenance-shield]: https://img.shields.io/maintenance/yes/2025.svg
[aarch64-shield]: https://img.shields.io/badge/aarch64-yes-green.svg
[amd64-shield]: https://img.shields.io/badge/amd64-yes-green.svg
[armhf-shield]: https://img.shields.io/badge/armhf-yes-green.svg
[armv7-shield]: https://img.shields.io/badge/armv7-yes-green.svg
[FaserF]: https://github.com/FaserF/
[issue]: https://github.com/FaserF/hassio-addons/issues