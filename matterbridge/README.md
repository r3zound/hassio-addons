# Home Assistant Community Add-on: Matterbridge
![支持 aarch64 架构][aarch64-shield] ![支持 amd64 架构][amd64-shield] ![支持 armhf 架构][armhf-shield] ![支持 armv7 架构][armv7-shield]
![项目维护][maintenance-shield]

Matterbridge for Homeassistant OS

## 关于

一个简单的聊天桥<br />
让人们能够在他们想要的地方。<br />
在越来越多的协议之间架起桥梁。<br />

## 安装

[![FaserF Homeassistant 插件](https://my.home-assistant.io/badges/supervisor_add_addon_repository.svg)](https://my.home-assistant.io/redirect/supervisor_add_addon_repository/?repository_url=https%3A%2F%2Fgithub.com%2FFaserF%2Fhassio-addons)
<br />
本插件的安装非常简单，与安装其他自定义 Home Assistant 插件没有区别。<br />
只需点击上面的链接或将我的仓库添加到 Hassio 插件仓库: <https://github.com/FaserF/hassio-addons>

将您的网站文件放到 /share/htdocs<br />
您的 index.html 应该放置的示例文件路径：/share/htdocs/index.html <br />

如果您想将您的网站与 MariaDB 数据库集成，请确保已经安装 MariaDB 插件！

## 配置

**注意**：_更改配置后，请记得重启插件。_

插件配置示例：

```yaml
config_path: /share/matterbridge.toml
```

**注意**：_这只是一个示例，请不要复制粘贴！创建您自己的！_

### 选项: `config_path`

您 matterbridge 配置文件的路径。请查看此处的示例配置：<https://github.com/42wim/matterbridge/blob/master/matterbridge.toml.sample>

**注意**：_它必须放在 /share 文件夹中的某个位置！_

## 支持

有问题或疑问？

您可以在这里 [打开问题][issue] GitHub。
请注意，软件仅在运行于 Raspberry Pi 4 的 armv7 上进行过测试。

## 作者与贡献者

原始程序来自 42wim。有关更多信息，请访问此页面：<https://github.com/42wim/matterbridge><br />
该 hassio 插件由 [FaserF] 提供。

## 许可证

MIT 许可证

版权所有 (c) 2019-2022 FaserF & 42wim

特此授予获取本软件及其相关文档文件（以下简称“软件”）副本的任何人免费的权限，允许其不受限制地使用、复制、修改、合并、发布、分发、再许可和/或出售该软件副本，并允许已向其提供该软件的人这样做，但须遵守以下条件：

上述版权声明和本许可声明应包含在软件的所有副本或实质性部分中。

本软件按“原样”提供，不提供任何种类的明示或暗示的担保，包括但不限于对适销性、特定用途的适用性和非侵权的担保。在任何情况下，作者或版权所有者均不对因使用本软件或其他交易而引起的任何索赔、损害或其他责任负责，无论是在合同、侵权或其他方面。

[maintenance-shield]: https://img.shields.io/maintenance/yes/2024.svg
[aarch64-shield]: https://img.shields.io/badge/aarch64-yes-green.svg
[amd64-shield]: https://img.shields.io/badge/amd64-yes-green.svg
[armhf-shield]: https://img.shields.io/badge/armhf-yes-green.svg
[armv7-shield]: https://img.shields.io/badge/armv7-yes-green.svg
[FaserF]: https://github.com/FaserF/
[issue]: https://github.com/FaserF/hassio-addons/issues