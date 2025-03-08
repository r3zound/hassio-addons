# 怀俄明 Microsoft TTS
供 Microsoft Azure 文本转语音使用的怀俄明协议服务器。

此 Python 包提供 Microsoft Azure 文本转语音的怀俄明集成，可以直接与 [Home Assistant](https://www.home-assistant.io/) 的语音和 [Rhasspy](https://github.com/rhasspy/rhasspy3) 一起使用。

## Azure 语音服务
此程序使用 [Microsoft Azure 语音服务](https://learn.microsoft.com/en-us/azure/ai-services/speech-service/)。您可以注册一个免费的 Azure 账户，该账户附带每月 50 万个字符的免费配额，这应该足够运行一个语音助手，因为每个命令相对较短。此外，在 Home Assistant 中，输出是缓存的，因此每个响应只会请求一次。一旦超出这一数量，Azure 可能会按使用的每秒收费（当前定价为每音频小时 0.36 美元）。我对任何产生的费用不负责任，并建议您设置一个支出限制以减少风险。但是，对于正常使用，免费配额应该足够，资源不会自动切换到付费服务。

如果您尚未设置语音资源，可以按照以下说明进行操作。（您只需执行一次，并且适用于 [Speech-to-Text](https://github.com/hugobloem/wyoming-microsoft-stt) 和 [Text-to-Speech](https://github.com/hugobloem/wyoming-microsoft-tts)）

1. 登录或创建一个 [portal.azure.com](https://portal.azure.com) 账户。
2. 通过在搜索栏中搜索 `subscription` 来创建一个订阅。[请参考 Microsoft Learn 获取更多信息](https://learn.microsoft.com/en-gb/azure/cost-management-billing/manage/create-subscription#create-a-subscription-in-the-azure-portal)。
3. 通过搜索 `speech service` 来创建一个语音资源。
4. 选择您创建的订阅，选择或创建一个资源组，选择一个区域，选择一个可识别的名称，然后选择定价层（您可能想要选择免费 F0）。
5. 一旦创建，复制语音服务页面上的一个密钥。您将需要此密钥来运行该程序。

## 安装
根据您的使用情况，有不同的安装选项。

- **使用 pip**
  克隆库并使用 pip 安装包。请注意平台要求，如 [此处](https://learn.microsoft.com/en-us/azure/ai-services/speech-service/quickstarts/setup-platform?tabs=linux%2Cubuntu%2Cdotnetcli%2Cdotnet%2Cjre%2Cmaven%2Cnodejs%2Cmac%2Cpypi&pivots=programming-language-python#platform-requirements) 所示。
  ```sh
  pip install .
  ```

- **Home Assistant 插件**
  将以下库作为插件库添加到您的 Home Assistant，或点击下面的按钮。
  [https://github.com/hugobloem/homeassistant-addons](https://github.com/hugobloem/homeassistant-addons)

  [![打开您的 Home Assistant 实例并显示插件库对话框，特定库 URL 预填。](https://my.home-assistant.io/badges/supervisor_add_addon_repository.svg)](https://my.home-assistant.io/redirect/supervisor_add_addon_repository/?repository_url=https%3A%2F%2Fgithub.com%2Fhome-assistant%2Faddons-example)

- **Docker 容器**
  即将推出...

## 使用
根据安装方法，参数的解析方式不同。然而，所有安装方法使用相同的选项，并可在下表中找到。您的服务区域和订阅密钥可以在语音服务资源页面上找到（第 5 步为 Azure 语音服务指令）。

对于裸机 Python 安装，程序的运行命令如下：
```python
python -m wyoming-microsoft-tts --<key> <value>
```

| 键                   | 可选   | 描述                                     |
|--------------------|------|----------------------------------------|
| `service-region`   | 否    | Azure 服务区域，例如 `uksouth`       |
| `subscription-key` | 否    | Azure 订阅密钥                        |
| `uri`              | 否    | 服务器广播的 Uri，例如 `tcp://0.0.0.0:10300` |
| `download-dir`     | 是    | 下载 voices.json 的目录（默认：/tmp/） |
| `voice`            | 是    | 设置为转录的默认语音，默认：`en-GB-SoniaNeural` |
| `auto-punctuation` | 是    | 自动添加标点（默认：`".?!"`）         |
| `samples-per-chunk`| 是    | 每个音频块的样本数（默认：1024）     |
| `update-voices`    | 是    | 启动时下载最新的 languages.json      |
| `debug`            | 是    | 记录调试消息                          |