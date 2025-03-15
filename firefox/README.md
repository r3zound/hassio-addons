# Home Assistant 插件：Firefox

_在 Home Assistant 内部运行 Firefox 作为浏览器，以便从您的家中访问本地或外部网站。_

![支持 aarch64 架构][aarch64-shield]
![支持 amd64 架构][amd64-shield]
![支持 armv7 架构][armv7-shield]
![支持 i386 架构][i386-shield]

## 关于

Mozilla Firefox 是由 Mozilla 基金会及其子公司 Mozilla Corporation 开发的自由和开源网页浏览器。

此插件基于 [Jocelyn Le Sage](https://github.com/jlesage) 的 [docker 镜像](https://github.com/jlesage/docker-firefox)。

非常感谢他创建和维护的优秀容器。
他是真正需要被 [支持](https://github.com/sponsors/jlesage) 的英雄。

## 与原始容器的区别

为了使其与 Home Assistant 持久化兼容，我需要重新映射文件夹，因此启动脚本以 `root` 身份运行。我将尽量避免将来这样做。

## 如何使用

只需安装，启动容器并点击“打开 Web UI”。您可以使用“在侧边栏中显示”以便于访问。您所做的一切都将保存在 Firefox 中。即使您停止插件或重新启动 Home Assistant 主机操作系统，数据也会被保留。

## 下载

在 Firefox 中下载的文件会自动存储到您的 `/share/firefox` 文件夹中。

## 上传

如果您需要通过 Firefox 插件上传文件，可以使用 [文件编辑器插件](https://github.com/home-assistant/addons/blob/master/configurator/) 将文件上传到您的 `/share/firefox` 文件夹。
这些文件将在插件的 `downloads` 文件夹中可用。选择文件进行上传时，您可以浏览到该位置。

## 导入书签

您可以通过将 `bookmarks.html` 文件放入您的 `/share/firefox` 文件夹中来导入该文件，然后在 Firefox 中导入 `bookmarks.html` 文件。

[aarch64-shield]: https://img.shields.io/badge/aarch64-yes-green.svg
[amd64-shield]: https://img.shields.io/badge/amd64-yes-green.svg
[armv7-shield]: https://img.shields.io/badge/armv7-yes-green.svg
[i386-shield]: https://img.shields.io/badge/i386-yes-green.svg