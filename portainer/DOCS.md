Portainer可以用来在docker容器中执行自定义命令。它是一个开源的轻量级管理用户界面，允许您轻松管理Docker主机或Docker swarm集群。

# 快速开始
- 使用此链接添加我的仓库
[![Add repository on my Home Assistant][repository-badge]][repository-url]
- 从我的仓库安装Portainer插件
- 在插件的配置面板中，您可以更改密码
- 在插件的主页上，禁用“保护模式”，然后启动插件
- 登录（默认用户名是`admin`，默认密码是`homeassistant`）
- 点击环境中的`Primary`（位于页面中央）
- 在左侧菜单栏中点击`Containers`
- 增加每页项目的数量，以便查看所有插件
- 点击您选择的插件名称旁边的符号`>_`以打开控制台页面
- 更改用户名，或者更常见的只是点击连接
- 输入您的命令，您可以完全访问这个特定容器的终端（这不会影响您HA系统的其他部分）

# 对您的系统的影响
- 安装或运行Portainer不会对系统产生影响
- 手动安装自定义容器将会将您的HA状态修改为不受支持/不健康状态。您将无法升级Home Assistant和任何可能的插件。停止这个自定义容器将重置为正常状态

# 提示和窍门

## 重置数据库
只需在您的插件选项中更改密码，数据库将被重置

## 60秒超时
插件包括一个非常长的超时。然而，如果您使用另一个代理层，例如插件nginx代理管理器，它将默认超时为60秒。您需要调整代理层以增加超时。更多细节请见此处 : https://github.com/portainer/portainer/issues/2953#issuecomment-1235795256

## 进一步参考
- 这是一个使用它的完整指南 : https://codeopolis.com/posts/beginners-guide-to-portainer/
- HA社区论坛上关于Portainer的旧页面 : https://community.home-assistant.io/t/home-assistant-community-add-on-portainer

[repository-badge]: https://img.shields.io/badge/Add%20repository%20to%20my-Home%20Assistant-41BDF5?logo=home-assistant&style=for-the-badge
[repository-url]: https://my.home-assistant.io/redirect/supervisor_add_addon_repository/?repository_url=https%3A%2F%2Fgithub.com%2Falexbelgium%2Fhassio-addons