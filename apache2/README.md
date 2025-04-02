# Home Assistant Community Add-on: Apache2
![支持 aarch64 架构][aarch64-shield] ![支持 amd64 架构][amd64-shield] ![支持 armhf 架构][armhf-shield] ![支持 armv7 架构][armv7-shield] ![支持 i386 架构][i386-shield]
![项目维护][maintenance-shield]

适用于 Homeassistant OS 的 Apache2 Web 服务器

![Ingress 支持](../_images/apache2/ingress.png)

## 关于

Apache HTTP 服务器项目致力于开发和维护一个开源的 HTTP 服务器，以支持现代操作系统，包括 UNIX 和 Windows。该项目的目标是提供一个安全、高效和可扩展的服务器，提供与当前 HTTP 标准同步的 HTTP 服务。<br />
Apache HTTP 服务器（"httpd"）于 1995 年推出，并自 1996 年 4 月以来成为互联网上最受欢迎的 web 服务器。该项目在 2020 年 2 月庆祝了其 25 周年。<br />
Apache HTTP 服务器是 Apache 软件基金会的一个项目。

## 不同版本

### 完整版本
[完整的 Apache2 版本](https://github.com/FaserF/hassio-addons/tree/master/apache2) 包含 MariaDB 和常用的 PHP 8 模块。<br />
此 Docker 镜像包含：apache2 php84-apache2 libxml2-dev apache2-utils apache2-mod-wsgi apache2-ssl mariadb-client ffmpeg<br />
将安装以下 php84 扩展：php84 php84-dev php84-fpm php84-mysqli php84-opcache php84-gd zlib php84-curl php84-phar php84-mbstring php84-zip php84-pdo php84-pdo_mysql php84-iconv php84-dom php84-session php84-intl php84-soap php84-fileinfo php84-xml php84-ctype php84-pecl-xdebug php84-pdo_sqlite php84-tokenizer php84-exif php84-xmlwriter php84-cgi php84-simplexml php84-gd php84-json php84-imap php84-apcu php84-simplexml<br />
Mosquitto & Mosquitto Dev<br />
同时还包含 php 语言环境。

### 最小版本
[最小版本](https://github.com/FaserF/hassio-addons/tree/master/apache2-minimal) 的 Apache2 附加组件，不包含 MariaDB 和任何 PHP 模块。<br />
此 Docker 镜像包含：apache2 libxml2-dev apache2-utils apache2-mod-wsgi apache2-ssl

### 包含 MariaDB 的最小版本
包含 MariaDB 和一些 PHP 模块的 [最小版本](https://github.com/FaserF/hassio-addons/tree/master/apache2-minimal-mariadb) 的 Apache2 附加组件。<br />
此 Docker 镜像包含：apache2 php84-apache2 libxml2-dev apache2-utils apache2-mod-wsgi apache2-ssl mariadb-client<br />
将安装以下 php84 扩展：php84 php84-mysqli php84-opcache php84-curl php84-mbstring php84-zip

## 安装

[![FaserF Homeassistant 附加组件](https://my.home-assistant.io/badges/supervisor_add_addon_repository.svg)](https://my.home-assistant.io/redirect/supervisor_add_addon_repository/?repository_url=https%3A%2F%2Fgithub.com%2FFaserF%2Fhassio-addons)
<br />
该附加组件的安装过程非常简单，与安装任何其他自定义 Home Assistant 附加组件没有区别。<br />
只需点击上面的链接或将我的仓库添加到 hassio 附加组件仓库：<https://github.com/FaserF/hassio-addons>

将您的网站文件放到 /share/htdocs<br />
您的 index.html 应放在的示例文件位置：/share/htdocs/index.html <br />

如果您想将您的网站与 MariaDB 数据库集成，请确保已安装 MariaDB 附加组件！

## 配置

**注意**：_如果更改配置，请记得重启附加组件。_

示例附加组件配置：

```yaml
document_root: /media/apache2
php_ini: /share/apache2/php.ini
default_conf: /share/apache2/000-default.conf
default_ssl_conf: get_file
website_name: itdoesntmatter_as_ssl_is_set_to_false
username: apache
password: mySecretPassword
ssl: false
certfile: itdoesntmatter_as_ssl_is_set_to_false
keyfile: itdoesntmatter_as_ssl_is_set_to_false
```
<br />
推荐的示例附加组件配置：

```yaml
document_root: /share/htdocs
php_ini: default
default_conf: default
default_ssl_conf: default
website_name: mywebsite.ddns.net
ssl: true
certfile: fullchain.pem
keyfile: privkey.pem
```

**注意**：_这只是一个示例，不要复制粘贴！请创建您自己的！_

### 选项：`document_root`

此选项是必需的。根据您的 homeassistant 安装的根网页文件夹位置进行更改。

注意：它必须位于 /share 或 /media 文件夹中！其他文件夹对该附加组件不可见。

### 选项：`php_ini`

您可以选择以下选项：

default -> 将使用默认的 php84 php.ini 文件

get_file -> 从附加组件复制默认的 php84 php.ini 文件到 /share/apache2addon_php.ini

path/to/your/new/php.ini -> 请根据您自定义的 php.ini 文件位置进行更改，如：/share/apache2/php.ini

### 选项：`default_conf` & `default_ssl_conf`

您可以选择以下选项：

default -> 将使用默认的 apache2 附加组件文件

get_config -> 获取默认 apache2 附加组件配置文件的副本到您的 /share 文件夹。

path/to/your/new/apache2.conf -> 请根据您自定义的 000-default.conf / 000-default-le-ssl.conf 文件位置进行更改，如：/share/apache2/000-default.conf <br />
更多信息：<https://cwiki.apache.org/confluence/display/HTTPD/ExampleVhosts><br /> <br />
请注意，如果您使用自定义的 apache2 配置文件并收到任何 apache2 错误，我将不提供任何支持！

### 选项：`website_name`

如果您将 ssl 设置为 true，则此选项是必需的。如果您不使用 SSL，请在此处放入任意内容，因为这无关紧要。

### 选项：`username`

此选项是可选的。此用户用于访问 web 文件（NOT 网站本身）。它将把所有 web 文件的所有者从 "root" 更改为此新所有者。

这不用于网站的身份验证。如果您想要此功能，请查看 [网站的身份验证](#authentification-for-your-website)

### 选项：`password`

此选项是可选的。某些自托管网站需要身份验证密码才能访问 Docker 镜像中的文件。#50

这不用于网站的身份验证。如果您想要此功能，请查看 [网站的身份验证](#authentification-for-your-website)

### 选项：`ssl`

启用/禁用 web 界面的 SSL (HTTPS)。

如果您需要自签名证书，请查看我的 openssl 附加组件：<https://github.com/FaserF/hassio-addons/tree/master/openssl>

**注意**：_文件必须存储在 `/ssl/` 中，这是默认位置_

### 选项：`init_commands`

此选项是可选的。如果您需要某些特殊软件包或命令，可以使用此选项进行安装/使用。#124

如果遇到任何问题，请在提交 bug 报告之前删除此选项！

## 网站的身份验证
使用 .htaccess 文件与 .htpasswd 文件组合来实现：<https://www.htaccessredirect.net/>

示例 .htaccess 文件：

```bash
AuthType Basic
AuthName "我的 Web 服务器身份验证"
AuthUserFile /share/.htpasswd
Require valid-user
```

## Ingress

该附加组件支持 Homeassistant Ingress。到目前为止，似乎只有在启用 SSL 时才能正常工作！
同时很抱歉，我无法支持您所有的网站。基本的 HTML 网站与 ingress 可以良好工作，页面越复杂，支持 ingress 的难度也就越大。

## 支持

有问题或疑问？

您可以在这里[提出问题][issue] gitHub。
请注意，此软件仅在树莓派 4 的 armv7 上进行测试。

## 作者与贡献者

该程序的原始版本来自 Apache 项目。有关更多信息，请访问此页面：<https://httpd.apache.org/>
此 hassio 附加组件由 [FaserF] 提供。

## 许可证

MIT 许可证

版权 (c) 2019-2023 FaserF & Apache 项目

特此免费授予任何获得本软件及其相关文档文件（"软件"）副本的人，以无任何限制地使用本软件，包括但不限于使用、复制、修改、合并、发布、分发、再许可和/或销售本软件的副本，以及允许向其提供软件的人这样做，但须遵守以下条件：

以上版权声明和本许可声明应包含在所有副本或实质性部分的软件中。

本软件是按 "原样" 提供的，不做任何种类的明示或暗示的担保，包括但不限于对适销性、特定用途的适用性和非侵权的保证。在任何情况下，作者或版权持有人均不对因使用或其他交易中发生的任何索赔、损害或其他责任承担责任，无论是在合同诉讼、侵权诉讼或其他方面。

[maintenance-shield]: https://img.shields.io/maintenance/yes/2024.svg
[aarch64-shield]: https://img.shields.io/badge/aarch64-yes-green.svg
[amd64-shield]: https://img.shields.io/badge/amd64-yes-green.svg
[armhf-shield]: https://img.shields.io/badge/armhf-yes-green.svg
[armv7-shield]: https://img.shields.io/badge/armv7-yes-green.svg
[i386-shield]: https://img.shields.io/badge/i386-yes-green.svg
[FaserF]: https://github.com/FaserF/
[issue]: https://github.com/FaserF/hassio-addons/issues