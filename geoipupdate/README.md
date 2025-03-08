# Home Assistant 插件：GeoIP 更新

GeoIP 更新程序执行 GeoIP2 和 GeoLite2 二进制数据库的自动更新。

设计用于与 @einschmidt 的 Caddy2 插件一起使用，访问 `https://github.com/einschmidt/hassio-addons`

注意：最近的 Caddy-2 更新（v2.0）将配置路径更改为 `/addon_configs/c80c7555_caddy-2`。如果您之前运行的是 v1.x，请保存该插件的配置，卸载并重新安装，然后替换您的配置，但将目录更改为上述路径。这是因为插件需要重建才能看到新的目录。

还需要设置带有 `https://github.com/porech/caddy-maxmind-geolocation` 的自定义 Caddy 二进制文件。请使用我的 `Caddy Builder` 插件来制作一个。

必须在 maxmind.com 上设置许可证密钥。

_感谢所有给我仓库加星的朋友！要加星请点击下面的图片，然后它会出现在右上角。谢谢！_

[![Stargazers repo roster for @jdeath/homeassistant-addons](https://reporoster.com/stars/jdeath/homeassistant-addons)](https://github.com/jdeath/homeassistant-addons/stargazers)

## 关于

Docker 镜像通过环境变量进行配置。以下变量是必需的：

* `GEOIPUPDATE_EDITION_IDS` - 空格分隔的数据库版本 ID 列表。
  版本 ID 可以由字母、数字和短划线组成。默认为 "GeoLite2-ASN GeoLite2-City GeoLite2-Country"。

* `GEOIPUPDATE_ACCOUNT_ID` - 您的 MaxMind 账户 ID（不是用户名）。

* `GEOIPUPDATE_LICENSE_KEY` - 您的区分大小写的 MaxMind 许可证密钥（不是密码）。

* `GEOIPUPDATE_FREQUENCY` - `geoipupdate` 运行之间的小时数。
  如果未设置或设置为 `0`，`geoipupdate` 将运行一次并退出。

* `GEOIPUPDATE_DB_DIR` - geoipupdate 将下载数据库的目录。默认为 `/addon_configs/c80c7555_caddy-2`，以与新的 caddy-2 插件保持一致。
  
[repository]: https://github.com/jdeath/homeassistant-addons

## 使用方法
制作一个自定义的 Caddy 构建，包含 `--with github.com/porech/caddy-maxmind-geolocation`，并将其放置在 `/share/caddy/`（v1.x）中，文件名为 `caddy`，或放置在 `/addon_configs/c80c7555_caddy-2`（v2.0）中。

编辑 `/share/caddy/Caddyfile`

添加一个 GEOFilter 块以允许某些国家和您的本地 IP 地址。我在网上找到了这个，所以如果需要帮助，请在 Caddyforums 上询问。

```
(GEOFILTER) {
        @geofilter {
                not maxmind_geolocation {
                        db_path "/share/caddy/GeoLite2-Country.mmdb"
                        allow_countries IT FR
                }
                not remote_ip private_ranges
        }
        respond @geofilter 403
}
```

然后在任何 `reverse_proxy` 指令之前添加这一行
```
import GEOFILTER