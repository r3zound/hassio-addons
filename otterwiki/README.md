# 家庭助手插件：Otter Wiki

# 一个 Otter Wiki

Otter Wiki 是基于 Python 的协作内容管理软件，称为 [wiki](https://en.wikipedia.org/wiki/Wiki)。内容存储在 git 仓库中，跟踪所有更改。
使用 [Markdown](https://daringfireball.net/projects/markdown) 作为标记语言。一个 Otter Wiki 是用 [python](https://www.python.org/) 编写的，使用微框架 [Flask](http://flask.pocoo.org/)。
[halfmoon](https://www.gethalfmoon.com) 被用作 CSS 框架， [CodeMirror](https://codemirror.net/) 作为编辑器。
[Font Awesome Free](https://fontawesome.com/license/free) 提供图标。

## 突出功能

- 极简界面（带有暗黑模式）
- 带有 Markdown 高亮和支持（包括表格）的编辑器
- 可自定义的侧边栏：菜单和/或页面索引
- 完整的变更记录和页面历史
- 用户认证
- 页面附件
- 扩展的 Markdown：表格、脚注、花式块、警报和美人鱼图
- （实验性）Git http 服务器：克隆、拉取和推送你 wiki 的内容
- 一个非常可爱的海獺作为 logo（由 [Christy Presler](http://christypresler.com/) 绘制，CC BY 3.0）

_感谢所有给我的仓库加星的人！要加星，请点击下方图片，然后它会出现在右上角。谢谢！_

[![Stargazers repo roster for @jdeath/homeassistant-addons](https://reporoster.com/stars/jdeath/homeassistant-addons)](https://github.com/jdeath/homeassistant-addons/stargazers)

## 关于

这个插件使用 [docker 镜像](https://github.com/redimp/otterwiki)。

## 安装

这个插件的安装非常简单，与安装任何其他 Hass.io 插件没有区别。

1. [将我的 Hass.io 插件仓库][repository] 添加到你的 Hass.io 实例中。
1. 安装这个插件。
1. 点击 `Save` 按钮以保存你的配置。
1. 启动插件。
1. 检查插件日志以查看一切是否顺利。
1. 打开 WebUI 应该可以通过 <你的-ip>:端口 工作。
1. 设置将在 /addon_configs/2effc9b9_otterwiki 中。

## 配置

```
port : 8084 #你想要运行的端口。
```

Webui 可以在 `<你的-ip>:端口` 找到。

[repository]: https://github.com/jdeath/homeassistant-addons