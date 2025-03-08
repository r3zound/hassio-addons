# 非官方 Home Assistant 插件：Rclone

将 Rclone 打包为 Home Assistant 插件。

## 关于

Rclone（“云存储的 rsync”）是一个命令行工具，用于将文件和目录同步到不同的云存储提供商之间。此插件仅可用于将您的 Home Assistant 文件（如快照）同步到远程位置。

[点击此处查看完整的 Rclone 文档](https://rclone.org/docs/)

## 已知问题和限制

- 您需要手动创建一个 rclone 配置文件

### Google Drive 根文件夹 ID

在创建 Google Drive 远程时，您需要指定根文件夹的 ID。如果不指定此值，同步将会失败。

根文件夹 ID 可以在运行您的 `rclone config` 步骤后，通过 `rclone ls [drive]:[path]` 容易找到（当然将 `[drive]` 和 `[path]` 替换为您的远程名称和远程路径）。然后将此 ID 填入您的 `rclone.conf` 文件中。

## 最后的说明

该项目与 Rclone、Rclone 维护团队或 Nick Craig-Wood 无关，仅是一个社区努力。Rclone 本身是在 [MIT 许可证](https://rclone.org/licence/) 下分发的。

从 ![https://github.com/alex3305/home-assistant-addons](https://github.com/alex3305/home-assistant-addons) 复刻。