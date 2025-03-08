# 非官方 Home Assistant 插件：Rclone

将 Rclone 打包为一个 Home Assistant 插件。

## 安装

按照以下步骤在您的系统上安装插件：

1. 在您的 Home Assistant 前端中导航到 **Supervisor -> Add-on Store**
2. 通过 URL 添加这个新仓库 (`https://github.com/bluemaex/home-assistant-addons`)
3. 找到 "Rclone" 插件并点击它。
4. 点击 "INSTALL" 按钮

## 如何使用

安装后，您需要生成一个 rclone 配置文件。这可以通过几种方式完成：

### 本地生成 rclone 配置

1. 下载适合您平台的 [最新版本](https://rclone.org/downloads/) 并解压 rclone 二进制文件
2. 运行 `rclone config`
3. 设置您的远程
4. 将生成的 Rclone 配置复制到您的 Hass.io 主机

### 通过 Docker 容器生成 rclone 配置

1. 运行 `docker run --rm -it --entrypoint /bin/sh rclone/rclone`
2. 运行 `rclone --config /data/rclone.conf config`
3. 设置您的远程
4. 运行 `cat /data/rclone.conf` 并将内容复制到您的 Hass.io 主机

> **注意** 有关 Rclone 配置的更多信息，请阅读
> [Rclone 文档](https://rclone.org/docs/)。

### Rclone 配置示例

```conf
[myremote]
type = owncloud
url = https://some.owncloudhost.com/remote.php/webdav/
vendor = owncloud
user = homeassistant
pass = *** 加密的密码 ***
```

## 配置

```yaml
configuration_path: /share/rclone/rclone.conf
local_retention_days: 45
remotes:
  - name: my-webdav
    path: /backups/
    retention_days: 30
  - name: my-gdrive
    path: /
    retention_days: 14
```

### 选项 `configuration_path`（必需）

Rclone 配置文件的路径。您可以使用 `/share/` 或 `/config/` 目录来存储此文件。

### 选项 `local_retention_days`（必需）

保留本地文件的天数。超过此日期的文件将由此应用程序清除。例如，如果设置值为 15，则本地文件中超过 15 天的文件将被删除。

> **注意** 此值应高于 `remote_retention_days`。

### 选项 `remotes.name`（必需）

要复制 Hass.io 快照的远程名称。

### 选项 `remotes.path`（必需）

在远程存储复制文件的路径。

### 选项 `remotes.retention_days`（必需）

保留远程文件的天数。超过此日期的文件将由此应用程序清除。例如，如果设置值为 15，则远程文件中超过 15 天的文件将被删除。

### 选项 `remotes.start_url`（可选）

在我们开始为此远程运行 rclone 之前 ping 的 URL。适合通过例如 `healthchecks.io` 监控进度。

### 选项 `remotes.end_url`（可选）

在为此远程运行 rclone 后，我们将结果日志 POST 到的 URL。适合通过例如 `healthchecks.io` 监控进度。

## 自动化

此插件可以很容易地与自动化一起使用。例如：

```yaml
- id: home_assistant_run_backup
  alias: Home Assistant 备份
  trigger:
    platform: time
    at: "07:30"
  action:
    service: hassio.addon_start
    data_template:
      addon: 32de6d38_rclone
```

这将在早上 07:30 清除本地文件并运行 Rclone 复制。