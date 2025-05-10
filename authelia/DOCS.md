# Home Assistant 附加组件：Authelia

## 描述

Authelia 是一个开源的认证和授权服务器，旨在为您的服务提供安全的访问控制。此附加组件允许您在 Home Assistant 中运行 Authelia。

## 支持的架构

此附加组件支持以下架构：

- `amd64`
- `aarch64`

## 安装

1. 在 Home Assistant 中导航到 **设置** > **附加组件**。
2. 点击 **附加组件商店** 并搜索 **Authelia**。
3. 如有必要，添加 `https://github.com/einschmidt/hassio-addons` 源。
4. 安装附加组件并使用以下设置进行配置。
5. 启动附加组件并打开日志以检查是否有任何问题。

## 配置

在首次启动附加组件之前，您 **必须编辑 `domain`** 选项配置。这是一步重要的步骤，因为它确保 Authelia 使用您的特定域进行适当的功能设置。

### 配置步骤

1. **编辑域**  
   在首次启动之前，必须设置 `domain` 选项。此选项对于正确路由请求和配置会话 Cookies 至关重要。

   - 示例：
     ```yaml
     domain: yourdomain.com
     ```

2. **首次启动**  
   首次启动时，附加组件会自动在 `addon_config` 文件夹中创建 `config.yml` 文件。此文件将填充默认设置，包括配置的域和其他必需设置。

3. **编辑生成的 `config.yml`**  
   第一次启动后，您会在 `/addon_config` 文件夹中找到 `config.yml` 文件。 **您必须编辑此文件以匹配您的个人环境**。确保所有必要的设置，如域、用户认证路径和其他相关选项，均已正确配置。

4. **重新启动附加组件**  
   在编辑 `config.yml` 文件后， **您必须重新启动附加组件** 才能使更改生效。这一步至关重要，可以确保更新的配置得到正确应用。

### 重要注意事项

- **`domain`** 设置仅在初始配置创建时是必需的。
- 初次启动后对 `config.yml` 的任何更改都需要 **重新启动附加组件** 以应用新设置。

请确保在继续之前仔细审查并自定义 `config.yml`，以确保最佳运行效果。

## 更多信息

有关更多详细信息，请访问官方 Authelia 资源：

- **网站：** [Authelia](https://www.authelia.com//)
- **文档：** [入门指南](https://www.authelia.com/integration/prologue/get-started/)