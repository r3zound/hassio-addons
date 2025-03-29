# Hass.io 插件: Tandoor 食谱

[![捐赠][donation-badge]](https://www.buymeacoffee.com/alexbelgium)
[![捐赠][paypal-badge]](https://www.paypal.com/donate/?hosted_button_id=DZFULJZTP3UQA)

![版本](https://img.shields.io/badge/dynamic/json?label=Version&query=%24.version&url=https%3A%2F%2Fraw.githubusercontent.com%2Falexbelgium%2Fhassio-addons%2Fmaster%2Ftandoor_recipes%2Fconfig.json)
![Ingress](https://img.shields.io/badge/dynamic/json?label=Ingress&query=%24.ingress&url=https%3A%2F%2Fraw.githubusercontent.com%2Falexbelgium%2Fhassio-addons%2Fmaster%2Ftandoor_recipes%2Fconfig.json)
![架构](https://img.shields.io/badge/dynamic/json?color=success&label=Arch&query=%24.arch&url=https%3A%2F%2Fraw.githubusercontent.com%2Falexbelgium%2Fhassio-addons%2Fmaster%2Ftandoor_recipes%2Fconfig.json)

[![Codacy Badge](https://app.codacy.com/project/badge/Grade/9c6cf10bdbba45ecb202d7f579b5be0e)](https://www.codacy.com/gh/alexbelgium/hassio-addons/dashboard?utm_source=github.com&utm_medium=referral&utm_content=alexbelgium/hassio-addons&utm_campaign=Badge_Grade)
[![GitHub Super-Linter](https://img.shields.io/github/actions/workflow/status/alexbelgium/hassio-addons/weekly-supelinter.yaml?label=Lint%20code%20base)](https://github.com/alexbelgium/hassio-addons/actions/workflows/weekly-supelinter.yaml)
[![构建器](https://img.shields.io/github/actions/workflow/status/alexbelgium/hassio-addons/onpush_builder.yaml?label=Builder)](https://github.com/alexbelgium/hassio-addons/actions/workflows/onpush_builder.yaml)

[donation-badge]: https://img.shields.io/badge/Buy%20me%20a%20coffee%20(no%20paypal)-%23d32f2f?logo=buy-me-a-coffee&style=flat&logoColor=white
[paypal-badge]: https://img.shields.io/badge/Buy%20me%20a%20coffee%20with%20Paypal-0070BA?logo=paypal&style=flat&logoColor=white

_感谢所有为我的仓库打星的人！要打星，请点击下面的图片，然后它会出现在右上角。谢谢！_

[![Stargazers repo roster for @alexbelgium/hassio-addons](https://raw.githubusercontent.com/alexbelgium/hassio-addons/master/.github/stars2.svg)](https://github.com/alexbelgium/hassio-addons/stargazers)

![下载演变](https://raw.githubusercontent.com/alexbelgium/hassio-addons/master/tandoor_recipes/stats.png)

## 关于

[Tandoor 食谱](https://github.com/TandoorRecipes/recipes)，由 [vabene1111](https://github.com/vabene1111) 制作，旨在为有一系列食谱希望与家人和朋友分享或仅仅以一种良好组织的方式保存这些食谱的人提供服务。存在基本的权限系统，但此应用程序并不旨在作为公共页面运行。

## 配置

Ingress 附加 : https://community.home-assistant.io/t/ingress-access-for-tandoor-recipes/717859

请查看 Tandoor Recipes 文档 : https://docs.tandoor.dev/install/docker/

```yaml
必需 :
    "ALLOWED_HOSTS": "你的系统网址", # 你需要输入你的 homeassistant URLs（逗号分隔，无空格）以允许 ingress 工作
    "DB_TYPE": "list(sqlite|postgresql_external)" # 要使用的数据库类型。
    "SECRET_KEY": "字符串", # 你的密钥
    "PORT": 9928 # 默认情况下，Web UI 可在 http://HAurl:9928 上访问。如果你需要更改端口，应仅通过此选项进行更改，而不是在应用程序中更改。
    "Environment": 0|1 # 1 是调试模式，0 是正常模式。除非积极开发，否则应在正常模式下运行。
可选 :
    "POSTGRES_HOST": "字符串?", # 对于 postgresql_external 是必需的
    "POSTGRES_PORT": "字符串?", # 对于 postgresql_external 是必需的
    "POSTGRES_USER": "字符串?", # 对于 postgresql_external 是必需的
    "POSTGRES_PASSWORD": "字符串?", # 对于 postgresql_external 是必需的
    "POSTGRES_DB": "字符串?" # 对于 postgresql_external 是必需的
```

## 安装

此插件的安装非常简单，与安装任何其他 Hass.io 插件没有不同。

1. [将我的 Hass.io 插件库][repository] 添加到你的 Hass.io 实例。
1. 安装此插件。
1. 点击 `保存` 按钮以存储你的配置。
1. 启动插件。
1. 检查插件的日志以查看是否一切正常。
1. 根据你的偏好仔细配置插件，查看官方文档以获取更多信息。

## 支持

如果你在安装时遇到问题，请确保查看 GitHub。

## 截图

![图片](https://github.com/TandoorRecipes/recipes/raw/develop/docs/preview.png)

[repository]: https://github.com/alexbelgium/hassio-addons

## 外部食谱文件
目录 /config/addons_config/tandoor_recipes/externalfiles 可用于将外部文件导入到 Tandoor。你可以将其映射到 Docker 中的 /opt/recipes/externalfiles。
请遵循此处的说明: https://docs.tandoor.dev/features/external_recipes/