# Home assistant 插件：Otter Wiki

# Otter Wiki

Otter Wiki 是基于 Python 的协作内容管理软件，称为 [wiki](https://en.wikipedia.org/wiki/Wiki)。内容存储在 git 存储库中，该存储库跟踪所有更改。[Markdown](https://daringfireball.net/projects/markdown) 被用作标记语言。Otter Wiki 使用微框架 [Flask](http://flask.pocoo.org/) 编写，并使用 [python](https://www.python.org/)。
[halfmoon](https://www.gethalfmoon.com) 被用作 CSS 框架， [CodeMirror](https://codemirror.net/) 用作编辑器。
[Font Awesome Free](https://fontawesome.com/license/free) 提供图标。

## 显著特点

- 简约界面（带黑暗模式）
- 具有 Markdown 高亮和支持的编辑器，包括表格
- 可自定义侧边栏：菜单和/或页面索引
- 完整的更改日志和页面历史
- 用户身份验证
- 页面附件
- 扩展的 Markdown：表格、脚注、花式块、警报和美人鱼图
- （实验性）Git http 服务器：克隆、拉取和推送你的 wiki 内容
- 一只非常可爱的海獺作为标志（由 [Christy Presler](http://christypresler.com/) 绘制，CC BY 3.0）


_感谢每一个为我的 repo 点赞的人！要点赞，请点击下面的图像，然后它会在右上角显示。谢谢！_

[![Stargazers repo roster for @jdeath/homeassistant-addons](https://reporoster.com/stars/jdeath/homeassistant-addons)](https://github.com/jdeath/homeassistant-addons/stargazers)

## 关于

该插件使用 [docker 镜像](https://github.com/redimp/otterwiki)。

## 安装

该插件的安装非常简单，和安装其他 Hass.io 插件没有什么不同。

1. [将我的 Hass.io 插件库][repository] 添加到你的 Hass.io 实例。
1. 安装此插件。
1. 单击 `Save` 按钮以保存你的配置。
1. 启动插件。
1. 检查插件的日志以查看是否一切正常。
1. 打开 WebUI 应该可以通过 `<your-ip>:port` 访问。
1. 设置将在 /addon_configs/2effc9b9_otterwiki 中。

## 配置

```
port : 8084 # 你想运行的端口。
```

Webui 可以在 `<your-ip>:port` 找到。

[repository]: https://github.com/jdeath/homeassistant-addons