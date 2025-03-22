## 配置

请查看 Tandoor Recipes 文档：https://docs.tandoor.dev/install/docker/

```yaml
必需项 :
    "ALLOWED_HOSTS": "你的系统 URL", # 你需要输入你的 homeassistant URLs（以逗号分隔，不带空格），以便允许进站流量
    "DB_TYPE": "list(sqlite|postgresql_external)" # 要使用的数据库类型。
    "SECRET_KEY": "str", # 你的密钥
    "PORT": 9928 # 默认情况下，webui 在 http://HAurl:9928 可用。如果需要更改端口，应该通过此选项进行，而不是在应用程序内进行更改。
    "Environment": 0|1 # 1 为调试模式，0 为正常模式。除非在积极开发中，应该在正常模式下运行。
    "GUNICORN_MEDIA": 0|1 # 1 启用 gunicorn 媒体托管。这不推荐使用。你应该使用 nginx 服务器来托管你的媒体 - 参见文档。
可选项 :
    "POSTGRES_HOST": "str?", # 针对 postgresql_external 所需
    "POSTGRES_PORT": "str?", # 针对 postgresql_external 所需
    "POSTGRES_USER": "str?", # 针对 postgresql_external 所需
    "POSTGRES_PASSWORD": "str?", # 针对 postgresql_external 所需
    "POSTGRES_DB": "str?" # 针对 postgresql_external 所需
    "externalfiles_folder": "str?" # 你想要映射到 tandoor 的文件夹。不需要，因为 /share/ 和 /media/ 已被映射。如果该文件夹不存在，将会被创建。
```
### MariaDB
MariaDB 是 home assistant 社区中的一个流行插件，但 Tandoor Recipes 应用程序不支持它。

### 调试模式
这是 "Environment" 设置。
0 为正常模式  
1 为调试模式。

### 身份验证
使用外部身份验证。Tandoor Recipes 支持此功能，但尚未实现。

### Gunicorn 媒体
禁用 gunicorn 媒体是个好主意，但需要运行一个 Web 服务器来托管媒体文件。Web 服务器应该映射 `/media/`。  
有关更多信息，请参见 https://docs.tandoor.dev/install/docker/#nginx-vs-gunicorn。  
0 为 gunicorn 被禁用 - 媒体在没有 nginx Web 服务器的情况下无法工作。  
1 为 gunicorn 被启用 - 媒体将通过 gunicorn 托管，但这并不推荐。

### 外部食谱文件

目录 `/config/addons_config/tandoor_recipes/externalfiles` 可用于将外部文件导入到 Tandoor。你可以在 Docker 中将其映射到 /opt/recipes/externalfiles。按照此处的说明进行操作：https://docs.tandoor.dev/features/external_recipes/
`/config`、`/media/` 和 `/share/` 目录已经映射到插件中。你可以在这些位置中的任何一个手动创建一个文件夹并将其映射到 tandoor：
- 在你想要的位置创建一个目录，例如 `/share/tandoor/recipebook/`
- 在 tandoor 中创建一个外部存储位置 - `/share/tandoor/`
- 观察特定文件夹 - `/share/tandoor/recipebook/`
- 立即同步
- 导入。