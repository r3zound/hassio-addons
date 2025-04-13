# HPLIP 打印机应用程序

## 介绍

该代码库包含一个打印机应用程序，用于在 HP 和 Apollo 打印机上打印，这些打印机受 HP 的 HPLIP 驱动程序套件支持。

它使用 [PAPPL](https://www.msweet.org/pappl) 来支持来自多个操作系统的 IPP 打印。此外，它利用了 [cups-filters 2.x](https://github.com/OpenPrinting/cups-filters) 的资源（libcupsfilters、libppd 中的过滤器功能）和 [pappl-retrofit](https://github.com/OpenPrinting/pappl-retrofit)（在打印机应用程序中封装经典 CUPS 驱动程序）。这一工作（或现在的 pappl-retrofit 代码）源自 [hp-printer-app](https://github.com/michaelrsweet/hp-printer-app)。

打印机驱动程序本身以及与打印机硬件通信的软件来自 [HPLIP (HP Linux Imaging and Printing) 驱动程序套件](https://developers.hp.com/hp-linux-imaging-and-printing/)，还包括有关支持的打印机型号及其功能的信息。

欢迎您的贡献。请提交 [问题和拉取请求](https://github.com/OpenPrinting/hplip-printer-app)。

对于 PostScript 打印机，您还可以使用 [PostScript 打印机应用程序](https://github.com/OpenPrinting/ps-printer-app)，尤其是如果您已经为某些非 HP PostScript 打印机安装了它。

还请检查您的打印机是否为无驱动 IPP 打印机（AirPrint、Mopria、IPP Everywhere、Wi-Fi Direct Print、手机打印），在这种情况下，您根本不需要任何打印机应用程序。大多数现代 HP 打印机，甚至是最便宜的型号，都是无驱动 IPP 打印机。即使是仅通过 USB 连接的打印机也可以是无驱动 IPP，您一般可以通过 USB 使用无驱动 IPP，针对这些情况，请先尝试 [ipp-usb](https://github.com/OpenPrinting/ipp-usb)。

### 特性

- 一个提供 `hpcups` 打印机驱动程序和 HPLIP 所有打印机 PPD 的打印机应用程序，支持大多数 HP 和 Apollo 打印机的打印。这允许在高质量下轻松打印，包括在相纸上打印照片。还包括用于在 PostScript 打印机上进行 PIN 保护打印的 `hpps` CUPS 过滤器。

- 打印机也通过 HPLIP 被发现。对于 USB 打印机，使用 `hp` CUPS 后端，对于网络打印机，使用 `hp-probe` 工具（封装在一个脚本中以表现为 CUPS 后端）。

- 与打印机的通信是通过 `hp` CUPS 后端进行的，因此（至少在 USB 的情况下）使用 IEEE-1284.4 数据包协议（USB 上的协议 7/1/3），而不是简单的流协议（如标准 CUPS 和 PAPPL 后端所使用的）。这样应该能够实现打印和扫描的同时进行，或者至少在打印时检查打印机状态。并非所有打印机都支持此协议，如果不支持，则使用标准的流协议。同时也支持任何其他需要 `hp` 后端的特殊功能。在“添加打印机”的网页界面下，在“设备”中选择“HPLIP (HP)”条目。

- 请注意，`hp` 后端不允许双向访问打印机。如果您有 PostScript 打印机，并且更喜欢支持远程查询打印机的配件配置，而不是同时打印和扫描，则可以使用 CUPS 针对 USB 和网络打印机的标准后端。

- 如果您有不寻常的系统配置或个人防火墙，HP 的后端可能无法发现您的打印机。在这种情况下，标准后端，包括完全手动的“网络打印机”条目，结合主机名/IP 字段，可以有所帮助。

- 使用 CUPS 的标准后端而不是 PAPPL 的标准后端，使得使用兼容性问题的 USB 打印机的怪癖工作方式可以被使用（并且可以编辑），并且输出可以通过 IPP、IPPS（加密！）和 LPD 发送到打印机，除了 socket（通常是端口 9100）。可以配置 SNMP 后端（社区、地址范围）。

- PWG Raster、Apple Raster 或图像输入数据在非 PostScript 打印机上打印时不会转换为 PostScript 或 PDF，它仅转换/缩放到所需的色彩空间和分辨率，然后输入到 `hpcups` 驱动程序中。

- 对于在非 PostScript 打印机上的打印，PDF 和 PostScript 输入数据将使用 Ghostscript 渲染为光栅数据。Ghostscript 还用于将 PDF 转换为 PostScript，以便于 PostScript 打印机。

- 关于支持哪些打印机型号及其功能的信息基于包含在 HPLIP 中的 PPD 文件。它们被打包在 Snap 中，作为压缩档案。

- 标准作业 IPP 属性被映射到最适合的驱动程序选项设置，以便用户可以从任何类型的客户端（例如手机或 IoT 设备）打印，而这些客户端仅支持标准 IPP 属性，并且无法检索 PPD 选项。纸盘、媒体大小、媒体类型和双面打印可以轻松映射，但当涉及到颜色和质量时则变得更加复杂，因为 PPD 文件中的相关选项差异很大。在这里，我们使用一种算法，该算法会自动找到每种 `print-color-mode`（`color`/`monochrome`）、`print-quality`（`draft`/`normal`/`high`）和 `print-content-optimize`（`auto`/`photo`/`graphics`/`text`/`text-and-graphics`）组合的正确选项设置（谁想要手动编辑约 3000 个 PPD 文件进行分配）。因此，您可以轻松地访问打印机的全部质量或速度，而无需处理特定于打印机的选项设置（原始选项仍可通过网页管理界面访问）。

- HPLIP 打印机应用程序的 Snap 从 Debian 的打包存储库获取 HPLIP 的源代码，而不是直接从 HP，因为 Debian 的包有大约 80 个修补程序修复了报告给 HP 的错误，但修补程序没有被上游采纳。因此，通过 Snap，用户应获得与 Debian 包相同的可靠性和质量体验。

- 支持通过网页界面中的额外页面下载 HPLIP 的专有插件。这为某些每次开启时需要加载其固件或使用某些专有打印数据格式的激光打印机提供支持。这在 Snap 和打印机应用程序的经典安装中均有效（必须以 root 身份运行，否则只能检查插件的状态）。

<!-- 开始包含的组件 -->
## 包含的组件
  - pappl v1.4.8
  - qpdf v11.9.1
  - ghostscript ghostpdl-10.05.0-test-base-001
  - cups v2.4.11
  - libcupsfilters 2.1.0
  - libppd 2.1.0
  - pyppd release-1-1-0
  - hplip debian/3.22.10+dfsg0-5
<!-- 结束包含的组件 -->

## 法律声明

HPLIP 打印机应用程序版权所有 © 2020 Till Kamppeter。

它源自 HP PCL 打印机应用程序，这是使用 PAPPL 的光栅打印机应用程序的第一个工作模型。可在此处找到：

https://github.com/michaelrsweet/hp-printer-app

HP PCL 打印机应用程序版权所有 © 2019-2020 Michael R Sweet。

本软件根据 Apache 许可证版本 2.0 进行许可，并对链接 GPL2/LGPL2 软件（如较旧版本的 CUPS）做了例外。有关更多信息，请参见“LICENSE”和“NOTICE”文件。