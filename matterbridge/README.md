# Home Assistant 社区插件: Matterbridge
![支持 aarch64 架构][aarch64-shield] ![支持 amd64 架构][amd64-shield] ![支持 armhf 架构][armhf-shield] ![支持 armv7 架构][armv7-shield]
![项目维护][maintenance-shield]

Matterbridge 用于 Homeassistant OS

## 关于

一个简单的聊天桥接<br />
让人们可以待在他们想要待的地方。<br />
在不断增长的协议之间架起桥梁。<br />

## 安装

[![FaserF Homeassistant 插件](https://my.home-assistant.io/badges/supervisor_add_addon_repository.svg)](https://my.home-assistant.io/redirect/supervisor_add_addon_repository/?repository_url=https%3A%2F%2Fgithub.com%2FFaserF%2Fhassio-addons)
<br />
安装此插件非常简单，和安装其他自定义 Home Assistant 插件没有什么不同。<br />
只需点击上面的链接或将我的库添加到 hassio 插件库: <https://github.com/FaserF/hassio-addons>

将你的网站文件放到 /share/htdocs<br />
你的 index.html 应该放置的示例文件路径: /share/htdocs/index.html <br />

如果你想将你的网站与 MariaDB 数据库集成，请确保已安装 MariaDB 插件！

## 配置

**注意**: _在更改配置后，请记得重启插件。_

插件配置示例:

```yaml
config_path: /share/matterbridge.toml
```

**注意**: _这只是一个示例，切勿直接复制粘贴！请创建你自己的！_

### 选项: `config_path`

你的 matterbridge 配置文件的路径。可以在这里查看示例配置: <https://github.com/42wim/matterbridge/blob/master/matterbridge.toml.sample>

**注意**: _它必须放在 /share 文件夹中的某个地方！_

## 支持

有问题或疑问？

你可以在这里 [打开一个问题][issue] GitHub。
请记住，这个软件仅在运行在 Raspberry Pi 4 的 armv7 上进行了测试。

## 作者 & 贡献者

原始程序来自 42wim。有关更多信息，请访问此页面: <https://github.com/42wim/matterbridge><br />
此 hassio 插件由 [FaserF] 提供。

## 许可

MIT 许可

版权所有 (c) 2019-2022 FaserF 和 42wim

特此免费授予任何获得本软件及相关文档文件（“软件”）副本的人，处理软件的权限，包括但不限于使用、复制、修改、合并、发布、分发、再许可和/或销售软件副本的权利，并允许被提供软件的人这样做，受以下条件的限制：

上述版权声明和本许可声明应包含在所有软件的副本或实质性部分中。

本软件按“原样”提供，不提供任何种类的明示或暗示的担保，包括但不限于对适销性、特定用途的适用性和不侵权的担保。在任何情况下，作者或版权持有者均不对因使用本软件或与本软件使用或其他交易相关的任何索赔、损害或其他责任承担任何责任，无论是在合同诉讼、侵权诉讼还是其他方面。

[maintenance-shield]: https://img.shields.io/maintenance/yes/2024.svg
[aarch64-shield]: https://img.shields.io/badge/aarch64-yes-green.svg
[amd64-shield]: https://img.shields.io/badge/amd64-yes-green.svg
[armhf-shield]: https://img.shields.io/badge/armhf-yes-green.svg
[armv7-shield]: https://img.shields.io/badge/armv7-yes-green.svg
[FaserF]: https://github.com/FaserF/
[issue]: https://github.com/FaserF/hassio-addons/issues