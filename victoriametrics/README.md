# 非官方 Home Assistant 插件：Victoria Metrics

Victoria Metrics (<https://github.com/VictoriaMetrics/VictoriaMetrics>) 被打包为 Home Assistant 插件。

![aarch64-shield](https://img.shields.io/badge/aarch64-yes-green)
![amd64-shield](https://img.shields.io/badge/amd64-yes-green)
![armv7-shield](https://img.shields.io/badge/armv7-yes-green)
![i386-shield](https://img.shields.io/badge/i386-yes-green)

## 安装

按照以下步骤在您的系统上安装此插件：

1. 在您的 Home Assistant 前端导航至 **Supervisor -> 添加-ons 商店**
1. 通过 URL 添加此新仓库
   ( `https://github.com/bluemaex/home-assistant-addons` )
1. 找到 "Unpoller" 插件并点击它。
1. 点击 "安装" 按钮
1. 阅读插件中的文档
1. 根据您的喜好调整您的配置
1. 开始长期跟踪 👍

## 关于

VictoriaMetrics 是一个快速、经济且可扩展的监控解决方案和时间序列数据库。如果您想为您的 HomeAssistant 数据提供长期存储并进行超出默认 HomeAssistant 保留期的自定义评估，它是一个很好的选择。

您可以通过两种不同的方式运行此插件：

### 服务器

在低规格计算机（如 Raspberry PI）上运行一个完整的
[超高效时间序列数据库](https://github.com/VictoriaMetrics/VictoriaMetrics#prominent-features) 服务器。

### 代理

此插件使得本地抓取（即获取）指标变得容易，将它们缓存到本地临时数据库，并在能够连接时尽快将其发送到您的集中式 Victoria Metrics 时间序列数据库服务器，从而即使在数据库停机或暂时无法访问时也能够拥有完整的数据。

## 最后的说明

有关如何配置此插件的信息，请参考插件页面中的
[文档](DOCS.md)

该项目与 Victoria Metrics、Victoria Metrics 维护团队无关，仅仅是社区的努力。Victoria Metrics 本身根据
[Apache License 2.0](https://github.com/VictoriaMetrics/VictoriaMetrics/blob/master/LICENSE) 发布。