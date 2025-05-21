Portainer 可用于在 Docker 容器中执行自定义命令。它是一个开源的轻量级管理 UI，允许您轻松管理 Docker 主机或 Docker swarm 集群。

# 快速开始
- 使用此链接添加我的仓库
[![在我的 Home Assistant 上添加仓库][repository-badge]][repository-url]
- 从我的仓库中安装 portainer 插件
- 在插件的配置面板中，您可以更改密码
- 在插件的主页中，禁用“保护模式”，然后启动插件
- 登录（默认用户名为 `admin`，默认密码为 `homeassistant`）
- 点击环境中的 `Primary`（在页面中央）
- 在左侧菜单栏中点击 `Containers`
- 增加每页显示的项目数量，以查看所有插件
- 点击所选插件名称旁边的符号 `>_` 以打开控制台页面
- 更改用户名，或者更常见的是直接点击连接
- 输入您的命令，您可以完全访问该特定容器的终端（这不会影响您 HA 系统的其他部分）

# 对您的系统的影响
- 安装或运行 portainer 不会对系统产生影响
- 手动安装自定义容器将使您的 HA 状态修改为不受支持/不健康状态。您将无法升级 Home Assistant 和您可能拥有的任何插件。停止此自定义容器将重置正常状态

#提示和技巧

## 重置数据库
只需在您的插件选项中更改密码，数据库将被重置

## 60 秒超时
该插件包括一个非常长的超时。然而，如果您使用像插件 nginx 代理管理器这样的另一层代理，它将默认为 60 秒的超时。您需要调整代理层以增加超时。更多细节请见这里 : https://github.com/portainer/portainer/issues/2953#issuecomment-1235795256

## 进一步参考
- 这里是使用它的完整指南 : https://codeopolis.com/posts/beginners-guide-to-portainer/
- 关于 portainer 的 HA 社区论坛旧页面 : https://community.home-assistant.io/t/home-assistant-community-add-on-portainer

[repository-badge]: https://img.shields.io/badge/Add%20repository%20to%20my-Home%20Assistant-41BDF5?logo=home-assistant&style=for-the-badge
[repository-url]: https://my.home-assistant.io/redirect/supervisor_add_addon_repository/?repository_url=https%3A%2F%2Fgithub.com%2Falexbelgium%2Fhassio-addons