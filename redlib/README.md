# 家庭助手插件：Redlib

Redlib 是一个类似于 [Invidious](https://github.com/iv-org/invidious) 的私有前端，但用于 Reddit。浏览 [r/unpopularopinion](https://redlib.matthew.science/r/unpopularopinion) 上最冷的看法，而不被 [追踪](#reddit)。

- 🚀 快速：使用 Rust 编写，速度极快且内存安全
- ☁️ 轻量：无 JavaScript，无广告，无追踪，无臃肿
- 🕵 私密：所有请求通过服务器代理，包括媒体
- 🔒 安全：强大的 [内容安全策略](https://developer.mozilla.org/en-US/docs/Web/HTTP/CSP) 防止浏览器请求访问 Reddit

_谢谢所有给我仓库点星的人！要点星，请点击下面的图片，然后它将显示在右上角。谢谢！_

[![Stargazers repo roster for @jdeath/homeassistant-addons](https://reporoster.com/stars/jdeath/homeassistant-addons)](https://github.com/jdeath/homeassistant-addons/stargazers)

## 关于

这个插件基于 [docker 镜像](https://github.com/redlib-org/redlib)。

## 安装

安装这个插件非常简单，与安装其他 Hass.io 插件没有什么不同。

1. [将我的 Hass.io 插件仓库][repository] 添加到你的 Hass.io 实例。
2. 安装这个插件。
3. 点击 `保存` 按钮以存储你的配置。
4. 启动插件。
5. 检查插件的日志以查看一切是否正常。
6. 通过入口或 <your-ip>:port 打开 WebUI 应该可以工作。

## 配置

```
port : 8081 # 你想运行的端口
```

Webui 可以在 `<your-ip>:port` 找到。

[repository]: https://github.com/jdeath/homeassistant-addons