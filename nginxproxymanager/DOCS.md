# Home Assistant社区插件：Nginx代理管理器

此插件使您能够轻松地将传入连接转发到任何地方，包括免费的SSL，而无需对Nginx或Let’s Encrypt了解太多。

通过一个简单而强大的界面，将您的域名转发到您的Home Assistant、插件或在家或其他地方运行的网站。

想用用户名/密码保护网站吗？当然，可以做到这一点！启用身份验证，并创建可以访问该特定应用程序的用户名/密码列表。

对于强大的用户，您可以通过提供额外的Nginx指令自定义Nginx代理管理器中每个主机的行为。

## 安装

此插件的安装非常简单，与安装任何其他Home Assistant插件没有不同。

1. 点击下面的Home Assistant按钮以在您的Home Assistant实例中打开插件。

   [![在您的Home Assistant实例中打开此插件。][addon-badge]][addon]

1. 点击“安装”按钮以安装插件。
1. 启动“Nginx代理管理器”插件
1. 检查“Nginx代理管理器”插件的日志，以查看一切是否正常。
1. 点击“打开WEB UI”按钮并使用以下凭据登录：
   `admin@example.com` / `changeme`
1. 从路由器将端口`443`（可选`80`）转发到您的Home Assistant机器。
1. 享受插件！

## 配置

此插件不提供任何配置。

## 更新日志和版本

此存储库使用[GitHub的发布][releases]功能保持变更日志。

版本基于[语义版本控制][semver]，使用`MAJOR.MINOR.PATCH`的格式。简而言之，版本将根据以下内容递增：

- `MAJOR`：不兼容或重大更改。
- `MINOR`：向后兼容的新功能和增强。
- `PATCH`：向后兼容的错误修复和包更新。

## 支持

有问题吗？

您有几种选项可以获得答案：

- [Home Assistant社区插件Discord聊天服务器][discord]以获得插件支持和功能请求。
- [Home Assistant Discord聊天服务器][discord-ha]以进行一般Home Assistant讨论和提问。
- Home Assistant [社区论坛][forum]。
- 加入[Reddit子版块][reddit]中的[/r/homeassistant][reddit]

您也可以在这里[打开问题][issue] GitHub。

## 作者与贡献者

此存储库的原始设置由[Franck Nijhof][frenck]完成。

要查看所有作者和贡献者的完整列表，请查看[贡献者页面][contributors]。

## 许可证

MIT许可证

版权所有 (c) 2019-2024 Franck Nijhof

特此授予任何获取本软件及相关文档文件（以下简称“软件”）副本的人免费、无条件地使用、复制、修改、合并、发布、分发、再授权和/或出售软件副本的权利，并允许本软件的提供者在遵守下述条件的情况下这么做：

上述版权声明和本许可声明应包含在所有软件副本或重要部分中。

本软件按“原样”提供，不提供任何形式的保证，包括但不限于对适销性、特定用途的适用性和非侵权的保证。在任何情况下，作者或版权持有人对因使用软件或与软件的使用或其他交易相关的任何索赔、损害或其他责任不承担责任，无论是合同诉讼、侵权诉讼还是其他诉讼。

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