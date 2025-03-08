# Home Assistant 附加组件: 文件编辑器

基于浏览器的 Home Assistant 配置文件编辑器。

![支持 aarch64 架构][aarch64-shield] ![支持 amd64 架构][amd64-shield] ![支持 armhf 架构][armhf-shield] ![支持 armv7 架构][armv7-shield] ![支持 i386 架构][i386-shield]

![Home Assistant 前端中的配置器][screenshot]

## 关于

文件编辑器（之前称为配置器）是一个小型 Web 应用程序（您通过 Web 浏览器访问它），提供文件系统浏览器和文本编辑器，以修改文件，这些文件编辑器正在运行的机器上。

它由 Ace 编辑器提供支持，支持多种代码/标记语言的语法高亮。YAML 文件（Home Assistant 配置文件的默认语言）在编辑时会自动检查语法错误。

## 特性

- 基于网页的编辑器，可用语法高亮和 YAML 检查来修改您的文件。
- 上传和下载文件。
- 在 Git 仓库中暂存、存储和提交更改，创建和切换分支，推送到远程，查看差异。
- 列出可用的实体、触发器、事件、条件和服务。
- 通过点击按钮直接重启 Home Assistant。还可以重新加载组、自动化等。需要 API 密码。
- 直接链接到 Home Assistant 文档和图标。
- 在附加组件容器内执行 shell 命令。
- 编辑器设置保存在您的浏览器中。
- 以及更多…

[aarch64-shield]: https://img.shields.io/badge/aarch64-yes-green.svg
[amd64-shield]: https://img.shields.io/badge/amd64-yes-green.svg
[armhf-shield]: https://img.shields.io/badge/armhf-yes-green.svg
[armv7-shield]: https://img.shields.io/badge/armv7-yes-green.svg
[i386-shield]: https://img.shields.io/badge/i386-yes-green.svg
[screenshot]: https://github.com/home-assistant/hassio-addons/raw/master/configurator/images/screenshot.png