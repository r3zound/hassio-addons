Portainer 可用于在 Docker 容器中执行自定义命令。它是一个开源的轻量级管理用户界面，允许您轻松管理一个或多个 Docker 主机或 Docker Swarm 集群。

# 快速开始
- 使用此链接添加我的存储库
[![Add repository on my Home Assistant][repository-badge]][repository-url]
- 从我的存储库中安装 Portainer 附加组件
- 在附加组件的配置面板中，您可以更改密码
- 在附加组件的主页上，禁用“保护模式”，然后启动附加组件
- 登录（默认用户名为 `admin`，默认密码为 `homeassistant`）
- 点击环境中的 `Primary`（在页面中心）
- 在左侧菜单栏中点击 `Containers`
- 增加每页显示的项目数量，以查看您所有的附加组件
- 点击所选附加组件名称旁边的符号 `>_` 打开控制台页面
- 更改用户名，或通常只需点击连接
- 输入您的命令，您可以完全访问该特定容器的终端（这不会影响您 HA 系统的其他部分）

# 对您的系统的影响
- 安装或运行 Portainer 没有影响
- 手动安装自定义容器将把您的 HA 状态修改为不受支持/不健康状态。您将无法升级 Home Assistant，无法升级您可能拥有的任何附加组件。停止此自定义容器将重置为正常状态

# 提示和技巧

## 重置数据库
只需在您的附加选项中更改密码，数据库将被重置

## 超时为 60 秒
该附加组件包括非常长的超时。然而，如果您使用其他代理层，例如附加组件 Nginx 代理管理器，它将默认为 60 秒的超时。您必须调整代理层以增加超时。更多详细信息请查看： https://github.com/portainer/portainer/issues/2953#issuecomment-1235795256

## 进一步参考
- 这是使用它的完整指南：https://codeopolis.com/posts/beginners-guide-to-portainer/
- 旧的 HA 社区论坛上关于 Portainer 的页面：https://community.home-assistant.io/t/home-assistant-community-add-on-portainer

[repository-badge]: https://img.shields.io/badge/Add%20repository%20to%20my-Home%20Assistant-41BDF5?logo=home-assistant&style=for-the-badge
[repository-url]: https://my.home-assistant.io/redirect/supervisor_add_addon_repository/?repository_url=https%3A%2F%2Fgithub.com%2Falexbelgium%2Fhassio-addons