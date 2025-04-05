# 家庭助手扩展：Joplin

[![Donate][donation-badge]](https://www.buymeacoffee.com/alexbelgium)
[![Donate][paypal-badge]](https://www.paypal.com/donate/?hosted_button_id=DZFULJZTP3UQA)

![版本](https://img.shields.io/badge/dynamic/json?label=Version&query=%24.version&url=https%3A%2F%2Fraw.githubusercontent.com%2Falexbelgium%2Fhassio-addons%2Fmaster%2Fjoplin%2Fconfig.json)
![访问](https://img.shields.io/badge/dynamic/json?label=Ingress&query=%24.ingress&url=https%3A%2F%2Fraw.githubusercontent.com%2Falexbelgium%2Fhassio-addons%2Fmaster%2Fjoplin%2Fconfig.json)
![架构](https://img.shields.io/badge/dynamic/json?color=success&label=Arch&query=%24.arch&url=https%3A%2F%2Fraw.githubusercontent.com%2Falexbelgium%2Fhassio-addons%2Fmaster%2Fjoplin%2Fconfig.json)

[![Codacy Badge](https://app.codacy.com/project/badge/Grade/9c6cf10bdbba45ecb202d7f579b5be0e)](https://www.codacy.com/gh/alexbelgium/hassio-addons/dashboard?utm_source=github.com&utm_medium=referral&utm_content=alexbelgium/hassio-addons&utm_campaign=Badge_Grade)
[![GitHub Super-Linter](https://img.shields.io/github/actions/workflow/status/alexbelgium/hassio-addons/weekly-supelinter.yaml?label=Lint%20code%20base)](https://github.com/alexbelgium/hassio-addons/actions/workflows/weekly-supelinter.yaml)
[![构建器](https://img.shields.io/github/actions/workflow/status/alexbelgium/hassio-addons/onpush_builder.yaml?label=Builder)](https://github.com/alexbelgium/hassio-addons/actions/workflows/onpush_builder.yaml)

[donation-badge]: https://img.shields.io/badge/Buy%20me%20a%20coffee%20(no%20paypal)-%23d32f2f?logo=buy-me-a-coffee&style=flat&logoColor=white
[paypal-badge]: https://img.shields.io/badge/Buy%20me%20a%20coffee%20with%20Paypal-0070BA?logo=paypal&style=flat&logoColor=white

_感谢所有给我的仓库加星的人！要加星，请点击下方图片，然后它会在右上角。谢谢！_

[![Stargazers repo roster for @alexbelgium/hassio-addons](https://raw.githubusercontent.com/alexbelgium/hassio-addons/master/.github/stars2.svg)](https://github.com/alexbelgium/hassio-addons/stargazers)

![下载趋势](https://raw.githubusercontent.com/alexbelgium/hassio-addons/master/joplin/stats.png)

## 关于

Joplin 服务器是一个免费的开源笔记和待办事项同步应用，可以处理组织成笔记本的大量笔记。
通过这个服务器，您可以在所有设备上同步您的所有笔记。

感谢 @poudenes 对开发的支持！

项目主页 : https://github.com/laurent22/joplin

基于 Docker 镜像 : https://hub.docker.com/r/etechonomy/joplin-server

## 安装

此扩展的安装非常简单，与安装任何其他 Hass.io 扩展没有区别。

1. [将我的 Hass.io 扩展库][repository]添加到您的 Hass.io 实例。
2. 安装此扩展。
3. 点击 `保存` 按钮以存储您的配置。
4. 启动扩展。
5. 检查扩展的日志，以确保一切运行良好。
6. 仔细配置扩展以满足您的偏好，请参阅官方文档以获取详细信息。

## 配置

Webui 可在 <http://homeassistant:port> 找到

```yaml
APP_BASE_URL: 这是服务运行的基础公共 URL。例如，如果您希望它从 https://example.com/joplin 运行，则应将 URL 设置为此。基础 URL 可以包含端口。
```

要使用现有的 PostgresSQL 服务器，请在配置中设置以下变量：
确保提供的数据库和用户存在，服务器不会创建它们。

```yaml
DB_CLIENT=pg
POSTGRES_PASSWORD=joplin
POSTGRES_DATABASE=joplin
POSTGRES_USER=joplin
POSTGRES_PORT=5432
POSTGRES_HOST=localhost
```

要使用电子邮件服务，在配置中设置以下变量：

```yaml
1 = true, 0 = false
MAILER_HOST=mail.example.com
MAILER_PORT=995
MAILER_SECURITY=none, tls, starttls
MAILER_AUTH_USER=info@example.com
MAILER_AUTH_PASSWORD=your_password
MAILER_NOREPLY_NAME=from_name
MAILER_NOREPLY_EMAIL=from_email
MAILER_ENABLED=1
```

## 支持

在 GitHub 上创建一个问题

[repository]: https://github.com/alexbelgium/hassio-addons