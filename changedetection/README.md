# Home assistant add-on: Changedetection.io

**最佳和最简单的自托管免费开源网站变更检测跟踪、监控和通知服务。是Visualping、Watchtower等的替代品。设计简单——主要目标只是免费监控哪些网站发生了文本变化。免费开源网页变更检测**

#### 示例用例

- 产品和服务的价格发生变化
- _缺货通知_和_补货通知_
- 政府部门更新（变更通常仅在他们的网站上）
- 新软件发布、安全建议，当您不在他们的邮件列表时。
- 节日的变化
- 房地产列表变更
- 了解您最喜欢的威士忌何时打折，或其他特别交易在别人之前宣布
- 政府网站上的COVID相关消息
- 大学/组织网站上的新闻
- 检测和监控JSON API响应中的变化
- JSON API监控和警报
- 法律和其他文件的变化
- 当网站上出现文本时通过通知触发API调用
- 使用JSON过滤器和JSON通知将API粘合在一起
- 基于网页内容的变化创建RSS源
- 监控HTML源代码的意外变化，加强您的PCI合规性
- 您有一个非常敏感的URL列表需要监控，并且您_不_想使用付费替代方案。（记住，_您_是产品）

_需要一个实际的支持JavaScript的Chrome runner吗？我们支持通过WebDriver和Playwright进行抓取！</a>_

#### 主要特点

- 许多触发过滤器，例如“根据文本触发”、“按选择器删除文本”、“忽略文本”、“提取文本”，还可以使用正则表达式！
- 使用xPath和CSS选择器定位元素，轻松监控复杂的JSON使用JsonPath规则
- 在快速的非JS和基于Chrome JS的“抓取器”之间切换
- 轻松指定站点应该检查的频率
- 在提取文本之前执行JS（适合登录，查看UI中的示例！）
- 覆盖请求头，指定`POST`或`GET`及其他方法
- 使用“可视选择器”帮助定位特定元素

_感谢所有为我的仓库加星的人！要给它加星，请单击下面的图像，然后它将出现在右上角。谢谢！_

[![Stargazers repo roster for @jdeath/homeassistant-addons](https://reporoster.com/stars/jdeath/homeassistant-addons)](https://github.com/jdeath/homeassistant-addons/stargazers)

## 主要特点


## 安装

该附加组件的安装非常简单，与安装任何其他Hass.io附加组件没有区别。

1. [将我的Hass.io附加组件仓库][repository]添加到您的Hass.io实例中。
1. 安装此附加组件。
1. 转到ip:port。 Ingress大致可用，但页面无法正确呈现


## 如何使用启用Playwright JS的抓取器，而不是内置的Plaintext/HTTP客户端

Changedetection.io插件本身只能使用内置的Plaintext/HTTP客户端抓取网站。

许多现代网页使用JavaScript填充内容，它们更具动态性，有时需要真正的Chrome浏览器来抓取内容，尽管许多可能可以与内置的“抓取器”一起工作。

您可以配置Changedetection.io以使用Playwright抓取器抓取页面，否则它将使用普通的非JS内置浏览器进行抓取。使用Playwright抓取器提供完整的Changedetection.io功能，包括JS浏览器步骤来抓取内容和可视过滤选择器。

要使用Playwright抓取器，Changedetection.io插件需要与alexbelgium制作的无浏览器Chrome插件合作。

要安装无浏览器Chrome插件，请在Homeassistant中添加alexbelgium/hassio-addons仓库（https://github.com/alexbelgium/hassio-addons/）。从Homeassistant界面安装并启动该附加组件。要使用Playwright抓取器，只需在添加要监控的新站点时，在“请求”选项卡中勾选“Playwright Chromium/Javascript”，或将其设置为所有监控站点的系统标准，转到Changedetection.io插件的Web界面 > 设置 > 抓取，选择“Playwright Chromium/Javascript”。

有关无浏览器Chrome插件的更多信息：https://github.com/alexbelgium/hassio-addons/tree/master/browserless_chrome

两个插件需要在同一台机器上运行。在Raspberry Pi 4B上使用Home Assistant 2023.5.3/Supervisor 2023.04.1/Operating System 10.1进行了测试，但应该能在其他版本和amd64设备上工作。

注意：无浏览器Chrome插件在抓取网站时相当占用资源，无论是内存还是CPU。在RPi 4B上运行良好，但在较旧的设备上可能会变慢。最大并行抓取限制为1。


[repository]: https://github.com/jdeath/homeassistant-addons