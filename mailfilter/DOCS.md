# Home Assistant 插件：邮件过滤器

基于 Rspamd 和 ClamAV 的邮件过滤器。

![支持 aarch64 架构][aarch64-shield] ![支持 amd64 架构][amd64-shield]
![支持 armv7 架构][armv7-shield]

## 关于

重要提示：该插件要求已安装并运行邮件服务器插件！

此插件为实验性，提供邮件过滤功能，适用于您的邮件服务器插件。
仅能够过滤邮件服务器插件的邮件。

## 安装

按照以下步骤在您的系统上安装该插件：

添加代码库 `https://github.com/erik73/hassio-addons`。
找到“邮件过滤器”插件并点击它。
点击“安装”按钮。

## 如何使用

### 启动插件

安装后，您将获得一个默认配置。

调整插件配置以满足您的需求。
通过点击“保存”按钮保存插件配置。
启动插件。

## 配置

示例配置：

```yaml
enable_antivirus: false
enable_dkim_signing: false
```

请注意：启用杀毒选项会消耗大量内存。
主机上至少需要安装 4GB 的 RAM。
根据已安装的其他插件，6GB 可能不够。

### 选项：`enable_antivirus`（可选）

启用此选项将启用 ClamAV 病毒扫描仪。
关于内存的考虑请参见上文。

### 选项：`enable_dkim_signing`（可选）

为发出的邮件启用 DKIM 签名。
第一次启用此选项时，将生成 DKIM 密钥。
如果关闭此选项，您的密钥将被删除。
再次启用时，将生成新密钥。
密钥将在日志输出中显示。有关参考，以下是该插件如何生成密钥：
rspamadm dkim_keygen -b 2048 -s mail -k /ssl/dkim/mail.key

选择器为 'mail'，生成一个 2048 位的 rsa 密钥。
mail.key 和 mail.pub 文件保存在 Home Assistant 的 /ssl/dkim 目录中。以下是插件日志中的示例输出：

```
mail._domainkey IN TXT ( "v=DKIM1; k=rsa; "
	"p=MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAqdBRCqYzshc4LmmkxUkCH/rcIpSe/QdNIVmBrgqZmZ5zzWQi7ShdFOH7V32/VM1VRk2pkjDV7tmfbwslsymsfxgGhVHbU0R3803uRfxAiT2mYu1hCc9351YpZF4WnrdoA3BT5juS3YUo5LsDxvZCxISnep8VqVSAZOmt8wFsZKBXiIjWuoI6XnWrzsAfoaeGaVuUZBmi4ZTg0O4yl"
	"nVlIz11McdZTRe1FlONOzO7ZkQFb7O6ogFepWLsM9tYJ38TFPteqyO3XBjxHzp1AT0UvsPcauDoeHUXgqbxU7udG1t05f6ab5h/Kih+jisgHHF4ZFK3qRtawhWlA9DtS35DlwIDAQAB"
) ;
```

如果您正在运行自己的 Bind DNS 服务器，您只需要将记录直接复制粘贴到您的域区文件中。
如果您使用的是 DNS 网络界面，您需要创建一个新的 TXT 记录，名称为 mail.\_domainkey，而值/内容需要去掉引号并将三行连接在一起。
在我们的例子中，TXT 记录的值/内容应如下所示：

```
v=DKIM1; k=rsa; p=MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAqdBRCqYzshc4LmmkxUkCH/rcIpSe/QdNIVmBrgqZmZ5zzWQi7ShdFOH7V32/VM1VRk2pkjDV7tmfbwslsymsfxgGhVHbU0R3803uRfxAiT2mYu1hCc9351YpZF4WnrdoA3BT5juS3YUo5LsDxvZCxISnep8VqVSAZOmt8wFsZKBXiIjWuoI6XnWrzsAfoaeGaVuUZBmi4ZTg0O4ylnVlIz11McdZTRe1FlONOzO7ZkQFb7O6ogFepWLsM9tYJ38TFPteqyO3XBjxHzp1AT0UvsPcauDoeHUXgqbxU7udG1t05f6ab5h/Kih+jisgHHF4ZFK3qRtawhWlA9DtS35DlwIDAQAB
```

当 DKIM 选项关闭时，/ssl/dkim 中的密钥文件将被删除。
如果您再次启用该选项，将创建新密钥。

## 支持

有问题吗？

您可以在这里 [提交问题][issue] GitHub。

[aarch64-shield]: https://img.shields.io/badge/aarch64-yes-green.svg
[amd64-shield]: https://img.shields.io/badge/amd64-yes-green.svg
[armv7-shield]: https://img.shields.io/badge/armv7-yes-green.svg
[i386-shield]: https://img.shields.io/badge/i386-yes-green.svg
[issue]: https://github.com/erik73/addon-mailfilter/issues
[repository]: https://github.com/erik73/hassio-addons