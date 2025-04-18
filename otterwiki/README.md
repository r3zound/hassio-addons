# 家庭助手插件：Otter Wiki

# Otter Wiki

Otter Wiki 是基于 Python 的协作内容管理软件，称为 [wiki](https://en.wikipedia.org/wiki/Wiki)。内容存储在一个 git 仓库中，该仓库跟踪所有更改。[Markdown](https://daringfireball.net/projects/markdown) 被用作标记语言。Otter Wiki 使用微框架 [Flask](http://flask.pocoo.org/) 编写，使用 [python](https://www.python.org/)。[halfmoon](https://www.gethalfmoon.com) 被用作 CSS 框架，[CodeMirror](https://codemirror.net/) 作为编辑器。[Font Awesome Free](https://fontawesome.com/license/free) 提供图标。

## 突出特点

- 极简界面（带深色模式）
- 支持 markdown 高亮和表格的编辑器
- 可自定义侧边栏：菜单和/或页面索引
- 完整的更新日志和页面历史
- 用户认证
- 页面附件
- 扩展 Markdown：表格、脚注、Fancy 块、警报和美人鱼图表
- （实验）Git http 服务器：克隆、拉取和推送您 wiki 的内容
- 一只非常可爱的海獺作为标志（由 [Christy Presler](http://christypresler.com/) 绘制，CC BY 3.0）

_感谢所有为我的仓库加星的人！要加星，请点击下面的图像，然后它会出现在右上方。谢谢！_

[![Stargazers repo roster for @jdeath/homeassistant-addons](https://reporoster.com/stars/jdeath/homeassistant-addons)](https://github.com/jdeath/homeassistant-addons/stargazers)

## 关于

本插件使用 [docker 镜像](https://github.com/redimp/otterwiki)。

## 安装

安装此插件非常简单，与安装其他 Hass.io 插件没有区别。

1. [将我的 Hass.io 插件仓库][repository] 添加到您的 Hass.io 实例中。
1. 安装此插件。
1. 点击 `保存` 按钮以存储您的配置。
1. 启动插件。
1. 检查插件的日志以查看一切是否顺利。
1. 通过 `<your-ip>:port` 打开 WebUI。
1. 设置将位于 /addon_configs/2effc9b9_otterwiki

## 配置

```
port : 8084 # 您想要运行的端口。
```

Webui 可以在 `<your-ip>:port` 找到。

[repository]: https://github.com/jdeath/homeassistant-addons