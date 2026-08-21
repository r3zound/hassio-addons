# Home Assistant 插件：Vaultwarden

Bitwarden 服务器 API 的替代实现，用 Rust 编写，并与上游 Bitwarden 客户端兼容，非常适合自托管部署，在运行官方资源密集型服务可能不理想的情况下。

与这个版本、官方 Home Assistant 插件和 Alex Belgium 的插件相比，不同之处在于它将数据存储在 `/addons_config` 中，这使得在意外卸载或升级失败时更容易移动数据。你必须确保使用 argon 加密的密码，现在应该是默认的。此外，内置的 Home Assistant 插件通常不会更新（即使经过多次请求）。此插件也仅使用官方的 docker 镜像，没有进行更改，而其他插件则会编辑镜像添加额外的功能。

_感谢所有给我仓库 star 的人！要 star，请点击下面的图片，然后它就会显示在右上角。谢谢！_

[![Stargazers repo roster for @jdeath/homeassistant-addons](https://reporoster.com/stars/jdeath/homeassistant-addons)](https://github.com/jdeath/homeassistant-addons/stargazers)

## 关于

此插件使用 [docker 镜像](https://github.com/dani-garcia/vaultwarden)。

## 安装

此插件的安装非常简单，与安装任何其他 Hass.io 插件没有区别。

1. 将我的 Hass.io 插件仓库 [repository] 添加到你的 Hass.io 实例中。
1. 点击 `保存` 按钮以存储你的配置。
1. 启动插件。
1. 检查插件的日志以查看一切是否顺利。
1. 打开 WebUI 应该可以通过 `<你的-ip>:端口号` 访问。
1. 你的数据将存储在 `/addon-configs/2effc9b9_vaultwarden/`。

如果你已经有了现有的 vaultwarden 安装（默认插件或 alexbelgium 的插件）：

1. 确保我的插件已经运行过一次，然后确保停止它
1. 登录 Home Assistant CLI
1. `docker ps | grep "vault"`
1. 找到 docker 容器 ID
1. `docker cp CONTAINERID:/data /addon-configs/2effc9b9_vaultwarden/`
1. 然后在 `/addon-configs/2effc9b9_vaultwarden/` 中将 `data` 文件夹中的所有内容移动到 `/addon-configs/2effc9b9_vaultwarden/`
1. 所有文件现在都应在 `/addon-configs/2effc9b9_vaultwarden/`
1. 停止默认插件，关闭 "启动自启动"
1. 启动我的插件
1. 查看文档进行配置：https://github.com/dani-garcia/vaultwarden


## 配置
1. 一旦设置好，请从你的网络外部移除对管理控制面板的访问
1. 你可以通过停止容器并编辑 `/addon-configs/2effc9b9_vaultwarden/config.json` 来手动配置许多参数
1. 确保你的 `admin_token` 是 argon2 加密的：https://github.com/dani-garcia/vaultwarden/wiki/Enabling-admin-page#secure-the-admin_token
1. 如果不是，`docker ps | grep "vault"` 前面的数字/字母是容器 ID
2. `docker exec -it containerID /bin/bash`
3. `cd /` `/vaultwarden hash --preset owasp` 输入一个密码，然后替换管理员令牌
4. 由于此文件是可访问的，我认为任何人都可以这样做，所以请小心。如果你有权访问你的 Home Assistant 机器，这也可以在容器内部完成，所以并不是真的更不安全 


```
端口号 : 7277 #你想要运行的端口号。
```

WebUI 可以在 `<你的-ip>:端口号` 找到。

[repository]: https://github.com/jdeath/homeassistant-addons
---

**⚠️ This resource is intended to help Chinese Home Assistant users more easily install excellent add-ons. If you are not a Chinese user, please read repository readme first**

**⚠️ 这个资源用来帮助中国Home Assistant用户更容易地安装优秀的插件。如果您不是中国用户，请先阅读仓库的README，以下为收集者（汉化，加速）信息，非原作者信息**

---

## 📱 关注我

扫描下面二维码，关注我。有需要可以随时给我留言：

<img src="https://gitee.com/desmond_GT/hassio-addons/raw/main/WeChat_QRCode.png" width="50%" /> 📲

## ☕ 赞助支持

如果您觉得我花费大量时间维护这个库对您有帮助，欢迎请我喝杯奶茶，您的支持将是我持续改进的动力！

<div style="display: flex; justify-content: space-between;">
  <img src="https://gitee.com/desmond_GT/hassio-addons/raw/main/1_readme/Ali_Pay.jpg" height="350px" />
  <img src="https://gitee.com/desmond_GT/hassio-addons/raw/main/1_readme/WeChat_Pay.jpg" height="350px" />
</div> 💖

感谢您的支持与鼓励！
