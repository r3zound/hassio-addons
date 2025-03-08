# Home Assistant Community Add-on: Bash 脚本执行器
![支持 aarch64 架构][aarch64-shield] ![支持 amd64 架构][amd64-shield] ![支持 armhf 架构][armhf-shield] ![支持 armv7 架构][armv7-shield] ![支持 i386 架构][i386-shield]
![项目维护][maintenance-shield]

Homeassistant OS 的 Bash 脚本执行器

## 关于

这是一个简单的 Docker 镜像，用于执行个人脚本。我需要这个的原因是 HA OS 安装的功能有限（例如没有 curl、sed 等），这个插件修复了这个问题。<br />
这个插件可以运行多达三个不同的脚本。<br />
这个 Docker 镜像包含：busybox-extras curl grep coreutils sed xmlstarlet

## 安装

[![FaserF Homeassistant Addons](https://my.home-assistant.io/badges/supervisor_add_addon_repository.svg)](https://my.home-assistant.io/redirect/supervisor_add_addon_repository/?repository_url=https%3A%2F%2Fgithub.com%2FFaserF%2Fhassio-addons)
<br />
安装这个插件相当简单，与安装其他自定义 Home Assistant 插件没有区别。<br />
只需点击上面的链接或将我的仓库添加到 hassio 插件仓库：<https://github.com/FaserF/hassio-addons>

将你的脚本放在 /share/ 文件夹中的某个地方。其他文件夹对这个插件不可见。<br />
示例文件你的脚本可以放在：/share/scripts/script.sh

## 配置

**我建议禁用此插件的“开机自启”和 HA 的 Watchdog 选项!**<br />

**注意**：_记得在更改配置后重启插件。_

示例插件配置：

```yaml
script_path: /share/scripts/script.sh
script_argument1: myFirstArgument
script_argument2: AnotherVariable
script_argument3: AnotherVariable
script_path2: false
script2_argument1:
script2_argument2:
script2_argument3:
script_path3: false
script3_argument2:
script3_argument2:
script3_argument3:
```

**注意**：_这只是一个示例，不要复制粘贴！请创建你自己的！_

### 选项：`script_path`

这个选项是必需的。根据你的脚本位置进行更改，或者更改为“false”以留空。

### 选项：`scriptX_argumentX`

这个选项是可选的。您可以通过此选项向脚本提交最多三个参数。

### 选项：`script_path2`

这个选项是必需的。根据你的脚本位置进行更改，或者更改为“false”以留空。

### 选项：`script_path3`

这个选项是必需的。根据你的脚本位置进行更改，或者更改为“false”以留空。

## Cron 支持 - 按时间运行脚本

我没有在这个插件中实现 Cron，因为您可以通过 Homeassistant 自动化定期运行脚本。
示例自动化：<br />

```yaml
  - alias: "使用 Bash 脚本执行器运行 Bash 脚本"
    trigger:
      - platform: time
        at: '00:02:00'
      - platform: time_pattern
        minutes: '/90'
        seconds: 0
    action:
      - service: hassio.addon_start
        data:
          addon: 605cee21_bashscriptexecuter
```

## 支持

有问题或疑问？

您可以在这里 [提交问题][issue] GitHub。
请记住，这个软件仅在运行 Raspberry Pi 4 的 armv7 上经过测试。我制作这个插件是为了我的个人脚本。

## 作者及贡献者

hassio 插件由 [FaserF] 提供。

## 许可证

MIT 许可证

版权所有 (c) 2021 FaserF

特此授予任何人免费获得此软件及相关文档文件（“软件”）副本的权限，以不受限制地处理该软件，包括但不限于使用、复制、修改、合并、出版、分发、再授权和/或出售该软件的副本，并允许被提供软件的人这样做，受以下条件的限制：

上述版权声明和本许可声明应包含在软件的所有副本或实质性部分中。

该软件是按“原样”提供的，没有任何明示或暗示的保证，包括但不限于对适销性、特定用途适用性和不侵权的保证。在任何情况下，作者或版权持有者均无须为任何索赔、损害或其他责任承担任何责任，无论是基于合同诉讼、侵权诉讼还是其他方面，均因使用或与软件或其他交互而发生。

[maintenance-shield]: https://img.shields.io/maintenance/yes/2024.svg
[aarch64-shield]: https://img.shields.io/badge/aarch64-yes-green.svg
[amd64-shield]: https://img.shields.io/badge/amd64-yes-green.svg
[armhf-shield]: https://img.shields.io/badge/armhf-yes-green.svg
[armv7-shield]: https://img.shields.io/badge/armv7-yes-green.svg
[i386-shield]: https://img.shields.io/badge/i386-yes-green.svg
[FaserF]: https://github.com/FaserF/
[issue]: https://github.com/FaserF/hassio-addons/issues