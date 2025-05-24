## 配置

请查看 Tandoor Recipes 文档: https://docs.tandoor.dev/install/docker/

```yaml
必需项 :
    "ALLOWED_HOSTS": "你的系统 URL", # 你需要输入你的 homeassistant URLs（用逗号分隔，无空格），以允许访问
    "DB_TYPE": "list(sqlite|postgresql_external)" # 要使用的数据库类型。
    "SECRET_KEY": "str", # 你的密钥
    "PORT": 9928 # 默认情况下，webui 可在 http://HAurl:9928 上使用。如果需要更改端口，应该只通过此选项进行，而不是在应用程序内进行
    "Environment": 0|1 # 1 是调试模式，0 是正常模式。除非积极开发，否则应该在正常模式下运行。
    "GUNICORN_MEDIA": 0|1 # 1 启用 gunicorn 媒体托管。这不推荐。你应该使用 nginx 服务器来托管你的媒体 - 见文档。
可选项 :
    "POSTGRES_HOST": "str?", # 对于 postgresql_external 是必需的
    "POSTGRES_PORT": "str?", # 对于 postgresql_external 是必需的
    "POSTGRES_USER": "str?", # 对于 postgresql_external 是必需的
    "POSTGRES_PASSWORD": "str?", # 对于 postgresql_external 是必需的
    "POSTGRES_DB": "str?" # 对于 postgresql_external 是必需的
    "externalfiles_folder": "str?" # 你想要映射到 tandoor 的文件夹。不是必需的，因为 /share/ 和 /media/ 已映射。如果该文件夹不存在，则会创建该文件夹。
```
### Mariadb
Mariadb 是 home assistant 社区中一个流行的插件，但它不被 Tandoor Recipes 应用程序支持。

### 调试模式
这是 "Environment" 设置。
0 是正常模式  
1 是调试模式。

### 认证
使用外部认证。 Tandoor Recipes 支持此功能，但尚未实现。

### Gunicorn 媒体
禁用 gunicorn 媒体是个好主意，但需要有一个 web 服务器运行来托管媒体文件。 web 服务器应该映射 `/media/`。  
有关更多信息，请查看 https://docs.tandoor.dev/install/docker/#nginx-vs-gunicorn。  
0 是禁用 gunicorn - 没有 nginx web 服务器媒体将无法工作。  
1 是启用 gunicorn - 媒体将通过 gunicorn 托管，这不推荐。

### 外部食谱文件

目录 `/config/addons_config/tandoor_recipes/externalfiles` 可用于将外部文件导入到 Tandoor。你可以在 Docker 中将其映射到 /opt/recipes/externalfiles。根据这里的说明： https://docs.tandoor.dev/features/external_recipes/
目录 `/config`、`/media/` 和 `/share/` 已映射到插件中。你可以在这些位置中的任何一个手动创建文件夹并将其映射到 tandoor：
- 在你想要的位置创建一个目录，例如 `/share/tandoor/recipebook/`
- 在 tandoor 中创建一个外部存储位置 - `/share/tandoor/`
- 观察特定文件夹 - `/share/tandoor/recipebook/`
- 现在同步
- 导入。