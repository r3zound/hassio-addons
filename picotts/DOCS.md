## Homeassistant 集成

为了便于集成，我还发布了一个 [自定义组件](https://github.com/Poeschl/Remote-PicoTTS)。  
它可以在 HACS 上找到，便于集成。

## 请求

### Ping

`http://ip:59126/ping`

### TTS

`http://ip:59126/speak?lang=<language>&text=<text>`

`language` 可以是以下之一 `de-DE, en-GB, en-US, es-ES, fr-FR, it-IT`。如果不设置，则默认为 `en-US`。  
`text` 是您希望合成的文本（url编码）。