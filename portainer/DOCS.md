Portainer可以用于在docker容器中执行自定义命令。它是一个开源的轻量级管理用户界面，允许您轻松管理Docker主机或Docker swarm集群。

# 快速开始
- 使用此链接添加我的仓库
[![在我的Home Assistant上添加仓库][repository-badge]][repository-url]
- 从我的仓库安装portainer附加组件
- 在附加组件的配置面板中，您可以更改密码
- 在附加组件的主页中，禁用“保护模式”，然后启动附加组件
- 登录（默认用户名为`admin`，默认密码为`homeassistant`）
- 点击环境中的`Primary`（在页面的中心）
- 在左侧菜单栏中点击`Containers`
- 增加每页显示的项目数量，以查看您所有的附加组件
- 点击所选附加组件名称旁边的符号`>_`打开控制台页面
- 要么更改用户名，要么更常见的是直接点击连接
- 输入您的命令，您可以完全访问此特定容器的终端（这不会影响您的HA系统的其他部分）

# 对系统的影响
- 安装或运行portainer不会对系统产生影响
- 手动安装自定义容器会将您的HA状态修改为不受支持/不健康状态。您将无法升级Home Assistant及任何可能存在的附加组件。停止此自定义容器将重置为正常状态

# 小贴士和技巧

## 重置数据库
只需在您的附加组件选项中更改密码，数据库将被重置

## 60秒超时
附加组件包含一个非常长的超时。然而，如果您使用另一个代理层，例如附加组件nginx代理管理器，它将默认为60秒的超时。您需要调整代理层以增加超时时间。更多详细信息请见：https://github.com/portainer/portainer/issues/2953#issuecomment-1235795256

## 进一步参考
- 这是一个完整的使用指南：https://codeopolis.com/posts/beginners-guide-to-portainer/
- 关于portainer的HA社区论坛旧页面：https://community.home-assistant.io/t/home-assistant-community-add-on-portainer

[repository-badge]: https://img.shields.io/badge/Add%20repository%20to%20my-Home%20Assistant-41BDF5?logo=home-assistant&style=for-the-badge
[repository-url]: https://my.home-assistant.io/redirect/supervisor_add_addon_repository/?repository_url=https%3A%2F%2Fgithub.com%2Falexbelgium%2Fhassio-addons