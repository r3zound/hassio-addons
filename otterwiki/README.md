# Home assistant 插件：Otter Wiki

# 一个 Otter Wiki

Otter Wiki 是一个基于 Python 的协作内容管理软件，称为 [wiki](https://en.wikipedia.org/wiki/Wiki)。内容存储在 git 仓库中，该仓库跟踪所有更改。[Markdown](https://daringfireball.net/projects/markdown) 用作标记语言。Otter Wiki 是使用微框架 [Flask](http://flask.pocoo.org/) 编写的 [python](https://www.python.org/)。使用 [halfmoon](https://www.gethalfmoon.com) 作为 CSS 框架，使用 [CodeMirror](https://codemirror.net/) 作为编辑器。[Font Awesome Free](https://fontawesome.com/license/free) 提供图标。

## 引人注目的功能

- 极简界面（带有暗黑模式）
- 支持 markdown 高亮和表格的编辑器
- 可定制侧边栏：菜单和/或页面索引
- 完整的变更日志和页面历史
- 用户认证
- 页面附件
- 扩展的 Markdown：表格、脚注、华丽块、警报和美人鱼图
- （实验性）Git http 服务器：克隆、拉取和推送你的 wiki 内容
- 一个非常可爱的海獺作为标志（由 [Christy Presler](http://christypresler.com/) 绘制，CC BY 3.0）

_感谢每一个给我的仓库加星的朋友！要加星，请点击下面的图片，然后它会出现在右上角。谢谢！_

[![Stargazers repo roster for @jdeath/homeassistant-addons](https://reporoster.com/stars/jdeath/homeassistant-addons)](https://github.com/jdeath/homeassistant-addons/stargazers)

## 关于

该插件使用 [docker 镜像](https://github.com/redimp/otterwiki)。

## 安装

该插件的安装非常简单，与安装其他 Hass.io 插件没有区别。

1. [将我的 Hass.io 插件仓库][repository] 添加到你的 Hass.io 实例。
1. 安装该插件。
1. 单击 `Save` 按钮以保存你的配置。
1. 启动插件。
1. 检查插件的日志，查看一切是否正常。
1. 打开 WebUI 应该可以通过 <你的-ip>:端口 访问。
1. 设置将在 /addon_configs/2effc9b9_otterwiki 中。

## 配置

```
port : 8084 #你希望运行的端口
```

Webui 可以在 `<你的-ip>:端口` 找到。

[repository]: https://github.com/jdeath/homeassistant-addons