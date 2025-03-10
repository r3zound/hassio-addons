# 家庭助理插件：Otter Wiki

# Otter Wiki

Otter Wiki 是基于 Python 的协作内容管理软件，称为 [wiki](https://en.wikipedia.org/wiki/Wiki)。内容存储在 git 仓库中，该仓库跟踪所有更改。[Markdown](https://daringfireball.net/projects/markdown) 被用作标记语言。Otter Wiki 使用微框架 [Flask](http://flask.pocoo.org/) 编写，并使用 [python](https://www.python.org/)。[halfmoon](https://www.gethalfmoon.com) 被用作 CSS 框架， [CodeMirror](https://codemirror.net/) 作为编辑器。[Font Awesome Free](https://fontawesome.com/license/free) 提供图标。

## 显著特点

- 极简界面（带暗黑模式）
- 带有 markdown 语法高亮和支持表格的编辑器
- 可定制侧边栏：菜单和/或页面索引
- 完整的变更日志和页面历史
- 用户认证
- 页面附件
- 扩展 markdown：表格、脚注、花哨的块、警报和美人鱼图表
- （实验性）Git http 服务器：克隆、拉取和推送你的 wiki 内容
- 一个非常可爱的海獺作为标志（由 [Christy Presler](http://christypresler.com/) 绘制，CC BY 3.0）

_感谢所有为我的仓库点赞的人！要点赞，请点击下方图片，然后它会在右上角显示。谢谢！_

[![Stargazers repo roster for @jdeath/homeassistant-addons](https://reporoster.com/stars/jdeath/homeassistant-addons)](https://github.com/jdeath/homeassistant-addons/stargazers)

## 关于

此插件使用 [docker 镜像](https://github.com/redimp/otterwiki)。

## 安装

此插件的安装相当简单，与安装其他 Hass.io 插件没有区别。

1. [将我的 Hass.io 插件仓库][repository] 添加到你的 Hass.io 实例。
1. 安装此插件。
1. 点击 `保存` 按钮以存储你的配置。
1. 启动插件。
1. 检查插件的日志以查看是否一切正常。
1. 打开 WebUI 应该可以通过 <your-ip>:port 访问。
1. 设置将在 /addon_configs/2effc9b9_otterwiki 中。

## 配置

```
port : 8084 #你想运行的端口。
```

Webui 可以在 `<your-ip>:port` 找到。

[repository]: https://github.com/jdeath/homeassistant-addons