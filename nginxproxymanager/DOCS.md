# Home Assistant 社区插件：Nginx 代理管理器

此插件使您能够轻松地将传入连接转发到任何地方，包括免费 SSL，而无需了解太多关于 Nginx 或 Let’s Encrypt 的知识。

直接从一个简单而强大的界面，将您的域名转发到您的 Home Assistant、插件或在家或其他地方运行的网站。

想要用用户名/密码保护网站吗？好吧，它也可以做到这一点！启用身份验证并创建可访问该特定应用程序的用户名/密码列表。

对于高级用户，您可以通过提供额外的 Nginx 指令来自定义 Nginx 代理管理器中每个主机的行为。

## 安装

此插件的安装非常简单，与安装任何其他 Home Assistant 插件没有什么不同。

1. 点击下面的 Home Assistant 我的按钮以在您的 Home Assistant 实例中打开该插件。

   [![在您的 Home Assistant 实例中打开此插件.][addon-badge]][addon]

1. 点击“安装”按钮安装插件。
1. 启动“ Nginx 代理管理器”插件。
1. 检查“Nginx 代理管理器”插件的日志，以查看一切是否顺利。
1. 点击“打开 Web UI”按钮并使用以下信息登录：
   `admin@example.com` / `changeme`
1. 从您的路由器转发端口 `443`（可选的 `80`）到您的 Home Assistant 机器。
1. 享受该插件！

## 配置

此插件不提供任何配置。

## 更改日志与发布

此存储库使用 [GitHub 的发布][releases] 功能维护更改日志。

发布基于 [语义版本控制][semver]，并使用 `MAJOR.MINOR.PATCH` 的格式。简而言之，版本将根据以下内容进行增加：

- `MAJOR`：不兼容或重大更改。
- `MINOR`：向后兼容的新功能和增强。
- `PATCH`：向后兼容的错误修复和软件包更新。

## 支持

有问题吗？

您有几个选项可以获得解答：

- Home Assistant 社区插件 Discord 聊天服务器[discord]，用于插件支持和功能请求。
- Home Assistant Discord 聊天服务器[discord-ha]，用于一般的 Home Assistant 讨论和问题。
- Home Assistant [社区论坛][forum]。
- 加入 [Reddit 子版块][reddit] 在 [/r/homeassistant][reddit]。

您还可以在这里[提出问题][issue] GitHub。

## 作者与贡献者

此存储库的最初设置由 [Franck Nijhof][frenck] 完成。

有关所有作者和贡献者的完整列表，请查看 [贡献者页面][contributors]。

## 许可证

MIT 许可证

版权所有 (c) 2019-2024 Franck Nijhof

特此免费授权任何获得本软件及其相关文档文件（“软件”）的人员，在不受限制的情况下处理该软件，包括但不限于使用、复制、修改、合并、发布、分发、再授权和/或出售该软件的副本的权利，并允许向其提供软件的个人这样做，条件如下：

上述版权声明和本许可声明应包含在该软件的所有副本或重要部分中。

本软件按“原样”提供，不提供任何形式的担保，无论是明示或暗示，包括但不限于对适销性、特定用途适用性和不侵权的担保。在任何情况下，作者或版权持有者对由于使用软件或与软件或其他交易的使用或相关而导致的任何索赔、损害或其他责任不承担责任，无论是在合同、侵权或其他方面。

[addon-badge]: https://my.home-assistant.io/badges/supervisor_addon.svg
[addon]: https://my.home-assistant.io/redirect/supervisor_addon/?addon=a0d7b954_nginxproxymanager&repository_url=https%3A%2F%2Fgithub.com%2Fhassio-addons%2Frepository
[contributors]: https://github.com/hassio-addons/addon-nginx-proxy-manager/graphs/contributors
[discord-ha]: https://discord.gg/c5DvZ4e
[discord]: https://discord.me/hassioaddons
[forum]: https://community.home-assistant.io/t/home-assistant-community-add-on-nginx-proxy-manager/111830?u=frenck
[frenck]: https://github.com/frenck
[issue]: https://github.com/hassio-addons/addon-nginx-proxy-manager/issues
[reddit]: https://reddit.com/r/homeassistant
[releases]: https://github.com/hassio-addons/addon-nginx-proxy-manager/releases
[semver]: https://semver.org/spec/v2.0.0.html