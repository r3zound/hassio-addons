# 配置

```yaml
media_folder: /media/mpd/media
playlist_folder: /media/mpd/playlists
volume_normalization: false
httpd_output: false
```

### `volume_normalization`

启用内置的音量规范化功能。

### `httpd_output`

启用 httpd 音频输出。

### `media_folder`

此选项允许您指定自定义媒体文件夹。

### `playlist_folder`

此选项允许您指定自定义播放列表文件夹。

### `verbose` （可选）

使 `mpd` 变得详细。

```yaml
verbose: true
```

### `custom_config` （可选）

**如果指定了此项，将忽略所有其他选项。**

此选项允许您为 MPD 指定自定义配置文件。
为了将所有 MPD 文件保留在一个地方，我将路径前缀限制为 `/share/mpd`
请使用 [插件的默认 mpd.conf](https://github.com/Poeschl/Hassio-Addons/blob/main/mpd/root/etc/mpd.conf) 作为起点。
如果您在配置上遇到问题， [MPD 文档](https://www.musicpd.org/doc/html/user.html#configuration) 可能会对您有所帮助。

工作示例：

```yaml
...
custom_config: /share/mpd/mpd.conf
```

# 疑难排解

### `RTIOThread could not get realtime scheduling, continuing anyway: sched_setscheduler`

此错误在任何非 glibc 系统（如 alpine linux）上显示。 MPD 应该可以在没有它的情况下工作。
更多信息请见此处: [MPD 问题](https://github.com/MusicPlayerDaemon/MPD/issues/218)

### `Failed to open '/data/database/mpd.db': No such file or directory`

此错误在第一次启动时显示，当数据库不存在时。 在第二次运行时将会出现。

# MPD

要从 Home Assistant 连接，请使用 [MPD 集成](https://www.home-assistant.io/integrations/mpd/) 和以下值：

```text
host: 68413af6-mpd
password: <empty>
port: 6600