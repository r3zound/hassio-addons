# 家庭助手插件：Changedetection.io

**最佳和最简单的自托管免费开源网站变更检测跟踪、监控和通知服务。替代 Visualping、Watchtower 等。旨在简单——主要目标是免费监控哪些网站发生了文本变化。免费开源网页变更检测**

#### 示例用例

- 产品和服务定价变化
- _缺货通知_ 和 _补货通知_
- 政府部门更新（变更通常仅在其网站上发布）
- 新软件发布、您未在其邮件列表时的安全公告。
- 具有更改的节日
- 房地产上市变更
- 知道您最喜欢的威士忌何时打折，或其他特价交易在其他人之前宣布
- 政府网站的 COVID 相关新闻
- 大学/组织网站的新闻
- 检测和监控 JSON API 响应中的变化
- JSON API 监控和报警
- 法律和其他文件中的变化
- 当网站上出现文本时通过通知触发 API 调用
- 使用 JSON 过滤器和 JSON 通知将 API 粘合在一起
- 根据网页内容的变化创建 RSS 订阅
- 监控 HTML 源代码以检测意外更改，增强您的 PCI 合规性
- 您有一个非常敏感的 URL 列表需要关注，而您不想使用付费替代品。 （记住，_您_ 是产品）

_需要一个真正的 Chrome 运行器，并支持 Javascript 吗？我们支持通过 WebDriver 和 Playwright 提取数据！</a>_

#### 主要特性

- 许多触发过滤器，例如“在文本上触发”、“通过选择器移除文本”、“忽略文本”、“提取文本”，还使用正则表达式！
- 使用 xPath 和 CSS 选择器定位元素，轻松监控复杂的 JSON，使用 JsonPath 规则
- 在快速的非 JS 和基于 Chrome JS 的“提取器”之间切换
- 轻松指定网站检查的频率
- 在提取文本之前执行 JS（适合登录，查看 UI 中的示例！）
- 覆盖请求头，指定 `POST` 或 `GET` 等其他方法
- 使用“可视选择器”帮助定位特定元素

_感谢所有为我的仓库添加星标的人！要添加星标，请点击下方的图片，然后它将位于右上角。谢谢！_

[![Stargazers repo roster for @jdeath/homeassistant-addons](https://reporoster.com/stars/jdeath/homeassistant-addons)](https://github.com/jdeath/homeassistant-addons/stargazers)

## 主要特性


## 安装

此插件的安装非常简单，与安装任何其他 Hass.io 插件没有区别。

1. [将我的 Hass.io 插件库][repository] 添加到您的 Hass.io 实例。
1. 安装此插件。
1. 前往 ip:port。Ingress 一般有效，但页面可能无法正确渲染


## 如何使用启用 Playwright JS 的提取器，而不是内置的文本/HTTP 客户端

Changedetection.io 插件本身只能使用内置的文本/HTTP 客户端提取网站。

许多现代网页使用 JavaScript 填充内容，它们更动态，有时需要真正的 Chrome 浏览器进行内容提取，尽管许多可能与内置的“提取器”一起工作。

您可以配置 Changedetection.io 使用 Playwright 提取页面，否则将使用内置的非 JS 浏览器进行提取。使用 Playwright 提取器提供了完整的 Changedetection.io 功能，包括提取内容的 JS 浏览器步骤和可视过滤选择器。

要使用 Playwright 提取器，Changedetection.io 插件需要与 alexbelgium 制作的无浏览器 Chrome 插件配合使用。

要安装无浏览器 Chrome 插件，请在 Homeassistant 中添加 alexbelgium/hassio-addons 仓库（https://github.com/alexbelgium/hassio-addons/）。从 Homeassistant 界面安装并启动插件。要使用 Playwright 提取器，只需在“请求”选项卡中添加新站点进行监控时勾选“Playwright Chromium/Javascript”，或要将其设置为所有监控站点的系统标准，请前往您的 Changedetection.io 插件的 Web 界面 > 设置 > 提取，并选择“Playwright Chromium/Javascript”。

有关无浏览器 Chrome 插件的更多信息：https://github.com/alexbelgium/hassio-addons/tree/master/browserless_chrome

两个插件需要在同一台机器上运行。在 Raspberry Pi 4B 上测试通过 Home Assistant 2023.5.3/Supervisor 2023.04.1/Operating System 10.1，但应在任何其他版本和 amd64 设备上正常工作。

注意：无浏览器 Chrome 插件在提取网站时非常消耗资源，尤其是在 RAM 和 CPU 中。它在 RPi 4B 上运行良好，但在旧设备上可能会较慢。最大同时提取限制为 1。

[repository]: https://github.com/jdeath/homeassistant-addons