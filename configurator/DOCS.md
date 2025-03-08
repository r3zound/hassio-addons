# Home Assistant 插件：文件编辑器

## 安装

按照以下步骤在您的系统上安装该插件：

1. 在您的 Home Assistant 前端导航到 **设置** -> **插件** -> **插件商店**。
2. 找到 "文件编辑器" 插件并点击它。
3. 点击 "安装" 按钮。

## 如何使用

一般来说，该插件不需要您进行任何配置。

1. 切换 "在侧边栏中显示" 选项，这将把文件编辑器添加到主菜单。
2. 启动插件。
3. 刷新您的浏览器，"文件编辑器" 现在在侧边栏中可见。
4. 点击 "文件编辑器" 菜单选项并开始配置！

## 配置

插件配置：

```yaml
dirsfirst: false
enforce_basepath: false
git: true
ignore_pattern:
  - __pycache__
ssh_keys: []
```

### 选项：`dirsfirst`（必需）

此选项允许您在文件浏览器树中先列出目录，再列出文件。

设置为 `true` 以先列出目录，设置为 `false` 则相反。

### 选项：`enforce_basepath`（必需）

如果设置为 `true`，访问将限制在 `/homeassistant` 目录内
（也称为 Home Assistant 内部的 `/config` 文件夹）。

### 选项：`git`（必需）

如果设置为 `true`，插件将为支持的目录初始化 git。

### 选项：`ignore_pattern`（必需）

此选项允许您从文件浏览器树中隐藏文件和文件夹。
默认情况下，它隐藏 `__pycache__` 文件夹。

### 选项：`ssh_keys`（必需）

包含 SSH 私钥的文件名列表。可以用来允许访问远程 git 仓库。

## 已知问题和限制

- 该插件只能通过 Ingress 使用，并且没有直接访问权限。

## 支持

有问题吗？

您可以通过几种方式获得答案：

- [Home Assistant Discord 聊天服务器][discord]。
- Home Assistant [社区论坛][forum]。
- 加入 [/r/homeassistant][reddit] 的 [Reddit 子版块][reddit]。

如果您发现了一个错误，请 [在我们的 GitHub 上报告问题][issue]。

[discord]: https://discord.gg/c5DvZ4e
[forum]: https://community.home-assistant.io
[issue]: https://github.com/home-assistant/addons/issues
[reddit]: https://reddit.com/r/homeassistant