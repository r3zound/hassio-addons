# 配置

```yaml
language: de
```

### `language`

可选的语言之一 `de`、`en`、`fr`、`it`、`in`、`tu` 和 `lu`。这应该与您在 Home Assistant 中配置的相同。
语音根据需求下载。

### `voice`（可选）

这指定了自定义语音包的 URL。确保它是一个 zip 文件，并且里面包含 lib 文件夹中的 voice.jar。

# 用户界面

MaryTTS 的 Demo-UI 可通过 `http://<hassio-address>:59125` 访问。