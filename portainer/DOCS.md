Portainer 可以用来在 Docker 容器中执行自定义命令。它是一个开源的轻量级管理界面，允许你轻松管理 Docker 主机或 Docker Swarm 集群。

# 快速开始
- 使用此链接添加我的仓库
[![在我的 Home Assistant 上添加仓库][repository-badge]][repository-url]
- 从我的仓库安装 Portainer 插件
- 在插件的配置面板中，你可以更改密码
- 在插件的主页上，禁用“保护模式”，然后启动插件
- 登录（默认用户名是 `admin`，默认密码是 `homeassistant`）
- 在环境中点击 `Primary`（页面中央）
- 在左侧菜单栏点击 `Containers`
- 增加每页显示的项目数量以查看所有插件
- 点击选定插件名称旁的符号 `>_` 打开控制台页面
- 更改用户名，或者通常只需点击连接
- 输入你的命令，你对这个特定容器的终端拥有完全访问权限（这不会影响你 HA 系统的其他部分）

# 对你系统的影响
- 安装或运行 Portainer 不会对系统产生影响
- 手动安装自定义容器将使你的 Home Assistant 状态变为不支持/不健康状态。你将无法升级 Home Assistant 和升级你可能拥有的任何插件。停止这个自定义容器将重置为正常状态

# 小贴士和技巧

## 重置数据库
只需在你的插件选项中更改密码，数据库将被重置

## 超时为 60 秒
插件包括一个非常长的超时设置。然而，如果你使用其他代理层，如插件 Nginx 代理管理器，它将默认超时为 60 秒。你需要调整代理层以增加超时。更多详情请见： https://github.com/portainer/portainer/issues/2953#issuecomment-1235795256

## 进一步参考
- 这是一个完整的使用指南： https://codeopolis.com/posts/beginners-guide-to-portainer/
- 关于 Portainer 的 Home Assistant 社区论坛旧页面： https://community.home-assistant.io/t/home-assistant-community-add-on-portainer

[repository-badge]: https://img.shields.io/badge/Add%20repository%20to%20my-Home%20Assistant-41BDF5?logo=home-assistant&style=for-the-badge
[repository-url]: https://my.home-assistant.io/redirect/supervisor_add_addon_repository/?repository_url=https%3A%2F%2Fgithub.com%2Falexbelgium%2Fhassio-addons