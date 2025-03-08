# 家庭助手附加组件：Vaultwarden

这是用 Rust 编写的 Bitwarden 服务器 API 的替代实现，与上游 Bitwarden 客户端兼容*，非常适合自托管部署，因为运行官方资源密集型服务可能并不理想。

这个版本与官方的 homeassistant 附加组件以及 Alex Belgium 的附加组件之间的区别在于，它将数据存储在 /addons_config 中，这使得在意外卸载或升级失败时更容易移动文件。您必须确保使用 argon 加密的密码，这现在应该是默认的。此外，内置的 homeassistant 版本通常没有更新（即使在多次请求后也是如此）。这个附加组件还只是使用了官方的 docker 镜像，没有任何更改，而其他附加组件则在镜像中添加了额外的内容。

_感谢所有为我的代码库点星的朋友们！要点星，请点击下面的图片，然后它将显示在右上角。谢谢！_

[![Stargazers repo roster for @jdeath/homeassistant-addons](https://reporoster.com/stars/jdeath/homeassistant-addons)](https://github.com/jdeath/homeassistant-addons/stargazers)

## 关于

这个附加组件使用了 [docker 镜像](https://github.com/dani-garcia/vaultwarden)。

## 安装

这个附加组件的安装非常简单，与安装任何其他 Hass.io 附加组件没有区别。

1. [将我的 Hass.io 附加组件库][repository] 添加到您的 Hass.io 实例中。
1. 单击 `保存` 按钮以存储您的配置。
1. 启动附加组件。
1. 检查附加组件的日志以查看一切是否顺利。
1. 打开 WebUI 应该可以通过 <your-ip>:port 访问。
1. 您的数据将存储在 /addon-configs/2effc9b9_vaultwarden/

如果您有现有的 vaultwarden 安装（默认附加组件或 alexbelgium 的），
1. 确保我的附加组件运行过一次，但随后请确保停止它
1. 登录 homeassistant cli
1. `docker ps | grep "vault"`
1. 找到 docker 的 containerID
1. `docker cp CONTAINERID:/data /addon-configs/2effc9b9_vaultwarden/`
1. 然后在 `/addon-configs/2effc9b9_vaultwarden/` 中将 data 文件夹中的所有内容移动到 `/addon-configs/2effc9b9_vaultwarden/`
1. 所有文件现在应该在 `/addon-configs/2effc9b9_vaultwarden/` 中
1. 停止默认附加组件，关闭“开机启动”选项
1. 启动我的附加组件
1. 查看文档进行配置： https://github.com/dani-garcia/vaultwarden


## 配置
1. 设置完成后，禁止外部网络访问管理控制面板
1. 您可以通过停止容器并编辑 `/addon-configs/2effc9b9_vaultwarden/config.json` 手动配置许多参数
1. 确保您的 `admin_token` 是 argon2 加密的： https://github.com/dani-garcia/vaultwarden/wiki/Enabling-admin-page#secure-the-admin_token
1. 如果不是，`docker ps | grep "vault"`，前面的数字/字母是 containerID
2. `docker exec -it containerID /bin/bash`
3. `cd /` `/vaultwarden hash --preset owasp` 输入密码，然后替换 admin token
4. 由于这个文件是可访问的，我想任何人都可以这样做，所以请小心。如果您可以访问您的 homeassistant 机器，这也可以在容器内完成，因此安全性并不会降低


```
port : 7277 #您想要运行的端口。
```

Webui 可以在 `<your-ip>:port` 找到。

[repository]: https://github.com/jdeath/homeassistant-addons