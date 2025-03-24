# HPLIP 打印机应用程序

## 介绍

该存储库包含一个打印机应用程序，可以在 HP 和 Apollo 打印机上进行打印，这些打印机由 HP 的 HPLIP 驱动程序套件支持。

它使用 [PAPPL](https://www.msweet.org/pappl) 来支持来自多个操作系统的 IPP 打印。此外，它还利用 [cups-filters 2.x](https://github.com/OpenPrinting/cups-filters)（libcupsfilters、libppd 中的过滤器功能）和 [pappl-retrofit](https://github.com/OpenPrinting/pappl-retrofit)（将传统 CUPS 驱动程序封装在打印机应用程序中）的资源。该工作（或现在的 pappl-retrofit 代码）源自 [hp-printer-app](https://github.com/michaelrsweet/hp-printer-app)。

打印机驱动程序本身以及与打印机硬件通信的软件来自 [HPLIP（HP Linux 图像和打印）驱动程序套件](https://developers.hp.com/hp-linux-imaging-and-printing/)，同时也提供有关支持的打印机型号及其功能的信息。

欢迎您的贡献。请发布 [问题和拉取请求](https://github.com/OpenPrinting/hplip-printer-app)。

对于 PostScript 打印机，您还可以使用 [PostScript 打印机应用程序](https://github.com/OpenPrinting/ps-printer-app)，特别是如果您已经为某些非 HP PostScript 打印机安装了它。

还需要检查您的打印机是否为无驱动的 IPP 打印机（AirPrint、Mopria、IPP Everywhere、Wi-Fi Direct Print、手机打印），因为在这种情况下您根本不需要任何打印机应用程序。大多数现代 HP 打印机，甚至最便宜的型号，都是无驱动的 IPP 打印机。即使是仅通过 USB 连接的打印机也可以是无驱动的 IPP，并且您通常可以通过 USB 使用无驱动的 IPP，首先尝试 [ipp-usb](https://github.com/OpenPrinting/ipp-usb)。

### 属性

- 提供 `hpcups` 打印机驱动程序和 HPLIP 所有打印机的 PPD 的打印机应用程序，支持在 HP 和 Apollo 的大多数打印机上进行打印。这允许高质量的轻松打印，包括在照片纸上的照片。还包括用于在 PostScript 打印机上进行 PIN 保护打印的 `hpps` CUPS 过滤器。

- 打印机会通过 HPLIP 被发现。对于 USB 打印机，使用 `hp` CUPS 后端，对于网络打印机，使用 `hp-probe` 工具（封装在脚本中以表现为 CUPS 后端）。

- 与打印机的通信通过 `hp` CUPS 后端完成，因此（至少在 USB 情况下）会使用 IEEE-1284.4 数据包协议（USB 上的协议 7/1/3），而不是简单的流协议（如标准 CUPS 和 PAPPL 后端所使用的）。通过这种方式，用户应该能够同时打印和扫描，或者至少在打印时检查打印机状态。并非所有打印机都支持该协议，如果不支持，则会使用标准流协议。同时，任何其他需要`hp`后端的特殊功能也受支持。在“添加打印机”网页界面下的“设备”中选择“HPLIP (HP)”条目。

- 请注意，`hp` 后端不允许对打印机进行双向访问。如果您有 PostScript 打印机并更喜欢支持远程查询打印机的附件配置而不是同时打印和扫描，CUPS 的标准后端也可用于 USB 和网络打印机。

- 如果您有不寻常的系统配置或个人防火墙，HP 的后端可能无法发现您的打印机。在这种情况下，标准后端，包括与主机名/IP 字段组合的完全手动“网络打印机”条目可能会有所帮助。

- 使用 CUPS 的标准后端而非 PAPPL 的标准后端，使得对于使用兼容性问题的 USB 打印机的微调解决方案更加易于操作（并且可以编辑），并且输出可以通过 IPP、IPPS（加密！）和 LPD 发送到打印机，此外还有套接字（通常是 9100 端口）。SNMP 后端可以配置（社区、地址范围）。

- PWG Raster、Apple Raster 或要打印到非 PostScript 打印机的图像输入数据不会被转换为 PostScript 或 PDF，而是仅被转换/缩放到所需的颜色空间和分辨率，然后输入到 `hpcups` 驱动程序中。

- 对于在非 PostScript 打印机上的打印，PDF 和 PostScript 输入数据会使用 Ghostscript 渲染为光栅数据。Ghostscript 也被用于将 PDF 转换为 PostScript 以供 PostScript 打印机使用。

- 有关支持的打印机型号及其功能的信息基于 HPLIP 中包含的 PPD 文件。它们以压缩档案的形式打包在 Snap 中。

- 标准作业 IPP 属性被映射到与之最契合的驱动程序选项设置，以便用户可以从任何类型的客户端（例如手机或物联网设备）进行打印，只要该客户端仅支持标准 IPP 属性，且无法检索 PPD 选项。可以轻松映射纸盒、介质大小、介质类型和双面打印，但涉及颜色和质量时会变得更复杂，因为相关选项在 PPD 文件中差异很大。在这里，我们使用一种算法，自动找到针对每个 `print-color-mode`（`color`/`monochrome`）、`print-quality`（`draft`/`normal`/`high`）和 `print-content-optimize`（`auto`/`photo`/`graphics`/`text`/`text-and-graphics`）组合的选项设置（谁愿意手动编辑 ~3000 个 PPD 文件进行分配）。因此，您可以轻松访问打印机的全质量或速度，而无需处理特定于打印机的选项设置（原始选项仍可通过网页管理界面访问）。

- HPLIP 打印机应用程序的 Snap 取自 Debian 的打包仓库而非直接来自 HP，因为 Debian 的包中有大约 80 个修补程序修复了报告给 HP 但未在上游采用的错误。因此，使用 Snap 用户应该可以获得与 Debian 包相同的可靠性和质量体验。

- 通过网页界面的附加页面支持下载 HPLIP 的专有插件。这为某些需要每次打开时加载其固件或使用某些专有打印数据格式的激光打印机添加了支持。这在 Snap 和打印机应用程序的经典安装中均可使用（必须以 root 身份运行，否则只能检查插件状态）。

<!-- 开始包含组件 -->
## 包含组件
  - pappl v1.4.8
  - qpdf v11.9.1
  - ghostscript ghostpdl-10.05.0-test-base-001
  - cups v2.4.11
  - libcupsfilters 2.1.0
  - libppd 2.1.0
  - pyppd release-1-1-0
  - hplip debian/3.22.10+dfsg0-5
<!-- 结束包含组件 -->

## 法律声明

HPLIP 打印机应用程序版权 © 2020 由 Till Kamppeter 所有。

它源自 HP PCL 打印机应用程序，这是一个使用 PAPPL 的光栅打印机应用程序的首次工作模型。它可以在这里找到：

https://github.com/michaelrsweet/hp-printer-app

HP PCL 打印机应用程序版权 © 2019-2020 由 Michael R Sweet 所有。

该软件根据 Apache 许可证第 2.0 版获得许可，具有允许链接到 GPL2/LGPL2 软件（例如早期版本的 CUPS）的例外。有关更多信息，请参见“LICENSE”和“NOTICE”文件。