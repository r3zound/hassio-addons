# Home Assistant 插件：SteVe

SteVe OCCP 服务器用于与充电点通信

![支持 aarch64 架构][aarch64-shield] ![支持 amd64 架构][amd64-shield]

## 关于

重要：此插件需要安装并运行 MariaDB 插件！

该插件是实验性的。
SteVe 是一个 OCCP 服务器，用于与充电点通信。

## 安装

按照以下步骤在您的系统上安装插件：

添加库 `https://github.com/erik73/hassio-addons`。
查找 "SteVe" 插件并点击它。
点击 "INSTALL" 按钮。

## 如何使用

### 启动插件

安装后，您将看到默认配置。

重要：此插件需要安装并运行 MariaDB 插件！

唯一需要的配置是提供 admin_user 和 admin_password。
通过点击 "SAVE" 按钮保存插件配置。
启动插件。

## 配置

重要：此插件需要安装并运行 MariaDB 插件！

示例配置：

```yaml
admin_user: admin
admin_password: admin
```

请注意：此插件消耗大量内存。
主机上安装的绝对最低 RAM 是 4GB。
根据其他安装的插件，4GB 可能不够。

还需要理解的是，admin_user 和 admin_password 在插件第一次启动后不能更改，因为 MariaDB 数据库是在插件第一次启动时使用这些凭据创建的。

不支持 ingress，因此要访问 SteVe 网络界面，您必须将浏览器指向 http://<your.homeassistant.host.ip>:8180 登录 SteVe。

## 支持

有问题吗？

您可以在 [这里开一个问题][issue] GitHub。

[aarch64-shield]: https://img.shields.io/badge/aarch64-yes-green.svg
[amd64-shield]: https://img.shields.io/badge/amd64-yes-green.svg