# Wyoming Microsoft STT
Wyoming 协议服务器用于 Microsoft Azure 语音转文本。

这个 Python 包提供了对 Microsoft Azure 语音转文本的 Wyoming 集成，可以直接与 [Home Assistant](https://www.home-assistant.io/) 语音和 [Rhasspy](https://github.com/rhasspy/rhasspy3) 一起使用。

## Azure 语音服务
该程序使用 [Microsoft Azure 语音服务](https://learn.microsoft.com/en-us/azure/ai-services/speech-service/)。您可以注册一个免费的 Azure 帐户，该帐户提供每月 5 小时的免费使用时间，这应该足够运行语音助手，因为每个命令相对较短。一旦超出这个金额，Azure 可能会对每秒使用收取费用（当前价格为每音频小时 $0.36）。我不对任何产生的费用负责，并建议您设置支出上限以减少您的风险。然而，正常使用下，免费套餐可能足够，资源不应自动切换到付费服务。

如果您还没有设置语音资源，可以按照以下说明进行操作。（您只需执行一次，并适用于 [语音转文本](https://github.com/hugobloem/wyoming-microsoft-stt) 和 [文本转语音](https://github.com/hugobloem/wyoming-microsoft-tts)）

1. 在 [portal.azure.com](https://portal.azure.com) 上登录或创建一个帐户。
2. 通过在搜索栏中搜索 `subscription` 来创建订阅。 [参见 Microsoft Learn 获取更多信息](https://learn.microsoft.com/en-gb/azure/cost-management-billing/manage/create-subscription#create-a-subscription-in-the-azure-portal)。
3. 通过搜索 `speech service` 创建语音资源。
4. 选择您创建的订阅，选择或创建资源组，选择区域，选择一个可识别的名称，并选择定价层（您可能想选择免费 F0）。
5. 创建后，从语音服务页面复制其中一个密钥。您将需要这个密钥来运行此程序。

## 安装
根据您的使用案例有不同的安装选项。

- **使用 pip**
  克隆代码库并使用 pip 安装包。请注意平台要求，如 [此处](https://learn.microsoft.com/en-us/azure/ai-services/speech-service/quickstarts/setup-platform?tabs=linux%2Cubuntu%2Cdotnetcli%2Cdotnet%2Cjre%2Cmaven%2Cnodejs%2Cmac%2Cpypi&pivots=programming-language-python#platform-requirements) 所述。
  ```sh
  pip install .
  ```

- **Home Assistant 插件**
  将以下代码库作为插件库添加到您的 Home Assistant，或点击下面的按钮。
  [https://github.com/hugobloem/homeassistant-addons](https://github.com/hugobloem/homeassistant-add-ons)

  [![打开您的 Home Assistant 实例并显示添加插件库对话框，预填充特定的库 URL。](https://my.home-assistant.io/badges/supervisor_add_addon_repository.svg)](https://my.home-assistant.io/redirect/supervisor_add_addon_repository/?repository_url=https%3A%2F%2Fgithub.com%2Fhome-assistant%2Faddons-example)

- **Docker 容器**
  即将推出...

## 使用
根据安装方法，参数解析方式不同。然而，每种安装方法使用相同的选项，详细信息可以在下表中找到。您的服务区域和订阅密钥可以在语音服务资源页面找到（步骤 5 Azure 语音服务说明）。

对于裸机 Python 安装，该程序的运行方式如下：
```python
python -m wyoming-microsoft-stt --<key> <value>
```

| Key | Optional | Description |
|---|---|---|
| `service-region` | 否 | Azure 服务区域，例如 `uksouth` |
| `subscription-key` | 否 | Azure 订阅密钥 |
| `uri` | 否 | 服务器将广播的 URI，例如 `tcp://0.0.0.0:10300` |
| `download-dir` | 是 | 下载模型的目录 (默认: ) |
| `language` | 是 | 设置转录的默认语言，默认: `en-GB` |
| `update-languages` | 是 | 启动时下载最新的 languages.json |
| `debug` | 是 | 记录调试消息 |