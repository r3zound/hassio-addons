# 家庭助手插件：Trillium
Trilium Notes 是一个层级笔记应用程序，专注于构建大型个人知识库。

_感谢所有为我的仓库加星的人！要加星，请点击下方的图片，然后会出现在右上方。谢谢！_

[![Stargazers repo roster for @jdeath/homeassistant-addons](https://reporoster.com/stars/jdeath/homeassistant-addons)](https://github.com/jdeath/homeassistant-addons/stargazers)

## 特性

* 笔记可以排列成任意深度的树。单个笔记可以放置在树的多个位置（见 [克隆](https://github.com/zadam/trilium/wiki/Cloning-notes)）
* 丰富的所见即所得的笔记编辑，包括如表格、图片和 [数学](https://github.com/zadam/trilium/wiki/Text-notes#math-support) 支持，带有 markdown [自动格式化](https://github.com/zadam/trilium/wiki/Text-notes#autoformat)
* 支持编辑 [带源代码的笔记](https://github.com/zadam/trilium/wiki/Code-notes)，包括语法高亮
* 快速简便的 [笔记导航](https://github.com/zadam/trilium/wiki/Note-navigation)，全文搜索和 [笔记提升](https://github.com/zadam/trilium/wiki/Note-hoisting)
* 无缝的 [笔记版本管理](https://github.com/zadam/trilium/wiki/Note-revisions)
* 笔记 [属性](https://github.com/zadam/trilium/wiki/Attributes) 可用于笔记组织、查询和高级 [脚本编写](https://github.com/zadam/trilium/wiki/Scripts)
* 与自托管同步服务器的 [同步](https://github.com/zadam/trilium/wiki/Synchronization)
  * 这里有一个 [第三方服务用于托管同步服务器](https://trilium.cc/paid-hosting)
* [共享](https://github.com/zadam/trilium/wiki/Sharing)（发布）笔记到公共互联网
* 强大的 [笔记加密](https://github.com/zadam/trilium/wiki/Protected-notes)，按笔记粒度
* 使用内置 Excalidraw 绘制图表（笔记类型为“画布”）
* 用于可视化笔记及其关系的 [关系图](https://github.com/zadam/trilium/wiki/Relation-map) 和 [链接图](https://github.com/zadam/trilium/wiki/Link-map)
* [脚本编写](https://github.com/zadam/trilium/wiki/Scripts) - 参见 [高级展示](https://github.com/zadam/trilium/wiki/Advanced-showcases)
* 用于自动化的 [REST API](https://github.com/zadam/trilium/wiki/ETAPI)
* 在可用性和性能上良好扩展，支持超过 100,000 条笔记
* 触摸优化的 [移动前端](https://github.com/zadam/trilium/wiki/Mobile-frontend)，适用于智能手机和平板电脑
* [夜间主题](https://github.com/zadam/trilium/wiki/Themes)
* [印象笔记](https://github.com/zadam/trilium/wiki/Evernote-import) 和 [Markdown 导入与导出](https://github.com/zadam/trilium/wiki/Markdown)
* [网页剪辑工具](https://github.com/zadam/trilium/wiki/Web-clipper)，便于保存网页内容

## 安装

1. [将我的 Hass.io 插件仓库][repository] 添加到你的 Hass.io 实例。
1. 安装此插件。
1. 单击 `保存` 按钮以存储你的配置。
1. 在你的 homeassistant 上创建目录 `/share/trillium/`
1. 通过 SSH 登录到你的 home assistant 并运行 `chmod 2777 /share/trillium`
1. 启动插件。
1. 检查插件的日志以查看一切是否正常。
1. 转到本地 homeassistant 的 IP:端口管理端口或入口。
1. 按照说明操作

```
port : 8000 #你想运行管理界面的端口。
```

Web 界面可以在 `<your-ip>:port` 或入口中找到。

[repository]: https://github.com/jdeath/homeassistant-addons