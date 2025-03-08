# 配置

```yaml
media_folder: /media/mpd/media
playlist_folder: /media/mpd/playlists
volume_normalization: false
httpd_output: false
```

### `volume_normalization`

启用内置的音量标准化功能。

### `httpd_output`

启用httpd音频输出。

### `media_folder`

该选项允许您指定自定义媒体文件夹。

### `playlist_folder`

该选项允许您指定自定义播放列表文件夹。

### `verbose` （可选）

使 `mpd` 输出详细信息。

```yaml
verbose: true
```

### `custom_config` （可选）

**如果指定了此项，将忽略所有其他选项。**

该选项允许您指定MPD的自定义配置文件。
为了将所有MPD文件集中在一个地方，我将路径前缀限制为`/share/mpd`。
请使用默认的 [addon的mpd.conf](https://github.com/Poeschl/Hassio-Addons/blob/main/mpd/root/etc/mpd.conf) 作为起始点。
如果您在配置中遇到问题，[MPD文档](https://www.musicpd.org/doc/html/user.html#configuration) 可能会对您有所帮助。

工作示例：

```yaml
...
custom_config: /share/mpd/mpd.conf
```

# 故障排除

### `RTIOThread could not get realtime scheduling, continuing anyway: sched_setscheduler`

此错误在任何非glibc系统上显示，例如alpine linux。MPD应该在没有它的情况下正常工作。
更多信息见这里: [MPD问题](https://github.com/MusicPlayerDaemon/MPD/issues/218)

### `Failed to open '/data/database/mpd.db': No such file or directory`

该错误在第一次启动时显示，当时数据库不存在。第二次运行时会存在。

# MPD

要从Home Assistant连接，请使用 [MPD集成](https://www.home-assistant.io/integrations/mpd/) 并使用以下值：

```text
host: 68413af6-mpd
password: <empty>
port: 6600