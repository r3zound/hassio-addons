# Home Assistant 插件：Authelia

## 描述

Authelia 是一个开源的认证和授权服务器，旨在为您的服务提供安全的访问控制。这个插件允许您在 Home Assistant 中运行 Authelia。

## 支持的架构

该插件支持以下架构：

- `amd64`
- `aarch64`

## 安装

1. 在 Home Assistant 中导航到 **设置** > **插件**。
2. 点击 **插件商店** 并搜索 **Authelia**。
3. 如有必要，添加 `https://github.com/einschmidt/hassio-addons` 仓库。
4. 安装插件并使用下面的设置进行配置。
5. 启动插件并打开日志检查是否存在任何问题。

## 配置

在首次启动插件之前，您 **必须编辑 `domain`** 选项。这个步骤至关重要，因为它确保 Authelia 使用您的特定域进行正确的功能设置。

### 配置步骤

1. **编辑域名**  
   在第一次启动之前，`domain` 选项必须设置。这个选项对于正确路由请求和配置会话 cookies 是必不可少的。

   - 示例：
     ```yaml
     domain: yourdomain.com
     ```

2. **首次启动**  
   在首次启动时，插件将自动在 `addon_config` 文件夹中创建 `config.yml` 文件。该文件将填充默认设置，包括配置的域名和其他所需设置。

3. **编辑生成的 `config.yml`**  
   首次启动后，您将在 `/addon_config` 文件夹中找到 `config.yml` 文件。**您必须编辑此文件以匹配您的个人环境**。确保所有必要的设置，例如域名、用户认证路径和其他相关选项，均已正确配置。

4. **重新启动插件**  
   在对 `config.yml` 文件进行任何编辑后，**您必须重新启动插件** 以使更改生效。此步骤对于确保更新的配置正确应用至关重要。

### 重要说明

- **`domain`** 设置仅在初始配置创建时是必需的。
- 在初始启动后对 `config.yml` 的任何更改都需要 **重新启动插件** 以应用新设置。

请确保在继续之前仔细审核和自定义 `config.yml` 以确保最佳运行。

## 更多信息

有关更多详细信息，请访问官方 Authelia 资源：

- **网站：** [Authelia](https://www.authelia.com//)
- **文档：** [入门指南](https://www.authelia.com/integration/prologue/get-started/)