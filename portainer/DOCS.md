Portainer可以用来在docker容器中执行自定义命令。它是一个开源的轻量级管理UI，允许您轻松管理一个或多个Docker主机或Docker集群。

# 快速开始
- 使用此链接添加我的仓库
[![Add repository on my Home Assistant][repository-badge]][repository-url]
- 从我的仓库中安装Portainer附加组件
- 在附加组件的配置面板中，您可以更改密码
- 在附加组件的主页上，禁用“保护模式”，然后启动附加组件
- 登录（默认用户名是`admin`，默认密码是`homeassistant`）
- 在环境中单击`Primary`（页面中央）
- 在左侧菜单栏中单击`Containers`
- 增加每页显示的项目数以查看所有附加组件
- 单击所选附加组件名称旁边的符号`>_`以打开控制台页面
- 更改用户名，或者更常见的是直接单击连接
- 输入您的命令，您对该特定容器的终端有完全访问权限（这不会影响您的HA系统的其他部分）

# 对您的系统的影响
- 安装或运行Portainer不会对您的系统产生影响
- 手动安装自定义容器将使您的HA状态变为不受支持/不健康状态。您将无法升级Home Assistant和您可能拥有的任何附加组件。停止该自定义容器将重置为正常状态

# 提示与技巧

## 重置数据库
只需在您的附加选项中更改密码，数据库将被重置

## 超时为60秒
该附加组件包含一个非常长的超时。不过，如果您使用其他代理层，例如附加组件nginx代理管理器，它将默认超时为60秒。您必须调整代理层以增加超时。更多详细信息请参见：https://github.com/portainer/portainer/issues/2953#issuecomment-1235795256

## 进一步参考
- 这是使用它的完整指南：https://codeopolis.com/posts/beginners-guide-to-portainer/
- HA社区论坛上有关Portainer的旧页面：https://community.home-assistant.io/t/home-assistant-community-add-on-portainer

[repository-badge]: https://img.shields.io/badge/Add%20repository%20to%20my-Home%20Assistant-41BDF5?logo=home-assistant&style=for-the-badge
[repository-url]: https://my.home-assistant.io/redirect/supervisor_add_addon_repository/?repository_url=https%3A%2F%2Fgithub.com%2Falexbelgium%2Fhassio-addons