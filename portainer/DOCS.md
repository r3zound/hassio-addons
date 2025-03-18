Portainer可以用于在docker容器中执行自定义命令。它是一个开源的轻量级管理用户界面，允许您轻松管理一个或多个Docker主机或Docker swarm集群。

# 快速开始
- 使用此链接添加我的仓库
[![在我的 Home Assistant 中添加仓库][repository-badge]][repository-url]
- 从我的仓库安装portainer插件
- 在插件的配置面板中，您可以更改密码
- 在插件的主页面中，禁用“保护模式”，然后启动插件
- 登录（默认用户名为`admin`，默认密码为`homeassistant`）
- 点击环境中的`Primary`（在页面的中央）
- 点击左侧菜单栏中的`Containers`
- 增加每页的项目数量以查看所有插件
- 点击您所选插件名称旁边的符号`>_`以打开控制台页面
- 更改用户名，或更常见地，只需点击连接
- 输入您的命令，您完全访问该特定容器的终端（这不会影响您HA系统的其他部分）

# 对您的系统的影响
- 安装或运行portainer没有影响
- 手动安装自定义容器将修改您的HA状态为不支持/不健康状态。您将被阻止升级Home Assistant以及您可能拥有的任何插件。停止此自定义容器将重置为正常状态

# 小贴士和技巧

## 重置数据库
只需在插件选项中更改密码，数据库将被重置

## 60秒超时
该插件包含一个非常长的超时。然而，如果您使用另一个代理层，例如插件nginx代理管理器，它将默认为60秒的超时。您需要调整代理层以增加超时。更多详细信息请见： https://github.com/portainer/portainer/issues/2953#issuecomment-1235795256

## 进一步参考
- 这里是使用它的完整指南： https://codeopolis.com/posts/beginners-guide-to-portainer/
- 关于portainer的老页面在HA社区论坛上： https://community.home-assistant.io/t/home-assistant-community-add-on-portainer

[repository-badge]: https://img.shields.io/badge/Add%20repository%20to%20my-Home%20Assistant-41BDF5?logo=home-assistant&style=for-the-badge
[repository-url]: https://my.home-assistant.io/redirect/supervisor_add_addon_repository/?repository_url=https%3A%2F%2Fgithub.com%2Falexbelgium%2Fhassio-addons