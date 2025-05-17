# Apache2 Webserver 附加组件 for Home Assistant OS
![支持 aarch64 架构][aarch64-shield] ![支持 amd64 架构][amd64-shield] ![支持 armhf 架构][armhf-shield] ![支持 armv7 架构][armv7-shield] ![支持 i386 架构][i386-shield]
![项目维护][maintenance-shield]

![Ingress 支持](../_images/apache2/ingress.png)

这是一个轻量级的 Apache2 Webserver 附加组件，适用于 Home Assistant OS，支持可选的 PHP 8 和 MariaDB。

此附加组件允许您托管静态或动态网站，运行基于 PHP 的应用程序，或通过 Web 界面公开内部服务。根据不同需求和使用场景，提供多个版本。

---

## 📋 目录

- [关于](#关于)
- [版本](#版本)
- [安装](#安装)
- [配置](#配置)
- [认证](#认证)
- [Ingress](#ingress)
- [MariaDB 使用](#mariadb-使用)
- [限制](#限制)
- [支持](#支持)
- [许可证](#许可证)

---

## 📖 关于

此附加组件为 Home Assistant OS 提供 [Apache HTTP Server](https://httpd.apache.org/)。它支持：

- 托管静态 HTML/CSS/JS 网站
- 运行 PHP 应用程序 (例如：仪表板、工具)
- 可选的 MariaDB 集成 (例如：用于 WordPress、phpMyAdmin)

Apache HTTP Server 是一个由 Apache 软件基金会维护的开源 Web 服务器软件。

---

## 🧰 版本

| 版本 | 特性 |
|------|------|
| [完整](https://github.com/FaserF/hassio-addons/tree/master/apache2) | Apache2、PHP 8.4（带常用扩展）、MariaDB 客户端、ffmpeg、Mosquitto |
| [最小](https://github.com/FaserF/hassio-addons/tree/master/apache2-minimal) | 仅 Apache2 |
| [最小 + MariaDB](https://github.com/FaserF/hassio-addons/tree/master/apache2-minimal-mariadb) | Apache2、MariaDB 客户端、带基础模块的 PHP |

---

## 🚀 安装

1. 将仓库添加到 Home Assistant：
   [![添加仓库](https://my.home-assistant.io/badges/supervisor_add_addon_repository.svg)](https://my.home-assistant.io/redirect/supervisor_add_addon_repository/?repository_url=https%3A%2F%2Fgithub.com%2FFaserF%2Fhassio-addons)

2. 通过 Supervisor 安装 `Apache2` 附加组件。

3. 将您的网站文件放入 document_root（默认：`/share/htdocs`）。
   示例：`/share/htdocs/index.html`

4. 启动附加组件，并通过 Ingress 或外部端口访问您的网站。

---

## ⚙️ 配置

```yaml
document_root: /share/htdocs               # 必填
php_ini: default                           # "default"、"get_file" 或路径
default_conf: default                      # Apache 默认配置
default_ssl_conf: default                  # Apache SSL 配置
website_name: mydomain.local               # 如果 ssl 为 true 则必填
username: apache                           # 可选，改变文件所有权
password: mySecretPassword                 # 可选，供内部文件访问使用
ssl: true                                  # 启用 HTTPS
certfile: fullchain.pem                    # 如果 ssl 为 true，必填
keyfile: privkey.pem                       # 如果 ssl 为 true，必填
init_commands:                             # 可选启动命令
  - apk add imagemagick
```

您可以使用 `get_file` 从 `/share` 提取自己的配置文件和 PHP.ini。

### 选项：`document_root`

此选项是必需的。根据您的 Home Assistant 安装中的根网页文件夹位置进行更改。

注意：必须位于 /share 或 /media 文件夹中！其他文件夹对该附加组件不可见。

### 选项：`php_ini`

您可以选择以下选项：

default → 使用内置的 PHP 8.4 配置文件（推荐）

get_file → 将默认 PHP 8.4 的 `php.ini` 复制到 `/share/apache2addon_php.ini`

path/to/your/new/php.ini -> 请根据您的自定义 php.ini 文件的位置更改此位置，例如：/share/apache2/php.ini

### 选项：`default_conf` & `default_ssl_conf`

您可以选择以下选项：

default -> 使用默认的 Apache2 附加文件

get_config -> 获取默认 Apache2 附加配置文件的副本到您的 /share 文件夹。

path/to/your/new/apache2.conf -> 请根据您的自定义 000-default.conf / 000-default-le-ssl.conf 文件的位置更改此位置，例如：/share/apache2/000-default.conf <br />
更多信息： <https://cwiki.apache.org/confluence/display/HTTPD/ExampleVhosts><br /> <br />
请注意，如果您使用自定义的 Apache2 配置文件并收到任何 Apache2 错误，我将不提供任何支持！

### 选项：`website_name`

如果您启用 ssl 为 true，则需要此选项。如果您不使用 SSL，可以随便填写，因为不重要。

### 选项：`username`

此选项为可选。此用户用于访问 Web 文件（而不是网站本身）。它将所有 Web 文件的所有者从 "root" 更改为该新所有者。

此选项不用于网站的认证。如果您想要有关此内容，请查看 [网站认证](#网站认证)

### 选项：`password`

此选项为可选。有些自托管网站需要认证密码才能访问 Docker 镜像中的文件。 #50

此选项不用于网站的认证。如果您想要有关此内容，请查看 [网站认证](#网站认证)

### 选项：`ssl`

启用/禁用 Web 界面的 SSL（HTTPS）。

如果您需要自签名证书，可以查看我的 openssl 附加组件： <https://github.com/FaserF/hassio-addons/tree/master/openssl>

**注意**：_文件必须存储在 `/ssl/` 中，这是默认设置_

### 选项：`init_commands`

此选项为可选。如果您需要一些特殊的包或命令，可以使用此选项来安装/使用它们。 #124

如果您遇到任何问题，请在提交错误报告之前移除此选项！

### 配置示例

推荐的示例附加组件配置：

```yaml
document_root: /share/htdocs
php_ini: default
default_conf: default
default_ssl_conf: default
website_name: mywebsite.com
ssl: true
certfile: fullchain.pem
keyfile: privkey.pem
```

---

## 🔐 认证

`username` 和 `password` 字段用于保护 `/share/apache` 目录中的文件（例如配置或日志）。它们**不**用于实际托管的网页。

要保护 Web 内容，请使用 `.htaccess` 和 `.htpasswd` 文件。

### 示例：创建 `.htpasswd`

```bash
htpasswd -c /share/htdocs/.htpasswd myuser
```

然后在您的 `.htaccess` 文件中这样引用：

```
AuthType Basic
AuthName "受限内容"
AuthUserFile /share/htdocs/.htpasswd
Require valid-user
```

---

## 🧩 Ingress

此附加组件支持 Ingress（通过 Home Assistant UI 访问）。但请注意：

- 基本 HTML 页面工作良好。
- 复杂的应用程序使用完整的认证、重定向链或 WebSockets 可能在 Ingress 中表现不佳。
- 为了最佳兼容性，建议通过本地 IP 和暴露的端口进行访问。

---

## 🐬 MariaDB 使用

如果您想将 PHP 应用程序（例如 WordPress 或 phpMyAdmin）连接到官方 MariaDB 附加组件：

- 使用 `core-mariadb` 作为主机名。
- 端口：`3306`
- 用户名/密码：使用 Home Assistant MariaDB 凭据
- 数据库名称：`homeassistant`（默认）

PHP 中的示例配置：

```php
$mysqli = new mysqli("core-mariadb", "user", "pass", "homeassistant");
```

---

## ⚠️ 限制

- ✅ 仅在 amd64 上测试（其他架构可能有效，但未测试）
- ⚠️ PHP 支持仅在 **完整** 版本中
- 🔒 SSL 需要有效的证书在 `/ssl/` 中
- 🌐 不建议在没有额外加固的情况下直接暴露于互联网
- 🧩 WordPress 兼容性有限 — 请考虑 [专用 WordPress 附加组件](https://github.com/FaserF/hassio-addons/pull/202)

---

## 🙋 支持

如果遇到问题或有功能请求，请在 GitHub 上提交 issue：
👉 [GitHub Issues](https://github.com/FaserF/hassio-addons/issues)

---

## 📝 许可证

此项目依据 MIT 许可证进行许可。

特此免费授权任何获得本软件及相关文档文件（“软件”）的人，可以在不受限制的条件下使用、复制、修改、合并、出版、分发、再许可及/或出售该软件的副本，并允许向其提供软件的人这样做，但须遵循以下条件：

上述版权声明和本许可声明应包含在所有副本或实质性部分中。

软件是按“原样”提供的，未附加任何形式的保证，明示或暗示，包括但不限于对适销性、特定用途适用性和非侵权的保证。在任何情况下，作者或版权持有人对因软件或其使用或其他交易而导致的任何索赔、损害或其他责任不承担任何责任，无论是合同诉讼、侵权或其他诉讼。

[maintenance-shield]: https://img.shields.io/maintenance/yes/2025.svg
[aarch64-shield]: https://img.shields.io/badge/aarch64-yes-green.svg
[amd64-shield]: https://img.shields.io/badge/amd64-yes-green.svg
[armhf-shield]: https://img.shields.io/badge/armhf-yes-green.svg
[armv7-shield]: https://img.shields.io/badge/armv7-yes-green.svg
[i386-shield]: https://img.shields.io/badge/i386-yes-green.svg