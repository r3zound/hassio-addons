# Home assistant add-on: Changedetection.io

**最好的、最简单的自托管免费开源网站变更检测跟踪、监控和通知服务。是 Visualping、Watchtower 等的替代品。旨在简化 - 主要目标是免费监控哪些网站发生了文本变化。免费开源网页变更检测**

#### 示例用例

- 产品和服务的价格发生变化
- _缺货通知_ 和 _重新到货通知_
- 政府部门更新（更改通常仅在其网站上进行）
- 新软件发布、安全通告当你不在他们的邮件列表中时。
- 节日的变化
- 房地产清单变化
- 知道你喜欢的威士忌何时打折，或者其他特殊交易在别人之前宣布
- 政府网站的 COVID 相关消息
- 大学/组织网站的新闻
- 检测和监控 JSON API 响应中的变化
- JSON API 监控和警报
- 法律和其他文件的更改
- 当网站出现文本时，通过通知触发 API 调用
- 使用 JSON 过滤器和 JSON 通知将 API 拼接在一起
- 基于网页内容变化创建 RSS 源
- 监控 HTML 源代码的意外变化，加强你的 PCI 合规
- 你有一个非常敏感的 URL 列表需要监控，你不想使用付费替代方案。 (请记住，_你_ 是产品)

_需要一个实际的 Chrome 运行器并支持 Javascript 吗？我们支持通过 WebDriver 和 Playwright 进行提取！</a>_

#### 主要特性

- 许多触发过滤器，例如“在文本上触发”、“通过选择器删除文本”、“忽略文本”、“提取文本”，还可以使用正则表达式！
- 使用 xPath 和 CSS 选择器定位元素，轻松监控复杂的 JSON，使用 JsonPath 规则
- 在快速的非 JS 和基于 Chrome JS 的“提取器”之间切换
- 轻松指定网站应该检查的频率
- 在提取文本之前执行 JS（适合登录，查看 UI 中的示例！）
- 覆盖请求头，指定 `POST` 或 `GET` 及其他方法
- 使用“可视选择器”帮助定位特定元素

_感谢所有关注我的仓库的人！要关注它，请点击下面的图像，然后它将在右上方显示。谢谢！_

[![Stargazers repo roster for @jdeath/homeassistant-addons](https://reporoster.com/stars/jdeath/homeassistant-addons)](https://github.com/jdeath/homeassistant-addons/stargazers)

## 主要特性


## 安装

安装此插件非常简单，与安装其他 Hass.io 插件没有区别。

1. [将我的 Hass.io 插件库][repository] 添加到你的 Hass.io 实例。
1. 安装此插件。
1. 前往 ip:port。 Ingress 基本可用，但页面没有正确渲染


## 如何使用启用 Playwright JS 的提取器而不是内置的纯文本/HTTP 客户端

Changedetection.io 插件本身只能使用内置的纯文本/HTTP 客户端提取网站。

许多现代网页使用 JavaScript 填充内容，它们更加动态，有时需要一个真实的 Chrome 浏览器来获取内容，尽管许多可能与内置的“提取器”一起工作。

你可以配置 Changedetection.io 使用 Playwright 提取器提取页面，否则它将使用纯非 JS 内置浏览器进行提取。使用 Playwright 提取器提供了完整的 Changedetection.io 功能，包括 JS 浏览器步骤以提取内容和可视过滤选择器。

要使用 Playwright 提取器，Changedetection.io 插件需要与由 alexbelgium 制作的 Browserless Chrome 插件配合使用。

要安装 Browserless Chrome 插件，请在 Homeassistant 中添加 alexbelgium/hassio-addons 仓库（https://github.com/alexbelgium/hassio-addons/）。从 Homeassistant 界面安装并启动该插件。要使用 Playwright 提取器，只需在添加要监控的新网站时，在“请求”选项卡中勾选“Playwright Chromium/Javascript”，或将其设置为所有监控网站的系统标准，前往你的 Changedetection.io 插件的 Web 界面 > 设置 > 提取，选择“Playwright Chromium/Javascript”。

有关 Browserless Chrome 插件的更多信息：https://github.com/alexbelgium/hassio-addons/tree/master/browserless_chrome

两个插件需要在同一台机器上运行。在 Raspberry Pi 4B 上测试通过 Home Assistant 2023.5.3/Supervisor 2023.04.1/Operating System 10.1，但应该与其他任何版本和 amd64 设备配合使用。

注意：Browserless Chrome 插件在提取网站时相当占用资源，无论是 RAM 还是 CPU。 在 RPi 4B 上表现良好，可能在较旧的设备上速度较慢。最大并发提取限制为 1。


[repository]: https://github.com/jdeath/homeassistant-addons