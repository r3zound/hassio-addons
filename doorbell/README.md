# Home Assistant 插件：海康威视门铃

<p align="center">
   <a href="https://img.shields.io/badge/amd64-yes-green.svg">
      <img alt="支持 amd64 架构" src="https://img.shields.io/badge/amd64-yes-green.svg">
   </a>
   <a href="https://img.shields.io/badge/aarch64-yes-green.svg">
      <img alt="支持 aarch64 架构" src="https://img.shields.io/badge/aarch64-yes-green.svg">
   </a>
   <a href="https://img.shields.io/badge/i386-yes-green.svg">
      <img alt="支持 i386 架构" src="https://img.shields.io/badge/i386-yes-green.svg">
   </a>
</p>

将您的海康威视IP门铃连接到Home Assistant，以接收事件（如运动检测或来电）并发送命令（如打开连接到门铃继电器的门或拒绝来电）。

__注意__: 这是插件的稳定版本。
我们欢迎您的反馈！如果您有任何疑问，想要报告问题或只是想发言，请查看 [Github 问题页面](https://github.com/pergolafabio/Hikvision-Addons/issues) 并给我们留言！

## 特性
- 捕捉门铃 **事件**：_门铃响_ / _运动检测_ / _门解锁_ / _防拆警报_
- **打开** 连接到门铃的门（_对于端口 80 被阻止且 `ISAPI` 不可用的旧设备特别有用_）
- 远程操作，如 **接听**/**拒绝** 来电，**挂断**。

   _这可以在HA自动化中利用。例如，当Zigbee门传感器发出门已开启的信号时，室内电话和Hik-Connect设备的铃声将被停止。有关更多详细信息，请参阅文档。_
- **重启** 门铃
- 支持远程场景，例如 **在家**/**外出**/**上床**/**自定义**

### 示例

这是一个示例设置，显示两个门铃，一个室内和一个室外单元：

<p align="center">
   <img src="https://raw.githubusercontent.com/pergolafabio/Hikvision-Addons/dev/hikvision-doorbell/assets/docs_sensors.png" width="500px">
</p>

确保在此处阅读完整文档！ [Readme](DOCS.md)

## 开始使用

**注意**：**海康威视门铃** 需要一个MQTT代理才能正常工作。请参阅插件的 **文档** 选项卡以了解如何设置官方 **Mosquitto 插件**。

__注意__: 要使用此 _稳定_ 版本，请在您的 Home Assistant 个人资料中启用 __高级模式__：
   - 点击您的用户名（在 Home Assistant 界面的左下角）
   - 向下滚动到个人资料页面并切换 __高级模式__
     <p align="center">
     <img src="https://user-images.githubusercontent.com/4510647/221361317-a9076a72-9762-4320-8302-24414e6019f2.png" width="600">
     </p>
- 点击以下按钮以自动在您的 Home Assistant 界面中打开插件：
   <p align="center">
      <a href="https://my.home-assistant.io/redirect/supervisor_addon/?addon=aff2db71_hikvision_doorbell_beta&repository_url=https%3A%2F%2Fgithub.com%2Fpergolafabio%2FHikvision-Addons" target="_blank">
         <img src="https://my.home-assistant.io/badges/supervisor_addon.svg" alt="打开您的 Home Assistant 实例并显示 Supervisor 插件的仪表板。" />
      </a>
   </p>

   如果您遇到问题，以下是手动步骤：
   - 打开您的 Home Assistant 界面，导航至 `设置` -> `插件` -> `插件商店` -> `存储库` （在右上角）
   - 在输入框中粘贴以下网址： `https://github.com/pergolafabio/Hikvision-Addons`
   - 点击 **添加** 确认对话框。
   - **海康威视门铃（测试版）** 应该在您的 Home Assistant 的 _插件商店_ 中可用。（如果几分钟后仍不可见，请通过导航到 _设置_ -> _插件_ -> _插件商店_ 来重新加载商店页面。）
- 选择 **海康威视门铃（测试版）** 插件，然后点击 **安装**。
- 查看插件的 **文档** 选项卡，以设置所需的配置并了解如何将此插件集成到 Home Assistant中
（文档也可以在 [Github 存储库](DOCS.md) 在线浏览）。

## 支持的设备
该设备已被其他HA用户报告为可以正常工作。
如果您的设备不在列表中，我们很乐意将其添加。只需 [在此处打开一个问题](https://github.com/pergolafabio/Hikvision-Addons/issues) 在GitHub上让我们知道您拥有的设备类型。

- DS-KV8413
- DS-KD8003
- DS-KV8113
- DS-KV8213
- DS-KV6113
- DS-K1T34X
- DS-K1T67X
- DS-K1T670M
- DS-KB8113
- DS-KV9503（无来电事件）
- 似乎还有其他确认正常工作的品牌设备，例如：由Metzler制作的VDM10
- ...
- 这只是用户确认的列表，可能还有其他设备也在正常工作...
- DS-KV8102-IM（第一代不支持，只有开锁功能）
- DS-K1T502DBFWX（完全不支持）
- DS-HD1 和 DS-HD2 不支持？它们不支持ISAPI？

确保在此处阅读完整文档！ [Readme](DOCS.md)

## 其他资源
- [Home Assistant社区论坛](https://community.home-assistant.io/t/add-on-hikvision-doorbell-integration/532796)

## 贡献

这是一个活跃的开源项目。我们始终欢迎想要使用或为其做出贡献的人。感谢您的参与！:heart_eyes:

请查看 [文档文件夹](docs/) 获取更多信息。

### 贡献者
<a href="https://github.com/pergolafabio/Hikvision-Addons/graphs/contributors">
  <img src="https://contrib.rocks/image?repo=pergolafabio/Hikvision-Addons" />
</a>

使用 [contrib.rocks](https://contrib.rocks) 制作。

## 捐赠
 喜欢我的工作？您可以随时 [给我捐款](https://paypal.me/pergolafabio)。

## 致谢
该插件最初受到 [这个脚本](https://github.com/laszlojakab/hikvision-intercom-python-demo) 的启发。