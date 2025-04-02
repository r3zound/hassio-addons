# Home Assistant社区插件: Matterbridge
![支持aarch64架构][aarch64-shield] ![支持amd64架构][amd64-shield] ![支持armhf架构][armhf-shield] ![支持armv7架构][armv7-shield]
![项目维护][maintenance-shield]

Homeassistant OS的Matterbridge

## 介绍

一个简单的聊天桥<br />
让人们呆在他们想呆的地方。<br />
在越来越多的协议之间架起桥梁。<br />

## 安装

[![FaserF Homeassistant插件](https://my.home-assistant.io/badges/supervisor_add_addon_repository.svg)](https://my.home-assistant.io/redirect/supervisor_add_addon_repository/?repository_url=https%3A%2F%2Fgithub.com%2FFaserF%2Fhassio-addons)
<br />
这个插件的安装相当简单，与安装其他自定义Home Assistant插件没有不同。<br />
只需点击上面的链接或将我的仓库添加到hassio插件库: <https://github.com/FaserF/hassio-addons>

将您的网站文件放到 /share/htdocs<br />
您的index.html应该在的示例文件位置: /share/htdocs/index.html <br />

如果您想将您的网站与mariadb数据库集成。请确保MariaDB插件已安装！

## 配置

**注意**: _在更改配置时，请记得重启插件。_

示例插件配置：

```yaml
config_path: /share/matterbridge.toml
```

**注意**: _这仅仅是一个示例，请不要复制和粘贴！创建您自己的！_

### 选项: `config_path`

您matterbridge配置文件的路径。请查看这里的示例配置: <https://github.com/42wim/matterbridge/blob/master/matterbridge.toml.sample>

**注意**: _必须放置在/share文件夹中的某个地方！_

## 支持

有问题或疑问吗？

您可以在这里[打开一个问题][issue] GitHub。
请记住，这个软件仅在Raspberry Pi 4的armv7上进行了测试。

## 作者与贡献者

原始程序来自42wim。有关更多信息，请访问此页面: <https://github.com/42wim/matterbridge><br />
这个hassio插件由[FaserF]带给您。

## 许可证

MIT许可证

版权所有 (c) 2019-2022 FaserF & 42wim

特此免费授予任何获得本软件及相关文档文件（“软件”）副本的人员以处理本软件的权利，包括不限于使用、复制、修改、合并、发布、分发、再授权和/或出售本软件的副本，以及允许向其提供软件的人这样做，前提是满足以下条件：

上述版权声明和本许可声明应包含在软件的所有副本或实质性部分中。

本软件按“原样”提供，不提供任何种类的担保，明示或暗示，包括但不限于对适销性、特定用途适用性和不侵权的担保。在任何情况下，作者或版权持有者对因使用或其他交易中产生的任何索赔、损害或其他责任不承担责任，无论是合同诉讼、侵权或其他。

[maintenance-shield]: https://img.shields.io/maintenance/yes/2024.svg
[aarch64-shield]: https://img.shields.io/badge/aarch64-yes-green.svg
[amd64-shield]: https://img.shields.io/badge/amd64-yes-green.svg
[armhf-shield]: https://img.shields.io/badge/armhf-yes-green.svg
[armv7-shield]: https://img.shields.io/badge/armv7-yes-green.svg
[FaserF]: https://github.com/FaserF/
[issue]: https://github.com/FaserF/hassio-addons/issues