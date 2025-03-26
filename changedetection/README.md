# Home assistant add-on: Changedetection.io

**最佳和最简单的自托管免费开源网站变更检测跟踪、监控和通知服务。是Visualping、Watchtower等的替代方案。旨在简单易用——主要目标是免费监控哪个网站发生了文本变化。免费的开源网页变更检测**

#### 示例用例

- 产品和服务价格变动
- _缺货通知_和_重新入库通知_
- 政府部门更新（变更通常仅在其网站上）
- 新软件发布、安全通告，当你不在他们的邮件列表中时。
- 节日变动
- 房地产列表变更
- 了解你喜欢的威士忌何时打折，或其他特价在任何人之前宣布
- 来自政府网站的COVID相关新闻
- 大学/组织来自其网站的新闻
- 检测和监控JSON API响应中的变更
- JSON API监控和警报
- 法律及其他文档的变更
- 当网站上出现文本时通过通知触发API调用
- 使用JSON过滤器和JSON通知将API聚合在一起
- 基于网页内容变化创建RSS源
- 监控HTML源代码的意外变化，加强你的PCI合规性
- 你有非常敏感的URL列表需要监控，并且你不想使用付费替代方案。（记住，_你_就是产品）

_需要一个实际支持JavaScript的Chrome运行器？我们支持通过WebDriver和Playwright获取！</a>_

#### 主要特性

- 许多触发过滤器，例如“根据文本触发”、“按选择器移除文本”、“忽略文本”、“提取文本”，还可以使用正则表达式！
- 用xPath和CSS选择器定位元素，轻松监控复杂JSON，使用JsonPath规则
- 在快速非JS和基于Chrome JS的“获取器”之间切换
- 轻松指定检查网站的频率
- 在提取文本之前执行JS（适合登录，查看UI中的示例！）
- 覆盖请求头，指定`POST`或`GET`和其他方法
- 使用“可视选择器”帮助定位特定元素

_感谢每一个给我的仓库加星的人！要加星，请点击下面的图片，然后它会在右上角。谢谢！_

[![Stargazers repo roster for @jdeath/homeassistant-addons](https://reporoster.com/stars/jdeath/homeassistant-addons)](https://github.com/jdeath/homeassistant-addons/stargazers)

## 主要特性


## 安装

该附加组件的安装非常简单，与安装任何其他Hass.io附加组件没有区别。

1. [将我的Hass.io附加组件库][repository]添加到你的Hass.io实例中。
1. 安装此附加组件。
1. 访问ip:port。Ingress可以正常工作，但页面未正确渲染


## 如何使用启用Playwright JS的获取器而不是内置的Plaintext/HTTP客户端

Changedetection.io附加组件本身只能使用内置的Plaintext/HTTP客户端获取网站。

许多现代网页使用JavaScript填充内容，它们更加动态，有时需要真正的Chrome浏览器来获取内容，尽管许多可能与内置的“获取器”正常工作。

你可以配置Changedetection.io使用Playwright获取页面，否则它将使用一个非JS的内置浏览器进行获取。使用Playwright获取器提供了完整的Changedetection.io功能，包括JS浏览器步骤来获取内容和视觉过滤器选择器。

要使用Playwright获取器，Changedetection.io附加组件需要与alexbelgium制作的无浏览器Chrome附加组件配合使用。

要安装无浏览器Chrome附加组件，请在Homeassistant中添加alexbelgium/hassio-addons库（https://github.com/alexbelgium/hassio-addons/）。从Homeassistant界面安装并启动该附加组件。要使用Playwright获取器，只需在添加新要监控的网站时，在“请求”标签中勾选“Playwright Chromium/Javascript”，或将其设定为所有监控网站的系统标准，进入你的Changedetection.io附加组件的Web界面>设置>获取，并选择“Playwright Chromium/Javascript”。

有关无浏览器Chrome附加组件的更多信息：https://github.com/alexbelgium/hassio-addons/tree/master/browserless_chrome

两个附加组件需要在同一台机器上运行。在Raspberry Pi 4B上的Home Assistant 2023.5.3/Supervisor 2023.04.1/操作系统10.1上测试，但应该适用于其他版本和amd64设备。

注意：无浏览器Chrome附加组件在获取网站时相当消耗资源，无论是内存还是CPU。在RPi 4B上运行良好，可能在旧设备上表现缓慢。最大同时获取限制为1。

[repository]: https://github.com/jdeath/homeassistant-addons