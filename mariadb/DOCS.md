# Home Assistant 插件：MariaDB

## 安装

按照以下步骤在您的系统上安装插件：

1. 在您的 Home Assistant 前端导航到 **设置** -> **插件** -> **插件商店**。
2. 找到 "MariaDB" 插件并点击它。
3. 点击 "安装" 按钮。

## 如何使用

1. 将 `logins` -> `password` 字段设置为强大且唯一的密码。
2. 启动插件。
3. 检查插件日志输出以查看结果。
4. 将 `recorder` 集成添加到您的 Home Assistant 配置中。

## 插件配置

MariaDB 服务器插件可以根据您的喜好进行调整。本节描述了每个插件配置选项。

插件配置示例：

```yaml
databases:
  - homeassistant
logins:
  - username: homeassistant
    password: PASSWORD
  - username: read_only_user
    password: PASSWORD
rights:
  - username: homeassistant
    database: homeassistant
  - username: read_only_user
    database: homeassistant
    privileges:
      - SELECT
```

### 选项：`databases`（必需）

数据库名称，例如 `homeassistant`。允许多个。

### 选项：`logins`（必需）

本节定义在 MariaDB 中创建用户的定义。 [创建用户][createuser] 文档。

### 选项：`logins.username`（必需）

数据库用户登录，例如 `homeassistant`。 [用户名][username] 文档。

### 选项：`logins.password`（必需）

用户登录的密码。应该是强大且唯一的。

### 选项：`rights`（必需）

本节授予 MariaDB 中用户的特权。 [授予][grant] 文档。

### 选项：`rights.username`（必需）

这应该与 `logins` -> `username` 中定义的用户名相同。

### 选项：`rights.database`（必需）

这应该与 `databases` 中定义的数据库相同。

### 选项：`rights.privileges`（可选）

要授予此用户的特权列表，来自 [授予][grant]，如 `SELECT` 和 `CREATE`。
如果省略，则授予用户 `ALL PRIVILEGES`。 不建议限制 Home Assistant 使用的用户的特权，但如果您希望允许其他应用程序查看记录器数据，应该创建一个仅限于对数据库的只读访问的用户。

### 选项：`mariadb_server_args`（可选）

一些用户在大型数据库上进行 Home Assistant 模式更新时遇到了 [错误][migration-issues]。
定义推荐的参数可以帮助解决此问题（如果有可用的 RAM）。

示例：`--innodb_buffer_pool_size=512M`

## Home Assistant 配置

MariaDB 将被 Home Assistant 中的 `recorder` 和 `history` 组件使用。有关如何设置的更多信息，请参见 Home Assistant 的 [recording integration][mariadb-ha-recorder] 文档。

Home Assistant 配置示例：

```yaml
recorder:
  db_url: mysql://homeassistant:password@core-mariadb/homeassistant?charset=utf8mb4
```

## 支持

有问题吗？

您可以在 [这里打开问题][issue] GitHub。

[aarch64-shield]: https://img.shields.io/badge/aarch64-yes-green.svg
[amd64-shield]: https://img.shields.io/badge/amd64-yes-green.svg
[armv7-shield]: https://img.shields.io/badge/armv7-yes-green.svg
[armhf-shield]: https://img.shields.io/badge/armhf-yes-green.svg
[i386-shield]: https://img.shields.io/badge/i386-yes-green.svg
[issue]: https://github.com/erik73/addon-mariadb/issues
[repository]: https://github.com/erik73/hassio-addons