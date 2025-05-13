# Home Assistant Community Add-on: Freenom-DNS-Updater
![支持 aarch64 架构][aarch64-shield] ![支持 amd64 架构][amd64-shield] ![支持 armhf 架构][armhf-shield] ![支持 armv7 架构][armv7-shield] ![支持 i386 架构][i386-shield]
![项目维护][maintenance-shield]

Homeassistant OS 的 Freenom DNS 更新器

## 关于

Freenom 是一个（免费）注册商提供者。这是一个基于 @maxisoft 的 [Freenom DNS Updater](https://github.com/maxisoft/Freenom-dns-updater) 的 Docker 镜像。<br />
完整功能列表可以在那里找到。

## 安装

[![FaserF Homeassistant 加载项](https://my.home-assistant.io/badges/supervisor_add_addon_repository.svg)](https://my.home-assistant.io/redirect/supervisor_add_addon_repository/?repository_url=https%3A%2F%2Fgithub.com%2FFaserF%2Fhassio-addons)
<br />
此加载项的安装相当简单，与安装其他自定义 Home Assistant 加载项没有区别。<br />
只需点击上面的链接或将我的仓库添加到 hassio 加载项仓库： <https://github.com/FaserF/hassio-addons>

将您的配置文件放在 /share 目录下的某个位置<br />

## 配置

**注意**：_记得在更改配置时重新启动加载项。_

示例加载项配置：

```yaml
config_file: /share/freenom.yaml
update_time_in_seconds: 86400
```

**注意**：_这只是一个示例，别复制粘贴！创建您自己的！_

### 选项：`config_file`

此选项是必需的。根据您 Homeassistant 安装中配置文件的位置进行更改。

**注意**：_它必须在 `/share/` 文件夹中的某个地方！其他文件夹对该加载项不可见。_

### 选项：`update_time_in_seconds`

输入更新应该进行的时间（更新域名，更新 IP 地址等），单位为秒。

## 支持

有问题或疑问吗？

您可以在 [这里开个问题][issue] GitHub。
请记住，软件仅在 Raspberry Pi 4 上运行的 armv7 进行过测试。

## 作者与贡献者

原始程序来自 maxisoft。更多信息请访问此页面： <https://github.com/maxisoft/Freenom-dns-updater>
该 hassio 加载项由 [FaserF] 提供。

## 许可证

MIT 许可证

版权 (c) 2019-2023 FaserF & maxisoft

特此授予任何获得本软件及相关文档文件（“软件”）副本的人，免费使用软件的权利，涵盖所有使用、复制、修改、合并、发布、分发、再授权和/或出售软件副本的权利，并允许被提供软件的人这样做，受以下条件的约束：

上述版权声明和本许可声明应包含在所有软件的副本或实质性部分中。

该软件是“按原样”提供，不提供任何形式的保证，明示或暗示，包括但不限于对适销性、特定用途适用性和不侵权的保证。在任何情况下，作者或版权持有者对因使用该软件或与软件的使用或其他交易相关的任何索赔、损害或其他责任概不负责， 无论是在合同诉讼、侵权或其他方面。

[maintenance-shield]: https://img.shields.io/maintenance/yes/2023.svg
[aarch64-shield]: https://img.shields.io/badge/aarch64-yes-green.svg
[amd64-shield]: https://img.shields.io/badge/amd64-yes-green.svg
[armhf-shield]: https://img.shields.io/badge/armhf-yes-green.svg
[armv7-shield]: https://img.shields.io/badge/armv7-yes-green.svg
[i386-shield]: https://img.shields.io/badge/i386-yes-green.svg
[FaserF]: https://github.com/FaserF/
[issue]: https://github.com/FaserF/hassio-addons/issues