# 配置

```yaml
media_folder: /media/mopidy/media
playlist_folder: /media/mopidy/playlists
locale: en_US
country: en
radio_net:
  language: net
  favorite_radiostations: []
```

### `media_folder`

该选项允许您指定自定义媒体文件夹。

### `playlist_folder`

该选项允许您指定自定义播放列表文件夹。

### `locale`

您的地区设置为2x2格式。此设置用于用户界面和一些扩展。
默认值为`en_US`，地区列表在 [这里](https://github.com/umpirsky/locale-list/blob/main/data/en_US/locales.yaml)。

### `country`

您的国家代码为两个字母。此设置用于用户界面和一些扩展。
默认代码为`en`。

### `radio_net/language`

显示电台的语言文本信息。可能的选项有：`net`、`at`、`de`、`dk`、`es`、`fr`、`it`、`pl`、`pt`、`se`。

### `radio_net/favorite_radiostations`

您最喜欢的电台标识符，用于radio.net扩展。[有关该设置的更多信息](https://github.com/plintx/mopidy-radionet#configuration)。

### `custom_config` (可选)

**如果指定了此项，所有其他选项将被忽略。**

该选项允许您为mopidy指定自定义配置文件。
为了将所有MPD文件放在一个地方，我将路径前缀限制为`/share/mopidy`
请使用[插件的默认mopidy.conf](https://github.com/Poeschl/Hassio-Addons/blob/main/mopidy/root/etc/mopidy-template.conf)作为起始点。

工作示例：

```yaml
...
custom_config: /share/mopidy/mopidy.conf
```

# 本地媒体

本地媒体可以存储在`/media`或`/share`上的任何文件夹中（可以通过samba插件访问）。
默认情况下，媒体目录为`/media/mopidy/media`，播放列表的默认目录为`/media/mopidy/playlists`。

# 面板集成

由于Mopidy-Iris与入口功能（至少开箱即用）不兼容，因此可以通过以下行将Mopidy添加到配置的侧边面板中：

```yaml
panel_iframe:
  morpidy:
    title: 'Morpidy'
    icon: 'mdi:music-circle'
    url: 'http://<homeassistant-address>:6680/iris'
```

# MPD

要从Home Assistant连接，请使用以下配置：

```yaml
media_player:
  - platform: mpd
    host: 243ffc37-mopidy
    port: 6600