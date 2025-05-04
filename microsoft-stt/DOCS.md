# 怀俄明 Microsoft STT
怀俄明协议服务器用于 Microsoft Azure 语音转文本。

这个 Python 包提供了用于 Microsoft Azure 语音转文本的怀俄明集成，可以直接与 [Home Assistant](https://www.home-assistant.io/) 语音和 [Rhasspy](https://github.com/rhasspy/rhasspy3) 一起使用。

## Azure 语音服务
本程序使用 [Microsoft Azure 语音服务](https://learn.microsoft.com/en-us/azure/ai-services/speech-service/)。您可以注册一个免费的 Azure 帐户，此帐户提供每月 5 个音频小时的免费配额，这对于运行语音助手来说应该足够，因为每个命令相对较短。一旦超出此金额，Azure 可能会对每使用的秒数收费（当前价格为每音频小时 $0.36）。我不对任何产生的费用负责，并建议您设置支出限制以减少风险。然而，对于正常使用，免费配额应该足够，而且资源不应该自动切换到付费服务。

如果您尚未设置语音资源，可以按照以下说明进行操作。（您只需执行一次，适用于 [语音转文本](https://github.com/hugobloem/wyoming-microsoft-stt) 和 [文本转语音](https://github.com/hugobloem/wyoming-microsoft-tts)）

1. 登录或在 [portal.azure.com](https://portal.azure.com) 上创建帐户。
2. 通过在搜索栏中搜索 `subscription` 创建订阅。[更多信息请参阅 Microsoft Learn](https://learn.microsoft.com/en-gb/azure/cost-management-billing/manage/create-subscription#create-a-subscription-in-the-azure-portal)。
3. 通过搜索 `speech service` 创建语音资源。
4. 选择您创建的订阅，选择或创建资源组，选择区域，选择一个可识别的名称，并选择定价层（您可能想选择免费 F0）。
5. 创建完成后，从语音服务页面复制其中一个密钥。您需要这个密钥来运行本程序。

## 安装
根据您的使用情况，有不同的安装选项。

- **使用 pip**
  克隆仓库并使用 pip 安装该包。请注意平台要求，如 [此处](https://learn.microsoft.com/en-us/azure/ai-services/speech-service/quickstarts/setup-platform?tabs=linux%2Cubuntu%2Cdotnetcli%2Cdotnet%2Cjre%2Cmaven%2Cnodejs%2Cmac%2Cpypi&pivots=programming-language-python#platform-requirements) 所述。
  ```sh
  pip install .
  ```

- **Home Assistant 插件**
  将以下仓库作为附加仓库添加到您的 Home Assistant，或点击下面的按钮。
  [https://github.com/hugobloem/homeassistant-addons](https://github.com/hugobloem/homeassistant-addons)

  [![打开您的 Home Assistant 实例并显示添加附加组件仓库对话框，特定仓库 URL 预填充。](https://my.home-assistant.io/badges/supervisor_add_addon_repository.svg)](https://my.home-assistant.io/redirect/supervisor_add_addon_repository/?repository_url=https%3A%2F%2Fgithub.com%2Fhome-assistant%2Faddons-example)

- **Docker 容器**
  敬请期待...

## 使用
根据安装方法，参数的解析方式不同。然而，每种安装方法使用相同的选项，详见下表。您的服务区域和订阅密钥可以在语音服务资源页面（Azure 语音服务说明的第 5 步）找到。

对于裸机 Python 安装，程序运行如下：
```python
python -m wyoming-microsoft-stt --<key> <value>
```

| 键 | 可选 | 描述 |
|---|---|---|
| `service-region` | 否 | Azure 服务区域，例如 `uksouth` |
| `subscription-key` | 否 | Azure 订阅密钥 |
| `uri` | 否 | 服务器将广播的 URI，例如 `tcp://0.0.0.0:10300` |
| `download-dir` | 是 | 下载模型的目录（默认：） |
| `language` | 是 | 设置转录的默认语言，默认：`en-GB` |
| `update-languages` | 是 | 在启动时下载最新的 languages.json |
| `debug` | 是 | 记录调试消息 |