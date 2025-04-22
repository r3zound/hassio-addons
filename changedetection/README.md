# Home assistant add-on: Changedetection.io

**最佳和最简单的自托管免费开源网站变更检测跟踪、监控和通知服务。Visualping、Watchtower 等的替代方案。设计上追求简单性 - 主要目标是免费监控哪些网站有文本更改。免费开源网页变更检测**

#### 示例用例

- 产品和服务的价格发生变化
- _缺货通知_和_补货通知_
- 政府部门更新（更改通常只在他们的网站上）
- 新软件发布、您未在其邮件列表上的安全公告。
- 节日变更
- 房地产列表变更
- 知道您最喜欢的威士忌何时减价，或其他特惠在其他人之前宣布
- 政府网站相关的 COVID 消息
- 大学/组织的网站新闻
- 检测和监控 JSON API 响应中的更改
- JSON API 监控和警报
- 法律和其他文件的更改
- 当网站上出现文本时通过通知触发 API 调用
- 使用 JSON 过滤器和 JSON 通知将 API 整合在一起
- 基于网页内容的变化创建 RSS 订阅源
- 监控 HTML 源代码以查找意外更改，加强您的 PCI 合规性
- 您有一份非常敏感的 URL 列表需要监视，并且您不想使用付费替代方案。（记住，_您_ 是产品）

_需要一个具有 Javascript 支持的实际 Chrome 运行器吗？我们支持通过 WebDriver 和 Playwright 获取！</a>_

#### 关键功能

- 许多触发器过滤器，如“根据文本触发”、“按选择器删除文本”、“忽略文本”、“提取文本”，还可以使用正则表达式！
- 使用 xPath 和 CSS 选择器定位元素，轻松使用 JsonPath 规则监控复杂 JSON
- 在快速的非 JS 和基于 Chrome JS 的“获取器”之间切换
- 轻松指定应检查网站的频率
- 在提取文本之前执行 JS（适合登录，查看用户界面的示例！）
- 覆盖请求头，指定 `POST` 或 `GET` 以及其他方法
- 使用“视觉选择器”来帮助定位特定元素

_感谢每一个给我的仓库加星的人！要加星，请点击下面的图像，然后它将在右上角。谢谢！_

[![Stargazers repo roster for @jdeath/homeassistant-addons](https://reporoster.com/stars/jdeath/homeassistant-addons)](https://github.com/jdeath/homeassistant-addons/stargazers)

## 关键功能


## 安装

该附加组件的安装非常简单，与安装任何其他 Hass.io 附加组件没有不同。

1. [将我的 Hass.io 附加组件库][repository] 添加到您的 Hass.io 实例。
1. 安装该附加组件。
1. 转到 ip:port。Ingress 基本有效，但页面不正确呈现


## 如何使用启用 Playwright JS 的获取器替代内置的纯文本/HTTP 客户端

Changedetection.io 附加组件本身只能使用内置的纯文本/HTTP 客户端来获取网站。

许多现代网页使用 JavaScript 填充内容，它们更动态，有时需要真实的 Chrome 浏览器来获取内容，尽管许多可能在内置的“获取器”中正常工作。

您可以配置 Changedetection.io 使用 Playwright 获取页面，否则它将使用一个不支持 JS 的内置浏览器进行获取。使用 Playwright 获取器提供了完整的 Changedetection.io 功能，包括用于获取内容的 JS 浏览器步骤和视觉过滤选择器。

要使用 Playwright 获取器，Changedetection.io 附加组件需要与 alexbelgium 制作的无浏览器 Chrome 附加组件配合使用。

要安装无浏览器 Chrome 附加组件，请在 Homeassistant 中添加 alexbelgium/hassio-addons 仓库 (https://github.com/alexbelgium/hassio-addons/)。从 Homeassistant 界面安装并启动该附加组件。要使用 Playwright 获取器，只需在添加新监视网站时在“请求”选项卡中勾选“Playwright Chromium/Javascript”或将其设置为所有监视网站的系统标准，转到您的 Changedetection.io 附加组件的 Web 界面 > 设置 > 获取，选择“Playwright Chromium/Javascript”。

有关无浏览器 Chrome 附加组件的更多信息： https://github.com/alexbelgium/hassio-addons/tree/master/browserless_chrome

这两款附加组件需要在同一台机器上运行。在 Raspberry Pi 4B 上测试的版本为 Home Assistant 2023.5.3/Supervisor 2023.04.1/Operating System 10.1，但应该可以在任何其他版本及运行 amd64 设备的计算机上工作。

注意：无浏览器 Chrome 附加组件在获取网站时相当消耗资源，无论是 RAM 还是 CPU。 在 RPi 4B 上运行良好，但在旧设备上可能会很慢。 最大同时获取数量限制为 1。


[repository]: https://github.com/jdeath/homeassistant-addons