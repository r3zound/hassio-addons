Portainer 可以用来在 Docker 容器中执行自定义命令。它是一个开源的轻量级管理 UI，允许您轻松管理 Docker 主机或 Docker swarm 集群。

# 快速开始
- 使用此链接添加我的仓库
[![在我的 Home Assistant 上添加仓库][repository-badge]][repository-url]
- 从我的仓库安装 Portainer 附加组件
- 在附加组件的配置面板中，您可以更改密码
- 在附加组件的主页面中，禁用“保护模式”，然后启动该附加组件
- 登录（默认用户名为 `admin`，默认密码为 `homeassistant`）
- 在环境中点击 `Primary`（在页面中心）
- 在左侧菜单栏中点击 `Containers`
- 增加每页显示的项目数量以查看所有附加组件
- 点击所选附加组件旁边的符号 `>_` 打开控制台页面
- 可以更改用户名，或者更常见的是直接点击连接
- 输入您的命令，您可以完全访问该特定容器的终端（这不会影响您 HA 系统的其他部分）

# 对您的系统的影响
- 安装或运行 Portainer 不会产生影响
- 手动安装自定义容器将会将您的 HA 状态修改为不受支持/不健康状态。您将被阻止升级 Home Assistant 和任何您可能拥有的附加组件。停止此自定义容器将重置正常状态

# 小贴士和技巧

## 重置数据库
只需在您的附加组件选项中更改密码，数据库将被重置

## 60 秒超时
该附加组件包含一个非常长的超时。不过，如果您使用另一层代理，例如附加组件 Nginx 代理管理器，它将默认超时为 60 秒。您需要调整代理层以增加超时。更多详细信息请见： https://github.com/portainer/portainer/issues/2953#issuecomment-1235795256

## 进一步参考
- 这是关于如何使用它的完整指南： https://codeopolis.com/posts/beginners-guide-to-portainer/
- 关于 Portainer 的 HA 社区论坛旧页面： https://community.home-assistant.io/t/home-assistant-community-add-on-portainer

[repository-badge]: https://img.shields.io/badge/Add%20repository%20to%20my-Home%20Assistant-41BDF5?logo=home-assistant&style=for-the-badge
[repository-url]: https://my.home-assistant.io/redirect/supervisor_add_addon_repository/?repository_url=https%3A%2F%2Fgithub.com%2Falexbelgium%2Fhassio-addons