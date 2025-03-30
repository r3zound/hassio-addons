# Pocket ID 附加组件

## 概述

[Pocket ID](https://pocket-id.org/) 是一个简单易用的 **OIDC（开放ID连接）提供商**，支持使用密码密钥进行认证。它允许为您的服务提供无缝和安全的用户认证，而无需依赖传统密码。

此附加组件作为 Home Assistant 附加组件运行，为您的网络提供 **身份提供者**。

## 支持的架构

此附加组件支持以下架构：

- `amd64`
- `aarch64`

## 配置

**注意**：_更改配置后，请记得重启附加组件。_

附加组件配置示例：

```yaml
PUBLIC_APP_URL: https://id.domain.com
TRUST_PROXY: true
MAXMIND_LICENSE_KEY: ""
```

### 选项：`PUBLIC_APP_URL`

`PUBLIC_APP_URL` 选项设置 Pocket ID 实例的公共URL。此URL必须为HTTPS，并且客户端必须能够访问，以保证认证正常工作。

### 选项：`TRUST_PROXY`

如果设置为 `true`，Pocket ID 将信任诸如 `X-Forwarded-For` 的代理头。这在反向代理后运行时非常有用。

### 选项：`MAXMIND_LICENSE_KEY`

MaxMind GeoIP 数据库集成的可选许可证密钥。如果提供，将启用基于地理位置的功能。

## 如何使用

1. **在 Home Assistant 中安装附加组件**。
2. **根据需要配置** 选项，通过附加组件设置进行配置。
3. **启动附加组件** 启动 Pocket ID。
4. **使用配置的 `PUBLIC_APP_URL`** 将其集成到您的 OIDC 兼容应用程序中。

## 故障排除

- 确保 `PUBLIC_APP_URL` 设置正确且可访问。
- 如果使用反向代理，请将 `TRUST_PROXY` 设置为 `true` 以避免认证问题。
- 如果需要地理位置功能，请获取并配置 MaxMind 许可证密钥。

## 更多信息

有关更多详细信息，请访问官方 Pocket ID 资源：

- **网站:** [Pocket ID](https://pocket-id.org/)
- **文档:** [入门指南](https://pocket-id.org/docs/introduction/)