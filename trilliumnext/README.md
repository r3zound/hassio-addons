# 家庭助理插件：Trillium Next Notes
Trilium Next Notes 是一款层次化的笔记应用，专注于构建大型个人知识库。

_感谢所有给我的仓库星标的人！要给仓库星标，请点击下方的图片，然后在右上方进行星标。谢谢！_

[![Stargazers repo roster for @jdeath/homeassistant-addons](https://reporoster.com/stars/jdeath/homeassistant-addons)](https://github.com/jdeath/homeassistant-addons/stargazers)

## 特性

* 笔记可以排列成任意深度的树。单个笔记可以放置在树的多个位置（见 [克隆](https://triliumnext.github.io/Docs/Wiki/cloning-notes)）
* 丰富的所见即所得(WYSIWYG)笔记编辑，包括例如表格、图片和 [数学](https://triliumnext.github.io/Docs/Wiki/text-notes)，并支持 markdown [自动格式化](https://triliumnext.github.io/Docs/Wiki/text-notes#autoformat)
* 支持编辑 [带源代码的笔记](https://triliumnext.github.io/Docs/Wiki/code-notes)，包括语法高亮
* 快速且简单的 [笔记导航](https://triliumnext.github.io/Docs/Wiki/note-navigation)、全文搜索和 [笔记抬升](https://triliumnext.github.io/Docs/Wiki/note-hoisting)
* 无缝 [笔记版本控制](https://triliumnext.github.io/Docs/Wiki/note-revisions)
* 笔记 [属性](https://triliumnext.github.io/Docs/Wiki/attributes) 可用于笔记组织、查询和高级 [脚本](https://triliumnext.github.io/Docs/Wiki/scripts)
* [与自托管同步服务器的同步](https://triliumnext.github.io/Docs/Wiki/synchronization)
  * 有 [第三方服务提供同步服务器托管](https://trilium.cc/paid-hosting)
* [共享](https://triliumnext.github.io/Docs/Wiki/sharing)（发布）笔记到公共互联网
* 强大的 [笔记加密](https://triliumnext.github.io/Docs/Wiki/protected-notes)，具有每笔记粒度的加密
* 使用内置 Excalidraw 绘制图表（笔记类型为“画布”）
* [关系图](https://triliumnext.github.io/Docs/Wiki/relation-map) 和 [链接图](https://triliumnext.github.io/Docs/Wiki/link-map) 以可视化笔记及其关系
* [脚本](https://triliumnext.github.io/Docs/Wiki/scripts) - 参见 [高级展示](https://triliumnext.github.io/Docs/Wiki/advanced-showcases)
* 用于自动化的 [REST API](https://triliumnext.github.io/Docs/Wiki/etapi)
* 可扩展性良好，能够处理超过 100,000 条笔记的可用性和性能
* 触摸优化的 [移动前端](https://triliumnext.github.io/Docs/Wiki/mobile-frontend) 适用于智能手机和平板电脑
* [夜间主题](https://triliumnext.github.io/Docs/Wiki/themes)
* [Evernote](https://triliumnext.github.io/Docs/Wiki/evernote-import) 和 [Markdown 导入与导出](https://triliumnext.github.io/Docs/Wiki/markdown)
* [网页剪辑器](https://triliumnext.github.io/Docs/Wiki/web-clipper) 方便保存网页内容


## 安装

1. [将我的 Hass.io 添加-ons 仓库][repository] 添加到您的 Hass.io 实例。
1. 安装此插件。
1. 点击 `保存` 按钮以存储您的配置。
1. 启动插件。它会失败，这是正常的。
1. 通过 SSH 进入您的家庭助理，并运行 `chmod 2777 /2effc9b9/trilliumnext`
1. 启动插件。
1. 检查插件的日志以查看是否一切正常。
1. 转到您本地的 homeassistant IP：端口管理端口或 Ingress。
1. 按说明操作

```
port : 8000 #您希望在其上运行管理界面的端口。
```

Webui 可以在 `<your-ip>:port` 或 Ingress 处找到。

[repository]: https://github.com/jdeath/homeassistant-addons