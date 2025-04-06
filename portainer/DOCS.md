Portainer 可以用于在 Docker 容器中执行自定义命令。它是一个开源的轻量级管理 UI，让你可以轻松管理 Docker 主机或 Docker swarm 集群。

# 快速开始
- 使用此链接添加我的仓库
[![Add repository on my Home Assistant][repository-badge]][repository-url]
- 从我的仓库安装 portainer 附加组件
- 在附加组件的配置面板中，你可以更改密码
- 在附加组件的主页中，禁用“保护模式”，然后启动附加组件
- 登录（默认用户名是 `admin`，默认密码是 `homeassistant`）
- 点击环境中的 `Primary`（在页面中央）
- 点击左侧菜单栏中的 `Containers`
- 增加每页项目的数量以查看所有附加组件
- 点击所选附加组件名称旁边的符号 `>_` 以打开控制台页面
- 更改用户名，或更常见地直接点击连接
- 输入你的命令，你对这个特定容器的终端有完全访问权限（这不会影响你的 HA 系统的其他部分）

# 对你系统的影响
- 安装或运行 portainer 不会对系统产生影响
- 手动安装自定义容器会将你的 HA 状态修改为不受支持/不健康的状态。你将无法升级 Home Assistant 和你可能拥有的任何附加组件。停止这个自定义容器将重置正常状态

# 提示和技巧

## 重置数据库
只需在你的附加组件选项中更改密码，数据库将被重置

## 60 秒超时
该附加组件包含一个很长的超时。然而，如果你使用其他代理层，例如附加组件 nginx 代理管理器，它将默认为 60 秒超时。你需要调整代理层以增加超时。更多细节请见此处: https://github.com/portainer/portainer/issues/2953#issuecomment-1235795256

## 进一步参考
- 这是一个使用它的完整指南: https://codeopolis.com/posts/beginners-guide-to-portainer/
- 关于 portainer 的 HA 社区论坛旧页面: https://community.home-assistant.io/t/home-assistant-community-add-on-portainer

[repository-badge]: https://img.shields.io/badge/Add%20repository%20to%20my-Home%20Assistant-41BDF5?logo=home-assistant&style=for-the-badge
[repository-url]: https://my.home-assistant.io/redirect/supervisor_add_addon_repository/?repository_url=https%3A%2F%2Fgithub.com%2Falexbelgium%2Fhassio-addons