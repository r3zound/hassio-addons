# 非官方 Home Assistant 插件：Rclone

Rclone 打包为 Home Assistant 插件。

## 关于

Rclone（“云存储的 rsync”）是一个命令行程序，用于将文件和目录在不同的云存储提供商之间同步。此插件只能用于将您的 Home Assistant 文件（例如快照）同步到远程。

[点击这里查看完整的 Rclone 文档](https://rclone.org/docs/)

## 已知问题和限制

- 您必须手动创建 rclone 配置

### Google Drive 根文件夹 ID

创建 Google Drive 远程时，您必须指定根文件夹的 ID。如果您不指定此值，同步将失败。

在您运行了 `rclone config` 步骤后，可以通过 `rclone ls [drive]:[path]`（当然要将 `[drive]` 和 `[path]` 分别替换为您的远程名称和远程路径）轻松找到根文件夹 ID。此 ID 将被填入您的 `rclone.conf` 文件中。

## 最后说明

该项目与 Rclone、Rclone 维护团队或 Nick Craig-Wood 没有任何关联，仅仅是一项社区努力。Rclone 本身是根据 [MIT 许可证](https://rclone.org/licence/) 分发的。

源自 ![https://github.com/alex3305/home-assistant-addons](https://github.com/alex3305/home-assistant-addons)