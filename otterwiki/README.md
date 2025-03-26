# 家庭助手插件：Otter Wiki

# 一个 Otter Wiki

Otter Wiki 是一个基于 Python 的协作内容管理软件，称为 [wiki](https://en.wikipedia.org/wiki/Wiki)。内容存储在 git 仓库中，该仓库跟踪所有更改。[Markdown](https://daringfireball.net/projects/markdown) 被用作标记语言。Otter Wiki 使用微框架 [Flask](http://flask.pocoo.org/) 编写，采用 [python](https://www.python.org/) 语言。
[halfmoon](https://www.gethalfmoon.com) 被用作 CSS 框架，而 [CodeMirror](https://codemirror.net/) 用作编辑器。
[Font Awesome Free](https://fontawesome.com/license/free) 提供图标。

## 显著特性

- 极简主义界面（支持暗黑模式）
- 带有 Markdown 高亮和支持的编辑器，包括表格
- 可定制的侧边栏：菜单和/或页面索引
- 完整的变更日志和页面历史
- 用户身份验证
- 页面附件
- 扩展 Markdown：表格、脚注、花哨的块、警报和美人鱼图
- （实验性）Git http 服务器：克隆、拉取和推送你的 Wiki 内容
- 一个非常可爱的海獺作为标志（由 [Christy Presler](http://christypresler.com/) 绘制，CC BY 3.0）

_感谢每一个给我的仓库打星的人！要打星请点击下面的图片，然后它将出现在右上角。谢谢！_

[![Stargazers repo roster for @jdeath/homeassistant-addons](https://reporoster.com/stars/jdeath/homeassistant-addons)](https://github.com/jdeath/homeassistant-addons/stargazers)

## 关于

这个插件使用 [docker 镜像](https://github.com/redimp/otterwiki)。

## 安装

这个插件的安装非常简单，与安装任何其他 Hass.io 插件没有不同。

1. [将我的 Hass.io 插件仓库][repository] 添加到你的 Hass.io 实例。
1. 安装这个插件。 
1. 点击 `保存` 按钮以存储你的配置。
1. 启动插件。
1. 检查插件的日志以查看一切是否正常。
1. 打开 WebUI 应该可以通过 <your-ip>:port 访问。
1. 设置将位于 /addon_configs/2effc9b9_otterwiki。

## 配置

```
port : 8084 # 你想运行的端口。
```

Webui 可以在 `<your-ip>:port` 找到。

[repository]: https://github.com/jdeath/homeassistant-addons