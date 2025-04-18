# Home assistant 插件：Changedetection.io

**最佳和最简单的自托管免费开源网站变更检测跟踪、监控和通知服务。是 Visualping、Watchtower 等的替代方案。旨在简单性 - 主要目标是免费监控哪些网站有文本更改。免费开源网页变更检测**

#### 示例用例

- 产品和服务的价格变动
- _缺货通知_ 和 _重新上架通知_
- 政府部门更新（更改通常只在他们的网站上）
- 新软件发布、防御安全通告，当您不在他们的邮件列表中时。
- 具有变更的节日
- 房地产列表变更
- 了解您最喜欢的威士忌打折时，或其他特别交易首次发布
- 政府网站的 COVID 相关新闻
- 大学/组织网站上的新闻
- 检测和监控 JSON API 响应中的变化
- JSON API 监控和警报
- 法律和其他文件中的变更
- 当网站上出现文本时通过通知触发 API 调用
- 使用 JSON 过滤器和 JSON 通知整合 API
- 基于网页内容的变更创建 RSS 源
- 监控 HTML 源代码中的意外更改，加强您的 PCI 合规性
- 您有一份非常敏感的 URL 列表需要监控，并且您不想使用付费替代方案。（记住，_您_ 是产品）

_需要一个真正支持 JavaScript 的 Chrome 运行器吗？我们支持通过 WebDriver 和 Playwright 获取！_

#### 主要特性

- 许多触发过滤器，如“根据文本触发”、“通过选择器移除文本”、“忽略文本”、“提取文本”，还可以使用正则表达式！
- 使用 xPath 和 CSS 选择器定位元素，轻松监控复杂的 JSON 以 JsonPath 规则
- 在快速的非 JS 和基于 Chrome 的 JS “获取器”之间切换
- 轻松指定检查网站的频率
- 在提取文本之前执行 JS（适用于登录，请参见 UI 中的示例！）
- 覆盖请求头，指定 `POST` 或 `GET` 和其他方法
- 使用“视觉选择器”帮助定位特定元素

_感谢所有给我的仓库加星的人！要给它加星，请点击下面的图片，然后它将位于右上方。感谢！_

[![Stargazers repo roster for @jdeath/homeassistant-addons](https://reporoster.com/stars/jdeath/homeassistant-addons)](https://github.com/jdeath/homeassistant-addons/stargazers)

## 主要特性


## 安装

安装此插件非常简单，与安装其他任何 Hass.io 插件没有区别。

1. [将我的 Hass.io 插件仓库][repository] 添加到您的 Hass.io 实例。
1. 安装此插件。
1. 访问 ip:port 。Ingress 大致有效，但页面不会正确渲染


## 如何使用启用 Playwright JS 的获取器来替代内置的纯文本/HTTP 客户端

Changedetection.io 插件本身只能使用内置的纯文本/HTTP 客户端获取网站。

许多现代网页使用 JavaScript 填充内容，它们更加动态，有时需要真正的 Chrome 浏览器来获取内容，尽管许多可能会与内置的“获取器”一起工作。

您可以配置 Changedetection.io 使用 Playwright 获取器来获取页面，否则它将使用纯非 JS 内置浏览器进行获取。使用 Playwright 获取器提供了完整的 Changedetection.io 功能，包括 JS 浏览器步骤以获取内容和可视过滤选择器。

要使用 Playwright 获取器，Changedetection.io 插件需要与 alexbelgium 制作的无浏览器 Chrome 插件配合使用。

要安装无浏览器 Chrome 插件，请在 Homeassistant 中添加 alexbelgium/hassio-addons 仓库 (https://github.com/alexbelgium/hassio-addons/)。从 Homeassistant 界面安装并启动插件。要使用 Playwright 获取器，只需在添加要监视的新网站时，在“请求”标签中勾选“Playwright Chromium/Javascript”或将其设置为所有监视站点的系统标准，进入您的 Changedetection.io 插件的网络界面 > 设置 > 获取，然后选择“Playwright Chromium/Javascript”。

有关无浏览器 Chrome 插件的更多信息：https://github.com/alexbelgium/hassio-addons/tree/master/browserless_chrome

这两个插件需要在同一台机器上运行。已在 Raspberry Pi 4B 上的 Home Assistant 2023.5.3/Supervisor 2023.04.1/操作系统 10.1 测试，但应该与其他任何版本和 amd64 设备正常工作。

注意：无浏览器 Chrome 插件在获取网站时资源消耗较大，内存和 CPU 均是如此。在 RPi 4B 上工作良好，在旧设备上可能会缓慢。最大并发获取限制为 1。


[repository]: https://github.com/jdeath/homeassistant-addons