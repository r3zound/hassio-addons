## &#9888; 打开问题 : [🐛 [Mealie] 个人资料图片在入口中不显示 (已开启 2025-01-11)](https://github.com/alexbelgium/hassio-addons/issues/1714) by [@IceBotYT](https://github.com/IceBotYT)
## &#9888; 打开请求 : [✨ [请求] Mealie - 添加 OpenAI 支持 (已开启 2025-03-05)](https://github.com/alexbelgium/hassio-addons/issues/1802) by [@tillmannschatz](https://github.com/tillmannschatz)
# Hass.io 附加组件：Mealie

[![捐赠][donation-badge]](https://www.buymeacoffee.com/alexbelgium)
[![捐赠][paypal-badge]](https://www.paypal.com/donate/?hosted_button_id=DZFULJZTP3UQA)

![版本](https://img.shields.io/badge/dynamic/json?label=Version&query=%24.version&url=https%3A%2F%2Fraw.githubusercontent.com%2Falexbelgium%2Fhassio-addons%2Fmaster%2Fmealie%2Fconfig.json)
![入口](https://img.shields.io/badge/dynamic/json?label=Ingress&query=%24.ingress&url=https%3A%2F%2Fraw.githubusercontent.com%2Falexbelgium%2Fhassio-addons%2Fmaster%2Fmealie%2Fconfig.json)
![架构](https://img.shields.io/badge/dynamic/json?color=success&label=Arch&query=%24.arch&url=https%3A%2F%2Fraw.githubusercontent.com%2Falexbelgium%2Fhassio-addons%2Fmaster%2Fmealie%2Fconfig.json)

[![Codacy 徽章](https://app.codacy.com/project/badge/Grade/9c6cf10bdbba45ecb202d7f579b5be0e)](https://www.codacy.com/gh/alexbelgium/hassio-addons/dashboard?utm_source=github.com&utm_medium=referral&utm_content=alexbelgium/hassio-addons&utm_campaign=Badge_Grade)
[![GitHub Super-Linter](https://img.shields.io/github/actions/workflow/status/alexbelgium/hassio-addons/weekly-supelinter.yaml?label=Lint%20code%20base)](https://github.com/alexbelgium/hassio-addons/actions/workflows/weekly-supelinter.yaml)
[![构建器](https://img.shields.io/github/actions/workflow/status/alexbelgium/hassio-addons/onpush_builder.yaml?label=Builder)](https://github.com/alexbelgium/hassio-addons/actions/workflows/onpush_builder.yaml)

[donation-badge]: https://img.shields.io/badge/Buy%20me%20a%20coffee%20(no%20paypal)-%23d32f2f?logo=buy-me-a-coffee&style=flat&logoColor=white
[paypal-badge]: https://img.shields.io/badge/Buy%20me%20a%20coffee%20with%20Paypal-0070BA?logo=paypal&style=flat&logoColor=white

警告 : armv7 仅支持到版本 0.4.3！后续版本不会更新

_感谢所有关注我的仓库的人！要关注它，请点击下面的图片，然后它将在右上角。谢谢！_

[![@alexbelgium/hassio-addons 的星标者名单](https://raw.githubusercontent.com/alexbelgium/hassio-addons/master/.github/stars2.svg)](https://github.com/alexbelgium/hassio-addons/stargazers)

![下载演变](https://raw.githubusercontent.com/alexbelgium/hassio-addons/master/mealie/stats.png)

## 关于

Mealie 是一个自托管的食谱管理器和餐饮计划工具，具有 RestAPI 后端和一个基于 Vue 的响应式前端应用程序，为整个家庭提供愉快的用户体验。
此 Mealie 1.0 的附加组件基于来自 hendrix04 的组合 [docker 镜像](https://hub.docker.com/r/hendrix04/mealie-combined)。
此附加组件基于来自 hay-kot 的 [docker 镜像](https://hub.docker.com/r/hkotel/mealie)。

## 配置

- 启动附加组件。等一段时间并检查日志以查看是否存在错误。
- 打开 yourdomain.com:9090 (其中 ":9090" 是在附加组件中配置的端口)。
- 默认
  - 用户名：changeme@example.com
  - 密码：MyPassword

选项可以通过两种方式配置：

- 附加组件选项

```yaml
    "BASE_URL": 可选，外部基本网址
    "PGID": 用户 ID
    "PUID": "组 ID
    "certfile": fullchain.pem #ssl 证书，必须位于 /ssl 中
    "keyfile": privkey.pem #sslkeyfile，必须位于 /ssl 中
    "ssl": ssl: true/false
    "ALLOW_SIGNUP": 允许用户注册
```

- Config.yaml
  可以使用位于 /homeassistant/addons_config/xxx-mealie/config.yaml 中的 config.yaml 文件配置其他选项。

完整的选项列表可以在这里查看 : https://nightly.mealie.io/documentation/getting-started/installation/backend-config/

## 与 HA 集成

### 详细信息 (感谢 @michelangelonz)

创建一个 RESTful 传感器

```yaml
sensor:
  - platform: rest
    resource: "http://###.###.#.#:9090/api/groups/mealplans/today"
    method: GET
    name: Mealie 今天的餐食
    headers:
      Authorization: Bearer <put  auth here>
    value_template: "{{ value_json.value }}"
    json_attributes_path: $..recipe
    json_attributes:
      - name
      - id
      - totalTime
      - prepTime
      - performTime
      - description
      - slug
```

从属性中创建模板传感器

```yaml
- name: 今天的晚餐
  unique_id: sensor.TodaysDinner
  state: "{{ state_attr('sensor.mealie_todays_meal', 'name') }}"
- name: 今天的晚餐描述
  unique_id: sensor.DinnerDescription
  state: "{{ state_attr('sensor.mealie_todays_meal', 'description') }}"
- name: 今天的晚餐别名
  unique_id: sensor.DinnerSlug
  state: "{{ state_attr('sensor.mealie_todays_meal', 'slug') }}"
- name: 今天的晚餐ID
  unique_id: sensor.DinnerID
  state: "{{ state_attr('sensor.mealie_todays_meal', 'id') }}"
```

添加一个通用相机以获取图像
http://###.###.#.#:9090/api/media/recipes/{{ state_attr('sensor.mealie_todays_meal', 'id') }}/images/min-original.webp

### 全球信息

阅读此处 : https://hay-kot.github.io/mealie/documentation/community-guide/home-assistant/

## 安装

安装该附加组件非常简单，与安装其他 Hass.io 附加组件没有什么不同。

1. [将我的 Hass.io 附加组件库][repository] 添加到您的 Hass.io 实例。
1. 安装此附加组件。
1. 点击 `保存` 按钮以保存您的配置。
1. 启动附加组件。
1. 检查附加组件的日志以查看一切是否顺利。
1. 小心地根据您的偏好配置附加组件，详细信息请参见官方文档。

## 支持

如果您在安装过程中遇到问题，请确保查看 github。

[repository]: https://github.com/alexbelgium/hassio-addons