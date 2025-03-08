## 安全性

为了挂载你的外部设备，集成的 AppArmor 功能已被禁用。此插件可以访问具有可用 `external_device` 配置选项路径的设备！

## 配置

示例配置：

```yaml
folders:
  - source: /config
  - source: /media/playlists
    options: '--archive --recursive --compress'
external_folder: backup
external_device: ''
```

### `folders`

你想要与远程机器同步的文件夹列表。

### `folders` - `source`

rsync 的源文件夹。

### `folders` - `options`（可选）

使用你自己的 rsync 选项。该字符串将替代默认选项，直接传递给 rsync。默认选项为 `--archive --recursive --compress --delete --prune-empty-dirs`。

### `external_folder`

用于同步文件夹的外部 USB 驱动器或 USB 设备的基础文件夹。将会在这里创建包含上述文件夹的子文件夹。该路径不应以 `/` 开头。

### `external_device`

如果你需要指定一个特定的设备进行备份，这里有这个选项。默认情况下设备为 `/dev/sda1`。确保在例如从外部驱动器运行 Home Assistant 时进行调整。`sda1` 将是 Home Assistant 驱动器的一个分区。

如果未指定设备，所有可用设备将显示在日志中。没有设备时不进行同步。

可用选项：`/dev/sd[a-e][1-5]`