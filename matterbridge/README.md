# Home Assistant 社区插件：Matterbridge
![支持 aarch64 架构][aarch64-shield] ![支持 amd64 架构][amd64-shield] ![支持 armhf 架构][armhf-shield] ![支持 armv7 架构][armv7-shield]
![项目维护][maintenance-shield]

Matterbridge for Homeassistant OS

## 关于

一个简单的聊天桥<br />
让人们能够在他们想要的地方。<br />
在不断增长的协议之间架起桥梁。<br />

## 安装

[![FaserF Homeassistant 插件](https://my.home-assistant.io/badges/supervisor_add_addon_repository.svg)](https://my.home-assistant.io/redirect/supervisor_add_addon_repository/?repository_url=https%3A%2F%2Fgithub.com%2FFaserF%2Fhassio-addons)
<br />
此插件的安装非常简单，与安装任何其他自定义 Home Assistant 插件没有区别。<br />
只需点击上面的链接或将我的仓库添加到 hassio 插件仓库：<https://github.com/FaserF/hassio-addons>

将您的网站文件放入 /share/htdocs<br />
您的 index.html 应该放在的示例文件：/share/htdocs/index.html <br />

如果您想将您的网站与 mariadb 数据库集成，请确保已安装 MariaDB 插件！

## 配置

**注**：_记得在更改配置后重启插件。_

插件配置示例：

```yaml
config_path: /share/matterbridge.toml
```

**注**：_这只是一个示例，请不要复制和粘贴！创建您自己的！_

### 选项： `config_path`

您的 matterbridge 配置文件的路径。请查看这里的示例配置：<https://github.com/42wim/matterbridge/blob/master/matterbridge.toml.sample>

**注**：_它必须放在 /share 文件夹中的某个位置！_

## 支持

有问题或疑问？

您可以在这里 [打开一个问题][issue] GitHub。
请记住，这个软件只在 Raspberry Pi 4 上的 armv7 上进行了测试。

## 作者与贡献者

原始程序来自 42wim。有关更多信息，请访问此页面：<https://github.com/42wim/matterbridge><br />
该 hassio 插件由 [FaserF] 提供。

## 许可证

MIT 许可证

版权所有 (c) 2019-2022 FaserF & 42wim

特此免费授予任何获得此软件及相关文档文件（以下称“软件”）副本的人，在不受限制的条件下处理该软件，包括但不限于使用、复制、修改、合并、发布、分发、再许可和/或销售该软件的副本，并允许向其提供该软件的人这样做，须遵守以下条件：

上述版权声明和本许可证须包含在所有软件的副本或实质部分中。

本软件是按“原样”提供的，不作任何种类的保证，无论是明示或暗示，包括但不限于对适销性、特定用途的适用性和不侵权的保证。在任何情况下，作者或版权持有者对因使用本软件或与之相关的使用或其他交易而产生的任何索赔、损害或其他责任不承担责任，无论是在合同诉讼、侵权或其他方面。

[maintenance-shield]: https://img.shields.io/maintenance/yes/2024.svg
[aarch64-shield]: https://img.shields.io/badge/aarch64-yes-green.svg
[amd64-shield]: https://img.shields.io/badge/amd64-yes-green.svg
[armhf-shield]: https://img.shields.io/badge/armhf-yes-green.svg
[armv7-shield]: https://img.shields.io/badge/armv7-yes-green.svg
[FaserF]: https://github.com/FaserF/
[issue]: https://github.com/FaserF/hassio-addons/issues