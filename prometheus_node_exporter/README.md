# prometheus_node_exporter

[![CI](https://github.com/loganmarchione/hassos-addons/actions/workflows/main.yml/badge.svg)](https://github.com/loganmarchione/hassos-addons/actions/workflows/main.yml)

Prometheus [Node Exporter](https://github.com/prometheus/node_exporter)，用于\*NIX内核暴露的硬件和操作系统指标。

## 安装

1. 添加我的[仓库](https://github.com/loganmarchione/hassos-addons)。URL为 `https://github.com/loganmarchione/hassos-addons`。
1. 在Supervisor附加组件商店中搜索“Prometheus Node Exporter”附加组件并安装它。
1. 在附加组件面板中禁用“保护模式”。
1. 可选 - 检查附加组件的`配置`选项卡，进行您想要的任何更改。
1. 启动附加组件。
1. 检查附加组件的`日志`选项卡以查看一切是否正常。
1. 要验证指标是否可用，请在浏览器中访问`http://your_home_assistant_ip_address:9100/metrics`，或使用curl：`curl -X GET http://your_home_assistant_ip_address:9100/metrics`。

## 配置

默认情况下，Prometheus Node Exporter在TCP端口9100上监听。

### HTTP基本身份验证

默认情况下，HTTP基本身份验证是禁用的。如果您想启用HTTP基本身份验证：

1. 将`enable_basic_auth`设置为true
1. 输入`basic_auth_user`和`basic_auth_pass`

### TLS

默认情况下，TLS是禁用的。如果您想启用TLS：

1. 将`enable_tls`设置为true
1. 输入`cert_file`和`cert_key`

⚠️ 请注意，`cert_file`和`cert_key`需要分别为`/path/to/fullchain.pem`和`/path/to/privkey.pem`（`/config`和`/ssl`已映射到此附加组件）⚠️

### 命令行参数

此选项允许您将命令行参数直接传递给Prometheus Node Exporter。这在调整运行的[收集器](https://github.com/prometheus/node_exporter/#collectors)时特别有用。例如，要禁用所有收集器以外的`cpu`收集器，可以使用此字符串：`--collector.disable-defaults --collector.cpu`。

## 用法（在Prometheus服务器中）

将以下内容添加到您的Prometheus服务器的`/etc/prometheus/prometheus.yml`配置文件中：

```
scrape_configs:
  ...
  ...
  ...
  - job_name: 'homeassistant'
    static_configs:
    - targets: ['your_home_assistant_ip_address:9100']
    basic_auth:
      username: username_goes_here
      password: password_goes_here
```

以下Prometheus查询应返回数据：

```
node_uname_info{job="homeassistant"}
```

## 支持

- 已在`amd64`和`aarch64`（Raspberry Pi 4B）平台上测试

## 许可证

进行中

## 已知问题

- [ ] 当Home Assistant位于反向代理后面时，“打开Web UI”按钮无法使用。
- [x] 仅在`amd64`版本上测试。

## 待办事项

- [x] 添加HTTP基本身份验证
- [x] 添加输入明文密码而不是bcrypt哈希的能力
- [x] 添加TLS
- [x] 根据[此评论](https://community.home-assistant.io/t/hello-world-example-addon-from-developer-docs-stopped-working-s6-overlay-issue/421486/7)，在注册表（DockerHub或GitHub）上设置容器映像，以便用户在每次安装时不需要构建容器（将防止[此问题](https://github.com/loganmarchione/hassos-addons/issues/2)）
- [x] 调查此仓库的CI/CD，特别是作为示例的[这个](https://github.com/home-assistant/actions)和[这个](https://github.com/hassio-addons/addon-glances/blob/main/.github/workflows/ci.yaml)
- [ ] 调查取消API访问（例如，`hassio_api`，`homeassistant_api`，`auth_api`）以提高我的评级

## 常见问题

- Home Assistant 不是已经有Prometheus集成吗？
  - 是的，但[官方集成](https://www.home-assistant.io/integrations/prometheus/)仅暴露与实体相关的指标，而不是与主机相关的指标。
- 不是已经有一个Prometheus附加组件了吗？
  - 是的，但该[附加组件](https://github.com/hassio-addons/addon-prometheus)是用于Prometheus服务器，而不是节点导出器。
- 为什么这个附加组件需要这么多权限？
  - 附加组件需要访问主机级别的指标（CPU、内存、磁盘等）。因此，我请求了所有可能的权限。在运行此附加组件之前，请检查其代码。