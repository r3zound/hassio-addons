# 非官方 Home Assistant 插件：Rclone

将 Rclone 打包为 Home Assistant 插件。

## 安装

按照以下步骤将插件安装到您的系统中：

1. 在您的 Home Assistant 前端导航到 **Supervisor -> Add-on Store**
1. 通过 URL 添加这个新仓库 （`https://github.com/bluemaex/home-assistant-addons`）
1. 找到 "Rclone" 插件并点击它。
1. 点击 "INSTALL" 按钮

## 如何使用

安装后，您需要生成一个 rclone 配置文件。可以通过几种方式完成此操作：

### 本地生成 rclone 配置

1. 下载适合您平台的 [最新版本](https://rclone.org/downloads/) 并提取 rclone 二进制文件
1. 运行 `rclone config`
1. 设置远程
1. 将生成的 Rclone 配置复制到您的 Hass.io 主机

### 通过 Docker 容器生成 rclone 配置

1. 运行 `docker run --rm -it --entrypoint /bin/sh rclone/rclone`
1. 运行 `rclone --config /data/rclone.conf config`
1. 设置远程
1. 运行 `cat /data/rclone.conf` 并将内容复制到您的 Hass.io 主机

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

### 选项 `configuration_path` （必填）

Rclone 配置文件的路径。您可以使用 `/share/` 或 `/config/`
目录来存储此文件。

### 选项 `local_retention_days` （必填）

保留本地文件的天数。超过此日期的文件将被本应用修剪。例如，如果设置值为 15，则本地超过 15 天的文件将被删除。

> **注意** 此值应高于 `remote_retention_days`。

### 选项 `remotes.name` （必填）

要复制 Hass.io 快照的远程名称。

### 选项 `remotes.path` （必填）

远程上复制文件应该存储的路径。

### 选项 `remotes.retention_days` （必填）

保留远程文件的天数。超过此日期的文件将被本应用修剪。例如，如果设置值为 15，则远程超过 15 天的文件将被删除。

### 选项 `remotes.start_url` （可选）

在为此远程启动 rclone 之前被 ping 的 URL。适合与 `healthchecks.io` 等监测进度。

### 选项 `remotes.end_url` （可选）

在此远程的 rclone 执行后，我们将结果日志 POST 到的 URL。适合与 `healthchecks.io` 等监测进度。

## 自动化

这个插件可以轻松地与自动化一起使用。例如：

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

这将在早上 07:30 修剪本地文件并运行 Rclone 复制。