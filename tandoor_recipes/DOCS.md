## 配置

请查看 Tandoor Recipes 文档 : https://docs.tandoor.dev/install/docker/

```yaml
必需 :
    "ALLOWED_HOSTS": "你的系统网址", # 你需要输入你的 homeassistant URLs（用逗号分隔，不带空格）以允许入口工作
    "DB_TYPE": "list(sqlite|postgresql_external)" # 要使用的数据库类型。
    "SECRET_KEY": "str", # 你的密钥
    "PORT": 9928 # 默认情况下，webui 可在 http://HAurl:9928 上访问。如果你需要更改端口，应该通过此选项而非应用程序进行更改
    "Environment": 0|1 # 1 是调试模式，0 是正常模式。除非积极开发，否则应在正常模式下运行。
    "GUNICORN_MEDIA": 0|1 # 1 启用 gunicorn 媒体托管。此选项不推荐。你应该使用 nginx 服务器来托管你的媒体 - 请查看文档。
可选 :
    "POSTGRES_HOST": "str?", # postgresql_external 所需
    "POSTGRES_PORT": "str?", # postgresql_external 所需
    "POSTGRES_USER": "str?", # postgresql_external 所需
    "POSTGRES_PASSWORD": "str?", # postgresql_external 所需
    "POSTGRES_DB": "str?" # postgresql_external 所需
    "externalfiles_folder": "str?" # 你想映射到 tandoor 的文件夹。不需要，因为 /share/ 和 /media/ 已经映射。如果该文件夹不存在，将会创建。
```
### Mariadb
Mariadb 是 home assistant 社区中的一个流行插件，但 Tandoor Recipes 应用程序不支持它。

### 调试模式
这是 "Environment" 设置。
0 是正常模式  
1 是调试模式。

### 认证
使用外部认证。Tandoor Recipes 支持这个，但还未实现。

### Gunicorn 媒体
禁用 gunicorn 媒体是个好主意，但需要运行一个 web 服务器来托管媒体文件。web 服务器应该映射 `/media/`。  
有关更多信息，请参阅 https://docs.tandoor.dev/install/docker/#nginx-vs-gunicorn 。  
0 是 gunicorn 禁用 - 媒体在没有 nginx web 服务器的情况下无法工作。  
1 是 gunicorn 启用 - 媒体将通过 gunicorn 托管，但不推荐这样。

### 外部食谱文件

目录 `/config/addons_config/tandoor_recipes/externalfiles` 可用于将外部文件导入 Tandoor。你可以在 Docker 中将它映射到 /opt/recipes/externalfiles。根据此处的说明： https://docs.tandoor.dev/features/external_recipes/
目录 `/config`、`/media/` 和 `/share/` 已映射到该插件。你可以在这些位置中的任何一个手动创建一个文件夹并映射到 tandoor：
- 在你想要的位置创建一个目录，例如 `/share/tandoor/recipebook/`
- 在 tandoor 中创建一个外部存储位置 - `/share/tandoor/`
- 监视特定文件夹 - `/share/tandoor/recipebook/`
- 立即同步
- 导入。