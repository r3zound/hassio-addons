# Home Assistant Community Add-on: Bash 脚本执行器
![支持 aarch64 架构][aarch64-shield] ![支持 amd64 架构][amd64-shield] ![支持 armhf 架构][armhf-shield] ![支持 armv7 架构][armv7-shield] ![支持 i386 架构][i386-shield]
![项目维护][maintenance-shield]

Homeassistant OS 的 Bash 脚本执行器

## 关于

这是一个简单的 Docker 镜像，用于执行个人脚本。我需要这个的原因是 HA OS 安装的功能有限（例如没有 curl、sed 等），而这个插件解决了这个问题。<br />
通过这个插件，你可以运行最多三个不同的脚本。<br />
这个 Docker 镜像带有：busybox-extras curl grep coreutils sed xmlstarlet

## 安装

[![FaserF Homeassistant 插件](https://my.home-assistant.io/badges/supervisor_add_addon_repository.svg)](https://my.home-assistant.io/redirect/supervisor_add_addon_repository/?repository_url=https%3A%2F%2Fgithub.com%2FFaserF%2Fhassio-addons)
<br />
这个插件的安装非常简单，与安装其他任何自定义 Home Assistant 插件没有区别。<br />
只需点击上面的链接或将我的仓库添加到 hassio 插件库： <https://github.com/FaserF/hassio-addons>

将你的脚本放在 /share/ 文件夹中的某个地方。其他文件夹对这个插件不可见。<br />
你的脚本可以放在的示例文件： /share/scripts/script.sh

## 配置

**我建议为这个插件禁用 "开机启动" 和 HA 的看门狗选项！**<br />

**注意**：_记得在更改配置后重启插件。_

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

**注意**：_这只是一个示例，不要复制和粘贴它！创建你自己的！_

### 选项： `script_path`

这个选项是必需的。根据你的脚本位置进行更改，或将其更改为 "false" 以保持为空。

### 选项： `scriptX_argumentX`

这个选项是可选的。你可以通过这个选项为你的脚本提交最多三个参数。

### 选项： `script_path2`

这个选项是必需的。根据你的脚本位置进行更改，或将其更改为 "false" 以保持为空。

### 选项： `script_path3`

这个选项是必需的。根据你的脚本位置进行更改，或将其更改为 "false" 以保持为空。

## Cron 支持 - 按时间运行脚本

我没有在这个插件中实现 Cron，因为你可以通过 Homeassistant 自动化周期性地运行你的脚本。
自动化示例： <br />

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

有问题或疑问？

你可以在这里 [打开问题][issue] GitHub。
请记住，这个软件只在 Raspberry Pi 4 的 armv7 上进行了测试。我为我个人的脚本制作了这个插件。

## 作者与贡献者

这个 hassio 插件由 [FaserF] 提供。

## 许可证

MIT 许可证

版权所有 (c) 2021 FaserF

特此免费授权任何获得本软件及相关文档文件（以下简称“软件”）副本的人，在不受限制的情况下处理该软件，包括但不限于使用、复制、修改、合并、出版、分发、再授权和/或出售该软件的副本，并允许提供本软件的人这样做，须遵守以下条件：

以上版权声明和本许可声明应包含在所有副本或软件的实质性部分中。

该软件是“按原样”提供的，不保证任何种类，无论是明示或暗示，包括但不限于对适销性、特定目的适用性和不侵权的保证。在任何情况下，作者或版权持有者均不对因使用或其他交易所引起的任何索赔、损害或其他责任负责，无论是合同、侵权或其他原因。

[maintenance-shield]: https://img.shields.io/maintenance/yes/2024.svg
[aarch64-shield]: https://img.shields.io/badge/aarch64-yes-green.svg
[amd64-shield]: https://img.shields.io/badge/amd64-yes-green.svg
[armhf-shield]: https://img.shields.io/badge/armhf-yes-green.svg
[armv7-shield]: https://img.shields.io/badge/armv7-yes-green.svg
[i386-shield]: https://img.shields.io/badge/i386-yes-green.svg
[FaserF]: https://github.com/FaserF/
[issue]: https://github.com/FaserF/hassio-addons/issues