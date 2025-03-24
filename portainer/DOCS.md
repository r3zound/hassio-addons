Portainer可以用来在docker容器中执行自定义命令。它是一个开源的轻量级管理UI，让您可以轻松管理Docker主机或Docker swarm集群。

# 快速开始
- 使用此链接添加我的仓库
[![在我的Home Assistant上添加仓库][repository-badge]][repository-url]
- 从我的仓库安装portainer插件
- 在插件的配置面板中，您可以更改密码
- 在插件的主页面，禁用“保护模式”，然后启动插件
- 登录（默认用户名是`admin`，默认密码是`homeassistant`）
- 点击环境中的`Primary`（页面中央）
- 在左侧菜单栏中点击`Containers`
- 增加每页项目的数量以查看您所有的插件
- 点击您所选插件名称旁边的符号`>_`打开控制台页面
- 可以更改用户名，或更常见的是直接点击连接
- 输入您的命令，您可以完全访问这个特定容器的终端（这不会影响您HA系统的其他部分）

# 对您系统的影响
- 安装或运行portainer没有任何影响
- 手动安装自定义容器将会将您的HA状态修改为不受支持/不健康状态。您将无法升级Home Assistant和您可能拥有的任何插件。停止这个自定义容器将恢复正常状态

# 小贴士和技巧

## 重置数据库
只需在插件选项中更改密码，数据库将被重置

## 超时为60秒
该插件包括一个非常长的超时时间。然而，如果您使用其他代理层，例如nginx代理管理插件，它将默认为60秒的超时。您需要调整代理层以增加超时。更多细节请见：https://github.com/portainer/portainer/issues/2953#issuecomment-1235795256

## 进一步参考
- 这里是一个使用它的完整指南：https://codeopolis.com/posts/beginners-guide-to-portainer/
- 关于portainer的HA社区论坛旧页面：https://community.home-assistant.io/t/home-assistant-community-add-on-portainer

[repository-badge]: https://img.shields.io/badge/Add%20repository%20to%20my-Home%20Assistant-41BDF5?logo=home-assistant&style=for-the-badge
[repository-url]: https://my.home-assistant.io/redirect/supervisor_add_addon_repository/?repository_url=https%3A%2F%2Fgithub.com%2Falexbelgium%2Fhassio-addons