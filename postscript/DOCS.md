# PostScript 打印机应用程序

## 介绍

此存储库包含一个针对 PostScript 打印机的打印机应用程序，该应用程序使用 [PAPPL](https://www.msweet.org/pappl) 来支持来自多个操作系统的 IPP 打印。此外，它利用 [cups-filters 2.x](https://github.com/OpenPrinting/cups-filters)（libcupsfilters、libppd 中的过滤器功能）和 [pappl-retrofit](https://github.com/OpenPrinting/pappl-retrofit)（将经典 CUPS 驱动程序封装在打印机应用程序中）的资源。此工作（或现有的 pappl-retrofit 代码）源自 [hp-printer-app](https://github.com/michaelrsweet/hp-printer-app)。

欢迎您的贡献。请发布 [问题和拉取请求](https://github.com/OpenPrinting/ps-printer-app)。

### 此打印机应用程序是一个工作模型

- 一个非点阵打印机应用程序：目标格式为 PostScript，这是一个高级/矢量格式。接受 PostScript 或 PDF 中的输入数据，并在没有任何中间点阵步骤的情况下进行必要的转换。

- 一个使用 cups-filters 2.x 新过滤器功能的打印机应用程序。过滤器功能是源自 CUPS 过滤器的库函数，从 2000 年 CUPS 引入开始，经过数十年的开发和改进。

- 一个经典 CUPS 驱动程序的改造打印机应用程序，在这种情况下，仅支持 PostScript 打印机的 PPD 文件的最简单形式。它列出了包含在 Snap 中的库中的 PPD 文件，加载实际打印机所需的 PPD，从 PPD 中提取选项以在网络界面中显示，接受作为 IPP 属性的作业设置，并正确地将 PPD 提供的 PostScript 代码插入到输出数据流中。

- 一个不通过原始（输入格式为打印机的本机格式）作业的打印机应用程序。为确保始终将 PPD 文件的 PostScript 代码插入到输出流中，我们将打印机的本机格式称为“application/vnd.printer-specific”，该格式不存在作为输入格式，因此通过 pstops() 过滤器函数强制使用“application/postscript”输入。

- 一个可扩展的打印机应用程序：用户可以通过管理网页接口添加 PPD 文件，以支持其他打印机型号。

进一步的属性有：

- 为了避免重新发明用于分叉到子进程的代码，以便我们可以通过一系列过滤器传递数据，我们创建了一个过滤器函数将数据发送到打印机，并使用 filterChain() 过滤器函数形成实际转换过滤器函数（pstops() 和 pdftops() 中的一个）与此过滤器函数的链。

- 对于 PWG/Apple Raster 输入，我们使用栅格回调，使得处理是流式的，允许处理大型甚至无限长的作业。我们使用 libppd 函数将 PPD 选项的 PostScript 代码插入到输出流中，并使用 filterPOpen() 函数为 libppd 函数创建一个文件描述符，以将数据发送到设备。

- PostScript 打印机应用程序 Snap 内置了 [foomatic-db](https://github.com/OpenPrinting/foomatic-db) 和 [HPLIP](https://developers.hp.com/hp-linux-imaging-and-printing) 项目的所有 PostScript PPD 文件，因此大多数通常与 Linux 发行版一起提供的 PostScript 打印机 PPD。为避免这个庞大的 PPD 数量增加 Snap 的大小，我们使用 [pyppd](https://github.com/OpenPrinting/pyppd) 对其进行高度压缩。请注意某些 PPD 使用特定的 CUPS 过滤器以获得额外功能。这些过滤器包含在 Snap 中，因此支持额外功能（在大多数情况下为 PIN 保护打印）。用户可以添加额外的 PPD，而无需重新构建 Snap（见下文）。

- 我们使用打印机的 IEEE-1284 设备 ID 首先识别它是一个 PostScript 打印机（通过 CMD: 字段）以查看它是否被支持，然后再通过制造商和型号检查我们是否明确支持它的 PPD。没有 PPD 的 PostScript 打印机将分配一个通用 PPD。通过在制造商/型号查找之前检查 CMD: 字段，我们确保如果 PostScript 是由附加模块提供的，则该模块实际上已安装。

- 标准作业 IPP 属性被映射到最合适的 PPD 选项设置，以便用户可以从任何类型的客户端（例如手机或 IoT 设备）进行打印，后者仅支持标准 IPP 属性而无法检索 PPD 选项。纸盘、介质大小、介质类型和双面打印可以轻松映射，但当涉及到颜色和质量时会变得更加复杂，因为相关选项在 PPD 文件中差异很大。在这里，我们使用一个算法自动（谁想手动编辑 ~10000 个 PPD 进行分配）为当前打印机的 PPD 中的每个 `print-color-mode`（`color`/`monochrome`）、`print-quality`（`draft`/`normal`/`high`）和 `print-content-optimize`（`auto`/`photo`/`graphics`/`text`/`text-and-graphics`）组合找到正确的选项设置。因此，您可以轻松访问打印机的全部质量或速度，而无需处理特定于打印机的选项设置（原始选项仍可通过网络管理界面访问）。

- 特定打印机型号（打印机应用程序中的“驱动程序”）的打印机功能在打印机应用程序中设置的打印队列的整个生命周期中不是静态的。用户可以通过网页管理界面中的页面配置打印机上安装了哪些硬件附件（额外纸盘、双面单元、整理器……），并且打印机应用程序会更新驱动程序数据结构以及打印机功能。对 get-printer-attributes IPP 请求的响应将适当地更新。

- PostScript 是一门功能强大的编程语言，许多 PostScript 打印机允许查询选项设置和可安装的硬件附件的存在，并执行相应的 PostScript 代码。如果可以查询设置，制造商会将所需的 PostScript 代码放入 PPD 文件中，以及可查询的选项。这些查询可以通过打印机应用程序的网页界面进行支持。

- 可用的打印设备通过 CUPS 的后端进行发现（和使用），而不是通过 PAPPL 自身的后端。这样便使用了 USB 打印机的兼容性问题的故障绕过（并且可编辑），并且除了插座（通常是 9100 端口）外，PostScript 输出还可以通过 IPP、IPPS（加密！）和 LPD 发送到打印机。可以配置 SNMP 后端（社区，地址范围）。

- 如果您有不寻常的系统配置或个人防火墙，您的打印机可能无法被发现。在这种情况下，完全手动的“网络打印机”条目与主机名/IP 字段的组合可能会很有帮助。

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

## 法律事项

PostScript 打印机应用程序版权 © 2020 由 Till Kamppeter 拥有。

它源自 HP PCL 打印机应用程序，这是一个使用 PAPPL 的点阵打印机应用程序的第一个工作模型。可以在这里获取：

https://github.com/michaelrsweet/hp-printer-app

HP PCL 打印机应用程序版权 © 2019-2020 由 Michael R Sweet 拥有。

此软件根据 Apache 许可证第 2.0 版授权，允许链接到 GPL2/LGPL2 软件（如较旧版本的 CUPS）。有关更多信息，请参见“LICENSE”和“NOTICE”文件。