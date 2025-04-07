# Home assistant 插件: Trillium Next Notes
Trilium Next Notes 是一个层级笔记应用程序，专注于构建大型个人知识库。

_感谢每一位在我的仓库上点击星标的朋友！要给它点星，请点击下方的图片，然后它将在右上角显示。谢谢！_

[![Stargazers repo roster for @jdeath/homeassistant-addons](https://reporoster.com/stars/jdeath/homeassistant-addons)](https://github.com/jdeath/homeassistant-addons/stargazers)

## 特性

* 笔记可以安排成任意深度的树形结构。单个笔记可以放置在树中的多个位置（见 [克隆](https://triliumnext.github.io/Docs/Wiki/cloning-notes)）
* 丰富的所见即所得（WYSIWYG）笔记编辑功能，包括例如表格、图像和 [数学](https://triliumnext.github.io/Docs/Wiki/text-notes) 以及 markdown [自动格式化](https://triliumnext.github.io/Docs/Wiki/text-notes#autoformat)
* 支持编辑 [带源代码的笔记](https://triliumnext.github.io/Docs/Wiki/code-notes)，包括语法高亮
* 快速且简易的 [笔记间导航](https://triliumnext.github.io/Docs/Wiki/note-navigation)，全文本搜索和 [笔记提升](https://triliumnext.github.io/Docs/Wiki/note-hoisting)
* 无缝的 [笔记版本控制](https://triliumnext.github.io/Docs/Wiki/note-revisions)
* 笔记 [属性](https://triliumnext.github.io/Docs/Wiki/attributes) 可用于笔记组织、查询和高级 [脚本](https://triliumnext.github.io/Docs/Wiki/scripts)
* 与自托管同步服务器的 [同步](https://triliumnext.github.io/Docs/Wiki/synchronization)
  * 有一个 [第三方服务](https://trilium.cc/paid-hosting) 提供同步服务器托管
* 将笔记 [分享](https://triliumnext.github.io/Docs/Wiki/sharing) （发布）到公共互联网
* 强大的 [笔记加密](https://triliumnext.github.io/Docs/Wiki/protected-notes)，支持逐笔记粒度
* 使用内置 Excalidraw 绘制图表（笔记类型为 "canvas"）
* [关系图](https://triliumnext.github.io/Docs/Wiki/relation-map) 和 [链接图](https://triliumnext.github.io/Docs/Wiki/link-map) 来可视化笔记及其关系
* [脚本](https://triliumnext.github.io/Docs/Wiki/scripts) - 见 [高级展示](https://triliumnext.github.io/Docs/Wiki/advanced-showcases)
* 用于自动化的 [REST API](https://triliumnext.github.io/Docs/Wiki/etapi)
* 在可用性和性能方面，在超过 100,000 个笔记时扩展良好
* 触控优化的 [移动前端](https://triliumnext.github.io/Docs/Wiki/mobile-frontend) 适用于智能手机和平板电脑
* [夜间主题](https://triliumnext.github.io/Docs/Wiki/themes)
* 支持 [Evernote](https://triliumnext.github.io/Docs/Wiki/evernote-import) 和 [Markdown 导入与导出](https://triliumnext.github.io/Docs/Wiki/markdown)
* 用于轻松保存网页内容的 [网页剪辑器](https://triliumnext.github.io/Docs/Wiki/web-clipper)

## 安装

1. [将我的 Hass.io 插件仓库][repository] 添加到你的 Hass.io 实例中。
1. 安装此插件。
1. 点击 `Save` 按钮以保存你的配置。
1. 启动插件。它会失败，这没关系。
1. SSH 登录到你的 home assistant 并运行 `chmod 2777 /2effc9b9/trilliumnext`
1. 启动插件。
1. 检查插件的日志以确保一切正常。
1. 转到你的本地 homeassistant IP:port 管理端口或入口。
1. 按照指示操作。

```
port : 8000 # 你想要运行管理界面的端口。
```

Webui 可以在 `<your-ip>:port` 或入口中找到。

[repository]: https://github.com/jdeath/homeassistant-addons