# Home Assistant 插件：Google Assistant SDK

## 安装

按照以下步骤在您的系统中安装插件：

1. 在您的 Home Assistant 前端导航到 **设置** -> **附加组件** -> **附加组件商店**。
2. 找到 "Google Assistant SDK" 插件并点击它。
3. 点击 "安装" 按钮。

## 配置

插件配置：

```yaml
client_secrets: google_assistant.json
project_id: project_id_from_google
model_id: model_id_from_google
```

### 选项： `clients_secrets`（必需）

您从 Google 下载并放置在 `/share` 文件夹中的客户端机密文件的名称。

### 选项： `project_id`（必需）

您在 Google 为此插件创建的项目的项目 ID。
项目 ID 可以在您的 `google_assistant.json` 文件中找到，或者在 [Google Actions 控制台][google-actions-console] 的项目设置中找到。

### 选项： `model_id`（必需）

您在 Google 为此插件注册的模型的 ID。

模型 ID 也可以在 [Google Actions 控制台][google-actions-console] 的 "开发 - 设备注册" 标签下找到。

### 选项组： `feedback`

以下选项属于选项组： `feedback`。

#### 选项： `feedback.enabled`

如果您希望在 Google Assistant 开始和停止监听您的命令时听到反馈声音，请设置为 `true`。

#### 选项： `feedback.volume`

用于反馈声音的音量百分比。

## 如何使用

您需要首先启用 Google Assistant API 的访问权限。
为此，请执行以下操作：

1. 转到 [Google Actions 控制台][google-actions-console] 并创建一个新项目。
1. 创建项目后，在页面底部点击 "**设备注册**"。保持此标签页以备后用。
1. 通过 [此][google-assistant-api] 链接在新项目上启用 Google Assistant API。确保您已选择正确的项目（在屏幕顶部的菜单条中显示）。如果您无法选择正确的项目，可以尝试在隐身窗口中打开该链接。
1. 配置 [OAuth 同意屏幕][google-oauth-concent]。再次检查您是否选择了正确的项目。
    1. 选择 "**外部**" 作为用户类型。
    1. 填写项目名称和您的电子邮件。
    1. 点击页面底部的 "**保存**"。
1. 返回设备注册标签页并点击 "**注册模型**"。如果您关闭了该标签，可以在 [Google Actions 控制台][google-actions-console] 中打开您的项目，开始快速设置，并在左侧菜单中点击 "**设备注册**"。
    1. 给您的项目命名并考虑一个好的制造商。选择 "**扬声器**" 作为设备类型。如果您想，可以编辑您的模型 ID，并复制以备后用。
    1. 点击 "**注册模型**" 并下载凭据。
    1. 点击 "**下一步**" 并点击 "**跳过**"。
1. 将您的凭据上传为 `google_assistant.json` 到 "hassio/share" 文件夹中，例如使用 [Samba][samba-addon] 插件。
1. 在插件配置标签页：
    1. 在 "配置" 部分，填写您的 `project_id` 和 `model_id` 并点击 "**保存**"。您的项目 ID 可以通过点击右上角的菜单按钮并选择 "**项目设置**" 在 Google Actions 控制台中找到。此 ID 可能与您选择的项目名称不同！
    1. 在 "音频" 部分，选择用于助理的输入和输出音频设备并点击 "**保存**"。在 Raspberry Pi 3 上，`ALSA device 0` 是内置耳机端口，`ALSA device 1` 是 HDMI 端口。
1. 最后一步是用 Google Assistant 进行身份验证。
    1. 启动插件。检查日志并点击刷新，直到显示：`ENGINE Bus STARTED`。
    1. 现在点击 "**打开网页 UI**" 并按照身份验证流程进行。
    1. 一旦您用 Google 登录并授权应用程序，请将代码复制回网页 UI。您发送令牌后会得到一个空响应。
    1. 之后，您可以关闭网页 UI 标签。

现在 Google Assistant 应该在您的 Raspberry Pi 上运行！
要测试它，请说 "Ok Google"，然后跟随您选择的命令。

### 故障排除

#### Google Assistant 无法工作

Google 需要能够通过发送 Webhook 到 `https://yourdomain:yourport/api/google_assistant` 将数据发送回您的 Google Assistant SDK 插件。

为此，您需要确保您的 Home Assistant 可以从互联网访问，并且使用 `https`（SSL）。

#### 助理音量太低

如果助理的声音真的很小，您可以要求它提高音量：
- "Ok Google，将音量设置为最大。"
- 或者 "Ok Google，将音量设置为 85%。"

## 支持

有问题吗？

您有几个选项可以获得答案：

- [Home Assistant Discord 聊天服务器][discord]。
- Home Assistant [社区论坛][forum]。
- 加入 [/r/homeassistant][reddit] 的 [Reddit 子版块][reddit]。

如果您发现了错误，请 [在我们的 GitHub 上提交问题][issue]。

[discord]: https://discord.gg/c5DvZ4e
[documentation]: https://github.com/home-assistant/addons/blob/master/google_assistant/DOCS.md
[forum]: https://community.home-assistant.io
[google-actions-console]: https://console.actions.google.com/
[google-assistant-api]: https://console.developers.google.com/apis/api/embeddedassistant.googleapis.com/overview
[google-oauth-client]: https://console.developers.google.com/apis/credentials/oauthclient
[google-oauth-concent]: https://console.developers.google.com/apis/credentials/consent
[google-platform-project]: https://console.cloud.google.com/project
[issue]: https://github.com/home-assistant/addons/issues
[reddit]: https://reddit.com/r/homeassistant
[repository]: https://github.com/hassio-addons/repository
[samba-addon]: https://github.com/home-assistant/addons/tree/master/samba