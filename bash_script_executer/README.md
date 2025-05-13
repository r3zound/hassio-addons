# Home Assistant Community Add-on: Bash Script Executer
![支持 aarch64 架构][aarch64-shield] ![支持 amd64 架构][amd64-shield] ![支持 armhf 架构][armhf-shield] ![支持 armv7 架构][armv7-shield] ![支持 i386 架构][i386-shield]
![项目维护][maintenance-shield]

Homeassistant OS 的 Bash 脚本执行器

## 关于

这是一个简单的 Docker 镜像，用于执行个人脚本。我需要这个的原因是 HA OS 安装的功能有限（例如没有 curl、sed 等），而这个插件修复了这个问题。<br />
您可以使用此插件运行多达三个不同的脚本。<br />
此 Docker 镜像包含：busybox-extras curl grep coreutils sed xmlstarlet

## 安装

[![FaserF Homeassistant Addons](https://my.home-assistant.io/badges/supervisor_add_addon_repository.svg)](https://my.home-assistant.io/redirect/supervisor_add_addon_repository/?repository_url=https%3A%2F%2Fgithub.com%2FFaserF%2Fhassio-addons)
<br />
此插件的安装过程非常简单，与安装任何其他自定义 Home Assistant 插件没有区别。<br />
只需点击上面的链接或将我的库添加到 hassio 插件库： <https://github.com/FaserF/hassio-addons>

将您的脚本放在 /share/ 文件夹中的某个位置。其他文件夹对该插件不可见。<br />
您的脚本文件示例位置： /share/scripts/script.sh

## 配置

**我建议您为此插件禁用“开机启动”和 HA 的看门狗选项！**<br />

**注意**：_记得在配置更改后重新启动插件。_

插件配置示例：

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

**注意**：_这只是一个示例，请不要直接复制粘贴！请创建您自己的！_

### 选项： `script_path`

此选项是必需的。根据脚本的位置进行更改，或将其更改为“false”以保持为空。

### 选项： `scriptX_argumentX`

此选项是可选的。您可以通过此选项向脚本提交最多三个参数。

### 选项： `script_path2`

此选项是必需的。根据脚本的位置进行更改，或将其更改为“false”以保持为空。

### 选项： `script_path3`

此选项是必需的。根据脚本的位置进行更改，或将其更改为“false”以保持为空。

## Cron 支持 - 定时运行脚本

我在此插件中没有实现 Cron，因为您可以通过 Homeassistant 自动化定期运行脚本。
自动化示例：<br />

```yaml
  - alias: "使用插件 Bash 脚本执行器运行 Bash 脚本"
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

有问题或疑问吗？

您可以 [在这里报告问题][issue] GitHub。
请记住，此软件仅在 Raspberry Pi 4 的 armv7 上进行了测试。而且我为我的个人脚本制作了此插件。

## 作者与贡献者

该 hassio 插件由 [FaserF] 提供。

## 许可证

MIT 许可证

版权 (c) 2021 FaserF

特此免费授予任何获得本软件及相关文档文件（以下称“软件”）副本的人，处理本软件的权利， 包括但不限于使用、复制、修改、合并、发布、分发、再授权和/或出售本软件副本的权利，并允许提供软件的人员这样做，附带以下条件：

上述版权声明和本许可声明应包含在软件的所有副本或重要部分中。

软件是“按原样”提供的，不附任何形式的担保，明示或暗示，包括但不限于对适销性、特定用途的适用性及不侵权的担保。在任何情况下，作者或版权持有人均不对因使用或与本软件或其他交易相关的任何索赔、损害或其他责任承担责任，无论是在合同诉讼、侵权或其他诉讼中。

[maintenance-shield]: https://img.shields.io/maintenance/yes/2024.svg
[aarch64-shield]: https://img.shields.io/badge/aarch64-yes-green.svg
[amd64-shield]: https://img.shields.io/badge/amd64-yes-green.svg
[armhf-shield]: https://img.shields.io/badge/armhf-yes-green.svg
[armv7-shield]: https://img.shields.io/badge/armv7-yes-green.svg
[i386-shield]: https://img.shields.io/badge/i386-yes-green.svg
[FaserF]: https://github.com/FaserF/
[issue]: https://github.com/FaserF/hassio-addons/issues