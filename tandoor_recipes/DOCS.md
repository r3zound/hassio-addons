## 配置

请查看 Tandoor Recipes 文档 : https://docs.tandoor.dev/install/docker/

```yaml
必需项：
    "ALLOWED_HOSTS": "你的系统 URL", # 你需要输入你的 homeassistant URLs（用逗号分隔，无需空格），以允许访问
    "DB_TYPE": "list(sqlite|postgresql_external)" # 要使用的数据库类型。
    "SECRET_KEY": "字符串", # 你的密钥
    "PORT": 9928 # 默认情况下，webui 可在 http://HAurl:9928 上访问。如果你需要更改端口，应该只通过此选项进行更改，而不是在应用程序中更改
    "Environment": 0|1 # 1 为调试模式，0 为正常模式。除非在积极开发，否则应以正常模式运行。
    "GUNICORN_MEDIA": 0|1 # 1 启用 gunicorn 媒体托管。这不推荐。你应该使用 nginx 服务器来托管你的媒体 - 参见文档。
可选项：
    "POSTGRES_HOST": "字符串?", # 需要用于 postgresql_external
    "POSTGRES_PORT": "字符串?", # 需要用于 postgresql_external
    "POSTGRES_USER": "字符串?", # 需要用于 postgresql_external
    "POSTGRES_PASSWORD": "字符串?", # 需要用于 postgresql_external
    "POSTGRES_DB": "字符串?" # 需要用于 postgresql_external
    "externalfiles_folder": "字符串?" # 你希望映射到 tandoor 的文件夹。不需要映射，因为 /share/ 和 /media/ 已经映射。如果该文件夹不存在，则会创建该文件夹。
```
### Mariadb
Mariadb 是在 home assistant 社区中一个受欢迎的插件，但它不被 Tandoor Recipes 应用程序支持。

### 调试模式
这是 "Environment" 设置。
0 为正常模式  
1 为调试模式。

### 认证
使用外部认证。Tandoor Recipes 支持此功能，但尚未实现。

### Gunicorn 媒体
禁用 gunicorn 媒体是个好主意，但需要一个 web 服务器来托管媒体文件。该 web 服务器应该映射 `/media/`。  
更多信息请参见 https://docs.tandoor.dev/install/docker/#nginx-vs-gunicorn。  
0 表示 gunicorn 禁用 - 媒体在没有 nginx web 服务器的情况下将无法工作。  
1 表示 gunicorn 启用 - 媒体将使用 gunicorn 托管，但这不推荐。

### 外部食谱文件

目录 `/config/addons_config/tandoor_recipes/externalfiles` 可用于将外部文件导入到 Tandoor。你可以在 Docker 中将其映射到 /opt/recipes/externalfiles。根据这里的说明： https://docs.tandoor.dev/features/external_recipes/
目录 `/config`、`/media/` 和 `/share/` 已映射到插件。你可以在这些位置中的任何一个手动创建一个文件夹并映射到 tandoor：
- 在你想要的位置创建一个目录，例如 `/share/tandoor/recipebook/`
- 在 tandoor 中创建一个外部存储位置 - `/share/tandoor/`
- 监视特定文件夹 - `/share/tandoor/recipebook/`
- 立即同步
- 导入。