# Home Assistant 插件：Git pull

## 安装

按照以下步骤在您的系统上安装插件：

1. 在您的 Home Assistant 前端，导航至 **设置** -> **插件** -> **插件商店**。
2. 找到 “Git pull” 插件并点击它。
3. 点击 “安装” 按钮。

## 警告

可能会完全丢失数据。在启动此插件之前，请确保您的 Home Assistant 配置文件的副本存在于 GitHub 仓库中。否则，您的本地机器配置文件夹将被空配置文件夹覆盖，您需要从备份中恢复。

## 如何使用

在配置部分，将存储库字段设置为您的存储库的克隆 URL，并检查是否需要自定义任何其他字段以与您的存储库配合使用。接下来，

1. 启动插件。
2. 检查插件日志输出以查看结果。

如果日志没有以错误结束，说明插件已成功访问您的 git 仓库。如果没有错误，您可能会看到以下日志示例：`[信息] 没有变化。`、`[信息] 有变更，正在检查 Home-Assistant 配置...`，或者 `[信息] 本地配置已更改。需要重启。`。

如果您已经看到此信息，您可能希望通过将 `active` 字段（`repeat` 的子字段）设置为 `true` 并启用 “开机自启”，让插件自动检查更新。

## 配置

插件配置：

```yaml
git_branch: master
git_command: pull
git_remote: origin
git_prune: 'false'
repository: https://example.com/my_configs.git
auto_restart: false
restart_ignore:
  - ui-lovelace.yaml
  - ".gitignore"
  - exampledirectory/
repeat:
  active: false
  interval: 300
deployment_user: ''
deployment_password: ''
deployment_key:
  - "-----BEGIN RSA PRIVATE KEY-----"
  - MIIEowIBAAKCAQEAv3hUrCvqGZKpXQ5ofxTOuH6pYSOZDsCqPqmaGBdUzBFgauQM
  - xDEcoODGHIsWd7t9meAFqUtKXndeiKjfP0MMKsttnDohL1kb9mRvHre4VUqMsT5F
  - "..."
  - i3RUtnIHxGi1NqknIY56Hwa3id2yk7cEzvQGAAko/t6PCbe20AfmSQczs7wDNtBD
  - HgXRyIqIXHYk2+5w+N2eunURIBqCI9uWYK/r81TMR6V84R+XhtvM
  - "-----END RSA PRIVATE KEY-----"
deployment_key_protocol: rsa
```

### 选项： `git_remote` (必填)

要跟踪的存储库名称。如果不确定，请将其保留为 `origin`。

### 选项： `git_prune` (必填)

`true`/`false`：如果设置为 true，插件将清理在远程存储库中已删除但在本地机器上仍有缓存条目的分支。如果不确定，请保留为 `false`。

### 选项： `git_branch` (必填)

Git 仓库的分支名称。如果留空，将更新当前检出的分支。如果不确定，请保留为 'master'。

### 选项： `git_command` (必填)

`pull`/`reset`：要运行的命令。如果不确定，请保留为 `pull`。

- `pull`
  
  - 将远程存储库的更改合并到当前分支。将保留对跟踪文件的任何本地更改。

- `reset`
  
  - 将执行 `git reset --hard` 并覆盖对跟踪文件的任何本地更改，并从远程存储库更新。**警告**：使用 `reset` 将覆盖对跟踪文件的更改。您可以使用此命令列出所有跟踪文件：`git ls-tree -r master --name-only`。

### 选项： `repository` (必填)

您的存储库的 Git URL（确保使用双引号）。

### 选项： `auto_restart` (必填)

`true`/`false`：当配置已更改（且有效）时，重新启动 Home Assistant。

### 选项： `restart_ignore` (可选)

当启用 `auto_restart` 时，对这些文件的更改将不会导致 HA 重新启动。可以指定要忽略的完整目录。

### 选项组： `repeat`

以下选项适用于选项组： `repeat`，并配置 Git pull 插件以定期自动轮询存储库以获取更新。

#### 选项： `repeat.active` (必填)

`true`/`false`：启用/禁用自动轮询。

#### 选项： `repeat.interval` (必填)

当启用自动轮询时，检查存储库的间隔（以秒为单位）。

### 选项： `deployment_user` (可选)

用来通过用户名和密码进行身份验证时的用户名。

### 选项： `deployment_password` (可选)

用来进行身份验证的密码。如果未设置 `deployment_user`，则被忽略。

### 选项： `deployment_key` (可选)

用于 Git 操作期间通信的私有 SSH 密钥。此密钥对于通过 SSH 访问的存储库是必需的，即具有以下模式的存储库：`<user>@<host>:<repository path>`。此密钥必须在没有密码短语的情况下创建。

### 选项： `deployment_key_protocol` (可选)

密钥协议。默认值为 `rsa`。有效的协议有：

- dsa
- ecdsa
- ed25519
- rsa

该协议通常由私钥的后缀决定，例如，名为 `id_rsa` 的密钥文件将是使用 `rsa` 协议的私钥。

## 支持

有问题吗？

您有几种选择可以获得答案：

- [Home Assistant Discord 聊天服务器][discord]。
- Home Assistant [社区论坛][forum]。
- 加入 [Reddit 子论坛][reddit] 在 [/r/homeassistant][reddit]。

如果您发现了一个错误，请 [在我们的 GitHub 上报告问题][issue]。

[discord]: https://discord.gg/c5DvZ4e
[forum]: https://community.home-assistant.io
[issue]: https://github.com/home-assistant/addons/issues
[reddit]: https://reddit.com/r/homeassistant
[repository]: https://github.com/hassio-addons/repository