# 配置

```yaml
repository:
  url: <你的仓库路径>
  username: 用户名
  password: 密码
  pull_before_push: true
  commit_message: 'Home Assistant Git Exporter'
  branch_name: 'main'
export:
  lovelace: true
  addons: true
  esphome: true
  node_red: true
checks:
  enabled: true
  check_for_secrets: true
  check_for_ips: true
exclude:
  - '*.db'
  - '*.log'
  - __pycache__
  - deps/
  - known_devices.yaml
  - tts/
  - '*.db-shm'
  - '*.db-wal'
  - '*.gz'
secrets: []
allowed_secrets: []
dry_run: false
```

### `repository.url`

你的 git 仓库的任何 https url.（目前不支持 SSH）

### `repository.email`（可选）

提交作者使用的电子邮件地址。

### `repository.username`

你的 https 认证用户名。

### `repository.password`

你的仓库的密码或 [__访问令牌__](https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/managing-your-personal-access-tokens)。

### `repository.pull_before_push`

是否先拉取仓库并将新状态提交到上面？

### `repository.commit_message`

下一个提交的提交信息。

### `repository.branch_name`

仓库的工作分支。

### `repository.ssl_verification`（可选，默认：true）

用于禁用 ssl 验证。可用于自签名证书。__仅在你知道自己在做什么时使用这个__。

### `export.lovelace`

启用/禁用 lovelace 配置的导出。

### `export.addons`

启用/禁用监督员插件配置的导出。

### `export.esphome`

启用/禁用 esphome 配置的导出。

### `export.node_red`

启用/禁用 Node-RED 流程的导出。
使用 [node-red-contrib-credentials](https://flows.nodered.org/node/node-red-contrib-credentials) 来保护你的凭据。

### `checks.enabled`

启用/禁用导出文件中的检查。

### `checks.check_for_secrets`

将你的秘密值添加到检查中。

### `checks.check_for_ips`

将 ip 和 mac 地址的模式添加到搜索中。

### `exclude`

应从配置导出中排除的文件/文件夹。

默认情况下，以下文件夹和文件会被排除在同步之外：

* `secrets.yaml`（秘密会被清除）
* `.cloud`
* `.storage`

### `secrets`

将检查的额外秘密。

### `allowed_secrets`

将不会导致秘密检查失败的其他允许的秘密。

### `dry_run`

仅显示更改，不提交或推送。

## 已知限制

`check_for_secrets` 使用 git 插件，该插件使用正则表达式进行模式匹配。
该插件的一个限制是，在秘密中使用括号（如 `[`, `]`, `{`, `}` `(` 和 `)`) 可能会导致意外行为和崩溃。

如果在秘密检查期间插件出现错误（例如 `grep: Unmatched [, [^, [:, [., or [=`），
请更改包含括号的密码或将 `check_for_secrets` 设置为 `false`。