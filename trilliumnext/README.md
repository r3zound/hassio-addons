# Home assistant 插件: Trillium Next Notes
Trilium Next Notes 是一个层级笔记应用程序，专注于建立大型个人知识库。

_感谢所有为我的仓库添加星标的朋友！要添加星标，请点击下面的图片，然后它会出现在右上角。谢谢！_

[![Stargazers repo roster for @jdeath/homeassistant-addons](https://reporoster.com/stars/jdeath/homeassistant-addons)](https://github.com/jdeath/homeassistant-addons/stargazers)

## 功能

* 笔记可以排列成任意深度的树。单个笔记可以放置在树中的多个位置（见 [克隆](https://triliumnext.github.io/Docs/Wiki/cloning-notes)
* 富文本所见即所得的笔记编辑，包括例如表格、图像和 [数学](https://triliumnext.github.io/Docs/Wiki/text-notes)，带有 markdown [自动格式化](https://triliumnext.github.io/Docs/Wiki/text-notes#autoformat)
* 支持编辑带有源代码的 [笔记](https://triliumnext.github.io/Docs/Wiki/code-notes)，包括语法高亮
* 快速且便捷的 [笔记导航](https://triliumnext.github.io/Docs/Wiki/note-navigation)、全文搜索和 [笔记提升](https://triliumnext.github.io/Docs/Wiki/note-hoisting)
* 无缝的 [笔记版本控制](https://triliumnext.github.io/Docs/Wiki/note-revisions)
* 笔记 [属性](https://triliumnext.github.io/Docs/Wiki/attributes) 可用于笔记组织、查询以及高级 [脚本编写](https://triliumnext.github.io/Docs/Wiki/scripts)
* 与自托管同步服务器的 [同步](https://triliumnext.github.io/Docs/Wiki/synchronization)
  * 有一个 [第三方服务用于托管同步服务器](https://trilium.cc/paid-hosting)
* 将笔记 [共享](https://triliumnext.github.io/Docs/Wiki/sharing)（发布）到公共互联网
* 强大的 [笔记加密](https://triliumnext.github.io/Docs/Wiki/protected-notes)，具有每个笔记粒度
* 使用内置的 Excalidraw 绘制图表（笔记类型为 "canvas"）
* 用于可视化笔记及其关系的 [关系图](https://triliumnext.github.io/Docs/Wiki/relation-map) 和 [链接图](https://triliumnext.github.io/Docs/Wiki/link-map)
* [脚本编写](https://triliumnext.github.io/Docs/Wiki/scripts) - 见 [高级展示](https://triliumnext.github.io/Docs/Wiki/advanced-showcases)
* 用于自动化的 [REST API](https://triliumnext.github.io/Docs/Wiki/etapi)
* 在可用性和性能上能够良好扩展至超过 100,000 个笔记
* 针对智能手机和平板电脑优化的 [移动前端](https://triliumnext.github.io/Docs/Wiki/mobile-frontend)
* [夜间主题](https://triliumnext.github.io/Docs/Wiki/themes)
* [Evernote](https://triliumnext.github.io/Docs/Wiki/evernote-import) 和 [Markdown 导入与导出](https://triliumnext.github.io/Docs/Wiki/markdown)
* 用于轻松保存网页内容的 [网页剪辑器](https://triliumnext.github.io/Docs/Wiki/web-clipper)

## 安装

1. [将我的 Hass.io 插件仓库][repository] 添加到你的 Hass.io 实例。
1. 安装此插件。
1. 点击 `保存` 按钮以存储你的配置。
1. 启动插件。它会失败，但没关系。
1. SSH 进入你的 home assistant 并运行 `chmod 2777 /2effc9b9/trilliumnext`
1. 启动插件。
1. 检查插件的日志以查看一切是否顺利。
1. 访问你的本地 homeassistant IP:port 管理端口或进入。
1. 按照指示操作。

```
port : 8000 #您希望在其上运行管理界面的端口。
```

Webui 可以在 `<your-ip>:port` 或入口访问。

[repository]: https://github.com/jdeath/homeassistant-addons