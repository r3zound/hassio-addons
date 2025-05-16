# Home Assistant Community Add-on: motionEye

motionEye 是一个流行的摄像头软件 motion 的前端。该附加组件提供了这两者，允许您将摄像头添加到您的 Hass.io 设置中。

motionEye 是开源的 CCTV 和 NVR，优雅且易于使用。
它可以用作婴儿监视器、建筑工地监控查看器、商店摄像机 DVR、花园安全等。

motionEye的一些酷炫功能：

- 支持丰富数量的摄像头，包括 IP 摄像头。
- 通过将多个 motionEye 实例连接在一起添加多个摄像头。
  例如，在您的网络中使用 MotionEyeOS 在 Pi Zero + Pi 摄像机上。
- 支持将录像上传到 Google Drive 和 Dropbox。
- 运动检测，包括电子邮件通知和调度。
- 可以连续录制、运动录制或定时拍摄，并设置保留选项。
- 在配置中支持“[操作按钮][motioneye-wiki-action-buttons]”。

## 安装

此附加组件的安装非常简单，与安装任何其他 Home Assistant 附加组件没有不同。

1. 点击下面的 Home Assistant 我的按钮以在您的 Home
   Assistant 实例中打开附加组件。

   [![在您的 Home Assistant 实例中打开此附加组件.][addon-badge]][addon]

1. 点击“安装”按钮以安装附加组件。
1. 启动“motionEye”附加组件。
1. 检查“motionEye”附加组件的日志以查看是否一切正常。
1. 点击“打开 Web 界面”按钮以打开 Web 界面。
1. 使用用户名“admin”登录，无需密码。
1. 用安全密码编辑您的管理员帐户！

默认情况下，Home Assistant 自带了 Community Add-ons 商店。
但是，如果缺失（出于任何原因），您可以通过点击下面的我的按钮添加它。

[![将存储库添加到您的 Home Assitant 实例.][repository-badge]][repository]

## 配置

**注意**：_更改配置时请记得重新启动附加组件。_

示例附加组件配置：

```yaml
log_level: info
ssl: true
certfile: mycertfile.pem
keyfile: mykeyfile.pem
```

**注意**：_这只是一个示例，请不要复制和粘贴！自己创建！_

### 选项: `log_level`

`log_level` 选项控制附加组件的日志输出级别，可以根据需要更改为更详细或更简洁，以便在处理未知问题时可能会有用。可能的值有：

- `trace`: 显示每个细节，例如所有调用的内部函数。
- `debug`: 显示详细的调试信息。
- `info`: 正常（通常）有趣的事件。
- `warning`: 不属于错误的例外情况。
- `error`: 不需要立即采取行动的运行时错误。
- `fatal`: 发生了严重错误。附加组件变得不可用。

请注意，每个级别自动包含来自更高严重级别的日志消息，例如，`debug` 也会显示 `info` 消息。默认情况下，`log_level` 设置为 `info`，这是推荐的设置，除非您正在进行故障排除。

### 选项: `motion_webcontrol`

启用在端口 `7999` 上运行的运动 Web 控制端点。

:warning: MotionEye HTTP webcontrol **不支持** 认证
并且 **不支持** SSL！仅在您知道自己在做什么时启用此功能！**绝对** 不要将此端口暴露给外部世界！

### 选项: `ssl`

在 motionEye 的 Web 界面上启用/禁用 SSL (HTTPS)。设置为 `true` 以启用，反之则设置为 `false`。

### 选项: `certfile`

用于 SSL 的证书文件。

**注意**：_文件必须存储在 `/ssl/` 中，这是默认位置_

### 选项: `keyfile`

用于 SSL 的私钥文件。

**注意**：_文件必须存储在 `/ssl/` 中，这是默认位置_

### 选项: `action_buttons`

如果配置，将创建一个脚本来实现 [操作按钮][motioneye-wiki-action-buttons]。

示例操作按钮配置：

```yaml
action_buttons:
  - type: light_on
    camera: 1
    command: "curl -s 192.168.1.1/index.html?light=ON > /dev/null"
  - type: light_off
    camera: 1
    command: "curl -s 192.168.1.1/index.html?light=OFF > /dev/null"
```

#### 子选项: `action_buttons.type`

操作按钮类型。可接受的类型有：

- `lock` 和 `unlock`。
- `light_on` 和 `light_off`。
- `alarm_on` 和 `alarm_off`。
- `up`, `right`, `down`, 和 `left`。
- `zoom_in` 和 `zoom_out`。
- `preset1` 到 `preset9`。

#### 子选项: `action_buttons.camera`

摄像头的识别编号。对应于 motionEye UI 中设置的摄像头编号。

#### 子选项: `action_buttons.command`

在按钮被按下时要执行的 bash shell 命令。

## 更新日志与发布

该存储库使用 [GitHub 的 releases][releases] 功能保持变更日志。

版本基于 [语义版本控制][semver]，并使用 `MAJOR.MINOR.PATCH` 格式。简而言之，版本将根据以下内容递增：

- `MAJOR`：不兼容或重大更改。
- `MINOR`：向后兼容的新功能和增强功能。
- `PATCH`：向后兼容的错误修复和包更新。

## 支持

有问题？

您有几种选择可以得到答案：

- [Home Assistant Community Add-ons Discord 聊天服务器][discord] 以获取附加组件支持和功能请求。
- [Home Assistant Discord 聊天服务器][discord-ha] 以获取一般 Home Assistant 讨论和问题。
- Home Assistant [社区论坛][forum]。
- 加入 Reddit 社区 [Reddit subreddit][reddit] 在 [/r/homeassistant][reddit]

您还可以在这里 [打开问题][issue] GitHub。

## 作者与贡献者

该存储库的原始设置由 [Franck Nijhof][frenck] 完成。

有关所有作者和贡献者的完整列表，
请查看 [贡献者页面][contributors]。

## 许可证

MIT 许可证

版权所有 (c) 2018-2025 Franck Nijhof

特此授予任何获取本软件及相关文档文件（“软件”）副本的人，无条件地处理该软件的权利，包括但不限于使用、复制、修改、合并、出版、分发、再授权和/或销售该软件的副本，并允许提供软件的人这样做，条件如下：

上述版权声明和本权限声明应包含在所有副本或软件的重要部分中。

本软件按“原样”提供，不附带任何形式的保证，无论明示或暗示，包括但不限于对其适销性、特定用途的适用性和不侵权的保证。在任何情况下，作者或版权持有人均不对因使用本软件或其他交易的过程产生的任何索赔、损害或其他责任负责，无论是在合同、侵权或其他方面。

[addon-badge]: https://my.home-assistant.io/badges/supervisor_addon.svg
[addon]: https://my.home-assistant.io/redirect/supervisor_addon/?addon=a0d7b954_motioneye
[contributors]: https://github.com/hassio-addons/addon-motioneye/graphs/contributors
[discord-ha]: https://discord.gg/c5DvZ4e
[discord]: https://discord.me/hassioaddons
[dockerhub]: https://hub.docker.com/r/hassioaddons/motioneye
[forum]: https://community.home-assistant.io/t/home-assistant-community-add-on-motioneye/71826?u=frenck
[frenck]: https://github.com/frenck
[issue]: https://github.com/hassio-addons/addon-motioneye/issues
[motioneye-wiki-action-buttons]: https://github.com/motioneye-project/motioneye/wiki/Action-Buttons
[reddit]: https://reddit.com/r/homeassistant
[releases]: https://github.com/hassio-addons/addon-motioneye/releases
[repository-badge]: https://my.home-assistant.io/badges/supervisor_add_addon_repository.svg
[repository]: https://my.home-assistant.io/redirect/supervisor_add_addon_repository/?repository_url=https%3A%2F%2Fgithub.com%2Fhassio-addons%2Frepository
[semver]: https://semver.org/spec/v2.0.0.html