# 怀俄明 Microsoft STT
怀俄明协议服务器用于 Microsoft Azure 语音转文本。

此 Python 包提供了与 Microsoft Azure 语音转文本的怀俄明集成，可以直接与 [Home Assistant](https://www.home-assistant.io/) 语音和 [Rhasspy](https://github.com/rhasspy/rhasspy3) 一起使用。

## Azure 语音服务
此程序使用 [Microsoft Azure 语音服务](https://learn.microsoft.com/en-us/azure/ai-services/speech-service/)。您可以注册一个免费 Azure 帐户，免费级别每月提供 5 个小时的音频，这通常足以运行语音助手，因为每个命令都相对较短。一旦超过此数量，Azure 可能会对每使用的秒数收费（当前定价为每小时音频 $0.36）。我不对产生的任何费用负责，并建议您设置支出限制以减少风险。然而，对于正常使用，免费级别可能足够，资源不应自动切换到付费服务。

如果您还没有设置语音资源，可以按照以下说明操作。（您只需做一次，并适用于 [语音转文本](https://github.com/hugobloem/wyoming-microsoft-stt) 和 [文本转语音](https://github.com/hugobloem/wyoming-microsoft-tts)）

1. 登录或在 [portal.azure.com](https://portal.azure.com) 创建一个帐户。
2. 在搜索栏中搜索 `subscription` 创建一个订阅。[有关更多信息，请咨询 Microsoft Learn](https://learn.microsoft.com/en-gb/azure/cost-management-billing/manage/create-subscription#create-a-subscription-in-the-azure-portal)。
3. 在搜索中寻找 `speech service` 创建一个语音资源。
4. 选择您创建的订阅，选择或创建一个资源组，选择一个区域，输入一个可识别的名称，并选择定价层（您可能想要选择免费 F0）。
5. 创建后，从语音服务页面复制其中一个密钥。您将需要此密钥来运行该程序。

## 安装
根据您的使用案例，有不同的安装选项。

- **使用 pip**
  克隆该存储库并使用 pip 安装该包。请注意此处列出的平台要求 [here](https://learn.microsoft.com/en-us/azure/ai-services/speech-service/quickstarts/setup-platform?tabs=linux%2Cubuntu%2Cdotnetcli%2Cdotnet%2Cjre%2Cmaven%2Cnodejs%2Cmac%2Cpypi&pivots=programming-language-python#platform-requirements)。
  ```sh
  pip install .
  ```

- **Home Assistant 插件**
  将以下存储库添加为您的 Home Assistant 的插件存储库，或点击下面的按钮。
  [https://github.com/hugobloem/homeassistant-addons](https://github.com/hugobloem/homeassistant-addons)

  [![打开您的 Home Assistant 实例，并显示添加插件存储库对话框，预填充指定的存储库 URL。](https://my.home-assistant.io/badges/supervisor_add_addon_repository.svg)](https://my.home-assistant.io/redirect/supervisor_add_addon_repository/?repository_url=https%3A%2F%2Fgithub.com%2Fhome-assistant%2Faddons-example)

- **Docker 容器**
  敬请期待...

## 使用
根据安装方法，参数解析方式不同。然而，对于每种安装方法使用相同的选项，见下表。您的服务区域和订阅密钥可以在语音服务资源页面找到（Azure 语音服务说明的第 5 步）。

对于裸机 Python 安装，程序的运行方式如下：
```python
python -m wyoming-microsoft-stt --<key> <value>
```

| 键 | 可选 | 描述 |
|---|---|---|
| `service-region` | 否 | Azure 服务区域，例如： `uksouth` |
| `subscription-key` | 否 | Azure 订阅密钥 |
| `uri` | 否 | 服务器广播的 URI，例如： `tcp://0.0.0.0:10300` |
| `download-dir` | 是 | 下载模型的目录（默认: ） |
| `language` | 是 | 设置转录的默认语言，默认: `en-GB` |
| `update-languages` | 是 | 启动时下载最新的 languages.json |
| `debug` | 是 | 记录调试消息 |