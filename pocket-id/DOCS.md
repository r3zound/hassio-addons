# Pocket ID 插件

## 概述

[Pocket ID](https://pocket-id.org/) 是一个简单易用的 **OIDC（OpenID Connect）提供者**，支持使用密码密钥进行身份验证。它允许您在不依赖传统密码的情况下，实现服务的无缝和安全的用户身份验证。

此插件作为 Home Assistant 插件运行，为您的网络提供 **身份提供者**。

## 支持的架构

该插件支持以下架构：

- `amd64`
- `aarch64`

## 配置

**注意**：_更改配置后请记得重启插件。_

示例插件配置：

```yaml
PUBLIC_APP_URL: https://id.domain.com
TRUST_PROXY: true
MAXMIND_LICENSE_KEY: ""
```

### 选项：`PUBLIC_APP_URL`

`PUBLIC_APP_URL` 选项设置 Pocket ID 实例的公共 URL。此 URL 必须为 HTTPS，并且客户端需要能够访问，以确保身份验证正常工作。

### 选项：`TRUST_PROXY`

如果设置为 `true`，Pocket ID 将信任如 `X-Forwarded-For` 的代理头。这个选项在使用反向代理时非常有用。

### 选项：`MAXMIND_LICENSE_KEY`

可选的 MaxMind GeoIP 数据库集成许可证密钥。如果提供，将启用基于地理位置的功能。

## 如何使用

1. **在 Home Assistant 中安装插件**。
2. **根据需要在插件设置中配置选项**。
3. **启动插件**以启动 Pocket ID。
4. **使用配置好的 `PUBLIC_APP_URL`** 与您的 OIDC 兼容应用程序集成。

## 故障排除

- 确保 `PUBLIC_APP_URL` 正确设置并可访问。
- 如果使用反向代理，将 `TRUST_PROXY` 设置为 `true` 以避免身份验证问题。
- 如果需要地理定位功能，请获取并配置 MaxMind 许可证密钥。

## 更多信息

有关更多详细信息，请访问官方 Pocket ID 资源：

- **网站：** [Pocket ID](https://pocket-id.org/)
- **文档：** [入门指南](https://pocket-id.org/docs/introduction/)