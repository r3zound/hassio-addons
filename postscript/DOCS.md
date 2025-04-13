# PostScript 打印机应用程序

## 简介

本仓库包含一个用于 PostScript 打印机的打印机应用程序，使用 [PAPPL](https://www.msweet.org/pappl) 支持多个操作系统的 IPP 打印。此外，它还使用 [cups-filters 2.x](https://github.com/OpenPrinting/cups-filters) 的资源（libcupsfilters、libppd 中的过滤功能）以及 [pappl-retrofit](https://github.com/OpenPrinting/pappl-retrofit)（将经典的 CUPS 驱动程序封装在打印机应用程序中）。此工作（或现在的 pappl-retrofit 代码）源于 [hp-printer-app](https://github.com/michaelrsweet/hp-printer-app)。

欢迎您的贡献。请提交 [问题和拉取请求](https://github.com/OpenPrinting/ps-printer-app)。

### 此打印机应用程序是以下工作的模型

- 一个非光栅的打印机应用程序：目标格式为 PostScript，属于高级/矢量格式。接受 PostScript 或 PDF 格式的输入数据，并在没有任何中间光栅步骤的情况下进行所需的转换。

- 一个使用 cups-filters 2.x 新过滤功能的打印机应用程序。过滤功能是从 CUPS 过滤器派生的库函数，经历了几十年的开发和完善，自 2000 年引入 CUPS 以来不断进步。

- 一个为经典 CUPS 驱动程序提供的改装打印机应用程序，在这种情况下，仅使用 PostScript 打印机的 PPD 文件的最简单形式。它列出来自 Snap 中包含的存储库的 PPD 文件，为实际打印机加载所需的 PPD，从 PPD 提取选项以在 Web 界面中显示，接受作为 IPP 属性的作业设置，并将 PPD 提供的 PostScript 代码正确插入输出数据流。

- 一个不直接通过原始（输入格式是打印机的本机格式）作业的打印机应用程序。为了确保始终将 PPD 文件的 PostScript 代码插入输出流，我们将打印机的本机格式称为“application/vnd.printer-specific”，该格式实际上并不存在，因而 “application/postscript” 输入被强制通过 pstops() 过滤函数处理。

- 一个可扩展的打印机应用程序：用户可以通过管理 Web 界面添加 PPD 文件，以支持更多的打印机型号。

进一步的属性包括：

- 为避免重新发明将数据传递到子进程中的代码，我们创建了一个过滤函数，将数据发送到打印机，并通过使用 filterChain() 过滤函数形成实际转换过滤函数（pstops() 和 pdftops() 之一）的链。

- 对于 PWG/Apple Raster 输入，我们使用光栅回调，以便处理过程是流式的，允许处理大的甚至无限长的作业。我们使用 libppd 函数将 PPD 选项的 PostScript 代码插入输出流，并使用 filterPOpen() 函数为 libppd 函数创建一个文件描述符，以将数据发送到设备。

- PostScript 打印机应用程序 Snap 内置了 [foomatic-db](https://github.com/OpenPrinting/foomatic-db) 和 [HPLIP](https://developers.hp.com/hp-linux-imaging-and-printing) 项目的所有 PostScript PPD 文件，因此大多数 PostScript 打印机 PPD 通常随 Linux 发行版提供。为了避免大量 PPD 文件使 Snap 体积过大，我们使用 [pyppd](https://github.com/OpenPrinting/pyppd) 对其进行高度压缩。请注意，一些 PPD 文件使用某些 CUPS 过滤器来提供附加功能。这些过滤器已包含在 Snap 中，因此大多数情况下支持附加功能（如 PIN 保护打印）。用户可以在无需重建 Snap 的情况下添加额外的 PPD 文件（见下文）。

- 我们使用打印机的 IEEE-1284 设备 ID 首先识别它是否为 PostScript 打印机（通过 CMD: 字段），以查看它是否被支持，然后再通过制造商和型号检查我们是否显式地用 PPD 支持它。对于没有 PPD 的 PostScript 打印机，会分配一个通用 PPD。通过在进行制造商/型号查找前检查 CMD: 字段，我们确保如果通过附加模块提供了 PostScript，则该模块实际上已被安装。

- 标准作业 IPP 属性映射到与之最匹配的 PPD 选项设置，以便用户可以从任何支持标准 IPP 属性且无法检索 PPD 选项的客户端（例如手机或 IoT 设备）进行打印。纸盘、介质大小、介质类型和双面打印可以很容易地进行映射，但在涉及到颜色和质量时会更复杂，因为相关选项在 PPD 文件中差异很大。在这里，我们使用一种算法，它自动（谁想手动编辑 ~10000 个 PPD 进行分配）为当前打印机的 PPD 中每个 `print-color-mode`（`color`/`monochrome`）、`print-quality`（`draft`/`normal`/`high`）和 `print-content-optimize`（`auto`/`photo`/`graphics`/`text`/`text-and-graphics`）组合找到正确的选项设置。因此，您可以轻松访问打印机的全部质量或速度，而无需处理特定于打印机的选项设置（原始选项仍可以通过 Web 管理界面访问）。

- 对于给定打印机模型的打印机功能（打印机应用程序中的“驱动程序”），在打印队列的整个生命周期中并非静态。用户可以通过 Web 管理界面中的页面配置安装在打印机上的硬件附件（额外纸盘、双面单元、整理机等），并且打印机应用程序会更新驱动程序数据结构，从而更新打印机功能。对 get-printer-attributes IPP 请求的响应会相应更新。

- PostScript 是一种功能齐全的编程语言，许多 PostScript 打印机允许查询选项设置和可安装硬件附件的存在，执行相应的 PostScript 代码。如果可以查询某个设置，制造商会将所需的 PostScript 代码放入 PPD 文件中，并将可查询的选项一起提供。这些查询由打印机应用程序的 Web 界面支持。

- 可用的打印机设备通过 CUPS 的后端被发现（并使用），而不是使用 PAPPL 自身的后端。这样可以使用 USB 打印机的兼容性问题的变通办法（并且是可编辑的），此外，通过 IPP、IPPS（加密！）和 LPD 发送 PostScript 输出到打印机，还支持套接字（通常为 9100 端口）。SNMP 后端可以配置（社区、地址范围）。

- 如果您有不寻常的系统配置或个人防火墙，您的打印机可能不会被发现。在这种情况下，完全手动的“网络打印机”条目与主机名/IP 字段的结合可能会有帮助。

<!-- Begin Included Components -->
## 包含的组件
  - pappl v1.4.8
  - qpdf v11.9.1
  - ghostscript ghostpdl-10.05.0-test-base-001
  - cups v2.4.11
  - libcupsfilters 2.1.0
  - libppd 2.1.0
  - cups-filters 2.0.1
  - pyppd release-1-1-0
  - foomatic-db 20240504
  - hplip debian/3.22.10+dfsg0-5
<!-- End Included Components -->

## 法律声明

PostScript 打印机应用程序 © 2020 由 Till Kamppeter 版权所有。

它源于 HP PCL 打印机应用程序，这是一个首次成功使用 PAPPL 的光栅打印机应用程序模型。它可以在以下地址找到：

https://github.com/michaelrsweet/hp-printer-app

HP PCL 打印机应用程序 © 2019-2020 由 Michael R Sweet 版权所有。

该软件根据 Apache 许可证版本 2.0 进行许可，特别允许与 GPL2/LGPL2 软件（如 CUPS 的旧版本）链接。有关更多信息，请参见“LICENSE”和“NOTICE”文件。