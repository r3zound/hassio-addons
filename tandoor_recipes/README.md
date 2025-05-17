# Hass.io 附加组件：Tandoor 食谱

[![捐款][donation-badge]](https://www.buymeacoffee.com/alexbelgium)
[![捐款][paypal-badge]](https://www.paypal.com/donate/?hosted_button_id=DZFULJZTP3UQA)

![版本](https://img.shields.io/badge/dynamic/json?label=版本&query=%24.version&url=https%3A%2F%2Fraw.githubusercontent.com%2Falexbelgium%2Fhassio-addons%2Fmaster%2Ftandoor_recipes%2Fconfig.json)
![入口](https://img.shields.io/badge/dynamic/json?label=入口&query=%24.ingress&url=https%3A%2F%2Fraw.githubusercontent.com%2Falexbelgium%2Fhassio-addons%2Fmaster%2Ftandoor_recipes%2Fconfig.json)
![架构](https://img.shields.io/badge/dynamic/json?color=success&label=架构&query=%24.arch&url=https%3A%2F%2Fraw.githubusercontent.com%2Falexbelgium%2Fhassio-addons%2Fmaster%2Ftandoor_recipes%2Fconfig.json)

[![Codacy 徽章](https://app.codacy.com/project/badge/Grade/9c6cf10bdbba45ecb202d7f579b5be0e)](https://www.codacy.com/gh/alexbelgium/hassio-addons/dashboard?utm_source=github.com&utm_medium=referral&utm_content=alexbelgium/hassio-addons&utm_campaign=Badge_Grade)
[![GitHub Super-Linter](https://img.shields.io/github/actions/workflow/status/alexbelgium/hassio-addons/weekly-supelinter.yaml?label=Lint%20代码%20库)](https://github.com/alexbelgium/hassio-addons/actions/workflows/weekly-supelinter.yaml)
[![构建器](https://img.shields.io/github/actions/workflow/status/alexbelgium/hassio-addons/onpush_builder.yaml?label=构建器)](https://github.com/alexbelgium/hassio-addons/actions/workflows/onpush_builder.yaml)

[donation-badge]: https://img.shields.io/badge/请%20给我一杯%20咖啡%20(无%20paypal)-%23d32f2f?logo=buy-me-a-coffee&style=flat&logoColor=white
[paypal-badge]: https://img.shields.io/badge/请%20通过%20Paypal%20给我一杯%20咖啡-0070BA?logo=paypal&style=flat&logoColor=white

_感谢所有给我的代码库打星的人！要打星，请点击下方图像，然后它将位于右上角。谢谢！_

[![@alexbelgium/hassio-addons 的星标者名单](https://raw.githubusercontent.com/alexbelgium/hassio-addons/master/.github/stars2.svg)](https://github.com/alexbelgium/hassio-addons/stargazers)

![下载演变](https://raw.githubusercontent.com/alexbelgium/hassio-addons/master/tandoor_recipes/stats.png)

## 关于

[Tandoor 食谱](https://github.com/TandoorRecipes/recipes)，由 [vabene1111](https://github.com/vabene1111) 制作，旨在为有一系列食谱的人提供一个与家人和朋友分享或简单地以良好组织的方式存储食谱的地方。存在一个基本的权限系统，但该应用程序不打算作为公共页面运行。

## 配置

入口添加： https://community.home-assistant.io/t/ingress-access-for-tandoor-recipes/717859

请查看 Tandoor Recipes 文档： https://docs.tandoor.dev/install/docker/

```yaml
必需：
    "ALLOWED_HOSTS": "你的系统网址", # 你需要输入你的homeassistant网址（用逗号分隔，无空格），以便允许入口工作
    "DB_TYPE": "list(sqlite|postgresql_external)" # 使用的数据库类型。
    "SECRET_KEY": "str", # 你的密钥
    "PORT": 9928 # 默认情况下，webui 在 http://HAurl:9928 上可用。如果你需要更改端口，应该通过此选项进行更改，而不是在应用内进行更改
    "环境": 0|1 # 1是调试模式，0是正常模式。除非正在主动开发，否则应以正常模式运行。
可选：
    "POSTGRES_HOST": "str?", # 对于 postgresql_external 需要
    "POSTGRES_PORT": "str?", # 对于 postgresql_external 需要
    "POSTGRES_USER": "str?", # 对于 postgresql_external 需要
    "POSTGRES_PASSWORD": "str?", # 对于 postgresql_external 需要
    "POSTGRES_DB": "str?" # 对于 postgresql_external 需要
```

## 安装

此附加组件的安装非常简单，与安装任何其他 Hass.io 附加组件没有区别。

1. [将我的 Hass.io 附加组件代码库][repository] 添加到你的 Hass.io 实例。
1. 安装此附加组件。
1. 点击 `保存` 按钮以存储你的配置。
1. 启动该附加组件。
1. 检查附加组件的日志以查看是否一切正常。
1. 仔细配置该附加组件以满足你的偏好，查看官方文档以获取更多信息。

## 支持

如果你的安装遇到问题，请务必查看 GitHub。

## 截图

![图像](https://github.com/TandoorRecipes/recipes/raw/develop/docs/preview.png)

[repository]: https://github.com/alexbelgium/hassio-addons

## 外部食谱文件
目录 /config/addons_config/tandoor_recipes/externalfiles 可用于将外部文件导入 Tandoor。你可以在 Docker 中将其映射到 /opt/recipes/externalfiles。
按照此处的说明进行操作： https://docs.tandoor.dev/features/external_recipes/