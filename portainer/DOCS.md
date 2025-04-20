Portainer 可以用于在 docker 容器中执行自定义命令。它是一个开源轻量级管理 UI，可以让您轻松管理一个或多个 Docker 主机或 Docker swarm 集群。

# 快速开始
- 使用此链接添加我的仓库
[![Add repository on my Home Assistant][repository-badge]][repository-url]
- 从我的仓库中安装 portainer 附加组件
- 在附加组件的配置面板中，您可以更改密码
- 在附加组件的主页中，禁用“保护模式”，然后启动附加组件
- 登录（默认用户名是 `admin`，默认密码是 `homeassistant`）
- 点击环境中的 `Primary`（在页面中央）
- 在左侧菜单栏中点击 `Containers`
- 增加每页项目的数量以查看所有的附加组件
- 点击您选择的附加组件名称旁边的符号 `>_` 打开控制台页面
- 更改用户名，或者通常只需点击连接
- 输入您的命令，您可以完全访问此特定容器的终端（这不会影响您 HA 系统的其他部分）

# 对系统的影响
- 安装或运行 portainer 不会对系统产生影响
- 手动安装自定义容器会将您的 HA 状态修改为不受支持/不健康状态。您将被阻止升级 Home Assistant 和任何附加组件。停止这个自定义容器将重置为正常状态

# 提示和技巧

## 重置数据库
只需在您的附加组件选项中更改密码，数据库将被重置

## 60 秒超时
这个附加组件包括一个非常长的超时。但是，如果您使用另一层代理，比如附加组件 nginx 代理管理器，默认超时将为 60 秒。您需要调整代理层以增加超时。更多详细信息请参阅： https://github.com/portainer/portainer/issues/2953#issuecomment-1235795256

## 进一步参考
- 这里有一个使用它的完整指南：https://codeopolis.com/posts/beginners-guide-to-portainer/
- 关于 portainer 的 HA 社区论坛旧页面：https://community.home-assistant.io/t/home-assistant-community-add-on-portainer

[repository-badge]: https://img.shields.io/badge/Add%20repository%20to%20my-Home%20Assistant-41BDF5?logo=home-assistant&style=for-the-badge
[repository-url]: https://my.home-assistant.io/redirect/supervisor_add_addon_repository/?repository_url=https%3A%2F%2Fgithub.com%2Falexbelgium%2Fhassio-addons