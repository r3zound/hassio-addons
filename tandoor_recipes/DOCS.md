## 配置

请查看 Tandoor Recipes 文档: https://docs.tandoor.dev/install/docker/

```yaml
必需项：
    "ALLOWED_HOSTS": "你的系统网址", # 你需要输入你的 Home Assistant URL（用逗号分隔，不加空格），以允许入口正常工作
    "DB_TYPE": "list(sqlite|postgresql_external)" # 使用的数据库类型。
    "SECRET_KEY": "字符串", # 你的密钥
    "PORT": 9928 # 默认情况下，webui 在 http://HAurl:9928 上可用。如果你需要更改端口，则应仅通过此选项进行更改，而非在应用内更改
    "Environment": 0|1 # 1 为调试模式，0 为正常模式。除非在积极开发中，否则应在正常模式下运行。
    "GUNICORN_MEDIA": 0|1 # 1 启用 gunicorn 媒体托管。这不是推荐的方式。你应使用 nginx 服务器来托管你的媒体 - 详见文档。
可选项：
    "POSTGRES_HOST": "字符串?", # postgresql_external 所需
    "POSTGRES_PORT": "字符串?", # postgresql_external 所需
    "POSTGRES_USER": "字符串?", # postgresql_external 所需
    "POSTGRES_PASSWORD": "字符串?", # postgresql_external 所需
    "POSTGRES_DB": "字符串?" # postgresql_external 所需
    "externalfiles_folder": "字符串?" # 你想要映射到 Tandoor 的文件夹。不需要，因为 /share/ 和 /media/ 已经映射。若该文件夹不存在，将被创建。
```
### Mariadb
Mariadb 是 Home Assistant 社区中一个流行的插件，但 Tandoor Recipes 应用程序不支持它。

### 调试模式
这是 "环境" 设置。
0 是正常模式  
1 是调试模式。

### 身份验证
使用外部身份验证。Tandoor Recipes 支持此功能，但尚未实现。

### Gunicorn 媒体
禁用 gunicorn 媒体是个好主意，但需要一个 web 服务器来托管媒体文件。该 web 服务器应映射 `/media/`。  
有关更多信息，请参见 https://docs.tandoor.dev/install/docker/#nginx-vs-gunicorn。  
0 表示 gunicorn 禁用 - 如果没有 nginx web 服务器，媒体将无法工作。  
1 表示 gunicorn 启用 - 媒体将通过 gunicorn 托管，这不推荐。

### 外部食谱文件

目录 `/config/addons_config/tandoor_recipes/externalfiles` 可用于将外部文件导入 Tandoor。你可以在 Docker 中将其映射到 /opt/recipes/externalfiles。根据这里的说明：https://docs.tandoor.dev/features/external_recipes/
目录 `/config`、`/media/` 和 `/share/` 已映射到该插件中。你可以在这些位置中的任何一个手动创建一个文件夹并将其映射到 Tandoor：
- 在你想要的位置创建一个目录，例如 `/share/tandoor/recipebook/`
- 在 Tandoor 中创建一个外部存储位置 - `/share/tandoor/`
- 观察特定文件夹 - `/share/tandoor/recipebook/`
- 立即同步
- 导入。