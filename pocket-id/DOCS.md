# Pocket ID 插件

## 概述

[Pocket ID](https://pocket-id.org/) 是一个简单易用的 **OIDC（OpenID Connect）提供者**，可以使用密码密钥进行身份验证。它允许无缝且安全的用户身份验证，无需依赖传统密码。

这个插件作为 Home Assistant 插件运行，在您的网络中提供 **身份提供者**。

## 支持的架构

此插件支持以下架构：

- `amd64`
- `aarch64`

## 配置

**注意**：_当配置更改时，请记得重启插件。_

示例插件配置：

```yaml
PUBLIC_APP_URL: https://id.domain.com
TRUST_PROXY: true
MAXMIND_LICENSE_KEY: ""
```

### 选项：`PUBLIC_APP_URL`

`PUBLIC_APP_URL` 选项设置 Pocket ID 实例的公共 URL。此 URL 必须是 HTTPS 并且可供客户端访问，以确保身份验证正常工作。

### 选项：`TRUST_PROXY`

如果设置为 `true`，Pocket ID 将信任像 `X-Forwarded-For` 的代理头。这在反向代理后运行时很有用。

### 选项：`MAXMIND_LICENSE_KEY`

MaxMind GeoIP 数据库集成的可选许可证密钥。如果提供，它将启用基于地理位置的特性。

## 如何使用

1. **在 Home Assistant 中安装插件**。
2. **根据需要配置** 插件设置中的选项。
3. **启动插件** 以启动 Pocket ID。
4. **使用配置的 `PUBLIC_APP_URL`** 与您的 OIDC 兼容应用程序集成。

## 疑难排解

- 确保 `PUBLIC_APP_URL` 正确设置并且可访问。
- 如果使用反向代理，请将 `TRUST_PROXY` 设置为 `true` 以避免身份验证问题。
- 如果需要地理位置功能，请获取并配置 MaxMind 许可证密钥。

## 更多信息

有关更多详细信息，请访问官方 Pocket ID 资源：

- **网站:** [Pocket ID](https://pocket-id.org/)
- **文档:** [入门指南](https://pocket-id.org/docs/introduction/)