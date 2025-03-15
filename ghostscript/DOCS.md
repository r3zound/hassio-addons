# Ghostscript 打印机应用程序

## 介绍

此代码库包含适用于 Ghostscript 内置打印机驱动程序和一些额外过滤器的打印机应用程序。

它使用 [PAPPL](https://www.msweet.org/pappl) 支持来自多个操作系统的 IPP 打印。此外，它还使用 [cups-filters 2.x](https://github.com/OpenPrinting/cups-filters)（libcupsfilters、libppd 中的过滤器功能）和 [pappl-retrofit](https://github.com/OpenPrinting/pappl-retrofit)（将经典 CUPS 驱动程序封装到打印机应用程序中）的资源。该工作（或者现在的 pappl-retrofit 代码）源自 [hp-printer-app](https://github.com/michaelrsweet/hp-printer-app)。

有关打印机功能和驱动程序使用信息，将使用 OpenPrinting 的 Foomatic 数据库（通过打印机 [在线访问](http://www.openprinting.org/printers/)，通过驱动程序 [在线访问](http://www.openprinting.org/drivers/)，[下载](http://github.com/OpenPrinting/foomatic-db)）。

欢迎你的贡献。请发布 [问题和拉取请求](https://github.com/OpenPrinting/ghostscript-printer-app)。


### 包含的打印机驱动程序

- **Ghostscript 内置**:
  ```
  ap3250, appledmp, bj10e, bj10vh, bj10v, bj10, bj200, bj8XXYYZ.upp,
  bjc250gs, bjc600, bjc800, bjc880j, cdj500, cdj550, cdnj500, chp2200,
  cljet5, cp50, declj250, deskjet, dj505j, djet500, dnj650c,
  eplaser-jp, eplaser, eps9high, eps9mid, epsonc, epson, escpage,
  fmlbp, fmpr, gdi, hl1250, hl7x0, ibmpro, imagen, iwhi, jetp3852,
  jj100, la50, la70, la75plus, la75, laserjet, lbp310, lbp320, lbp8,
  lex5700, lex7000, lips2p, lips3, lips4v, lips4, lj250, lj4dithp,
  lj4dith, lj5gray, ljet2p, ljet3d, ljet3, ljet4d, ljet4, ljetplus,
  ln03, lp2000, lp2563, lp8000, lq850, lxm3200-tweaked, lxm5700m,
  m8510, md1xMono, md2k, md50Eco, md50Mono, md5k, mj700v2c, ml600,
  necp2xX.upp, necp6, npdl, oce9050, oki182, oki4w, okiibm, paintjet,
  pcl3, picty180, pjetxl, pjxl300, pjxl, pj, ps2write, pr150, pr201,
  pxlcolor, pxldpl, pxlmono, r4081, rpdl, sharp.upp, sipixa6.upp,
  sj48, stcolor, t4693dX, tek4696, xes
  ```

  这为许多旧的和古老的打印机提供支持，但也支持 PCL 激光打印机（特别是 PCL 6/XL）和针式打印机。

  包含的 Ghostscript 可能有更多驱动程序，但这些是我们从 Foomatic 获得 PPD 支持且不被其他驱动程序视为过时的驱动程序。

- **`hpijs` 的 HPLIP**：适用于非 HP PCL 打印机（请为 HP 打印机使用 [HPLIP 打印机应用程序](https://snapcraft.io/hplip-printer-app)）。打印质量优于 Ghostscript 的内置驱动程序。

- **`pnm2ppa`**：某些旧 HP 打印机的驱动程序，采用专有协议，可能是唯一一款**不受 HPLIP 支持**的 HP 打印机，甚至不在 HP 的专有插件中。Snap 中的配置文件可供用户编辑，见下文。

- **`pxljr`**：适用于 HP Color LaserJet 3500/3550/3600，打印质量应优于 HPLIP。

- **`foo2zjs`**：用于使用专有语言的激光打印机的驱动程序，来自戴尔、爱普生、富士、HP、京瓷、联想、（柯尼卡）美能达、Oki、Olivetti、理光、三星、柯达。请注意，此打印机应用程序未包含 HP 的固件加载功能，请使用 [HPLIP 打印机应用程序](https://snapcraft.io/hplip-printer-app)（在应用内下载专有插件，或通过网络界面）用于这些打印机，固件无论如何都是专有的。在 Snap 中，用户可以添加颜色配置文件，见下文。

- **`SpliX`**：用于使用专有语言的激光打印机的驱动程序，来自戴尔、联想、三星、东芝、施乐。

- **`brlaser`**：用于 Brother HL、DCP 和 MFC 激光打印机的驱动程序，这些打印机不理解 PostScript 或 PCL。

- **`fxlinuxprint`**：富士施乐公司为其 PDF 打印机提供的驱动程序，在无驱动 IPP 的时代之前。

- **`c2esp`**：用于 Kodak EasyShare 打印机的驱动程序。

- **`rastertosag-gdi`**：适用于不支持 PostScript 或 PCL 的少数 Ricoh 型号：Ricoh Aficio SP 1000S/1100S。

- **`dymo`**：Dymo 标签打印机的驱动程序。

- **`ptouch`**：Brother 的 P-Touch 标签打印机的驱动程序。

- **`c2050`、`cjet`、`min12xxw`、`m2300w`**：适用于旧款 Lexmark、佳能和美能达打印机的驱动程序。对于 Snap 中的 `m2300w`，用户可以添加颜色配置文件，见下文。

- **`CUPS`、`cups-filters`**：适用于 PCL、针式打印机（Oki、Epson）、标签打印机（Dymo、Intellitech、Zebra）和某些旧款 HP DesignJet 大幅面打印机的包含驱动程序。

- **制造商提供的 PPD 文件**：适用于来自理光和 OEM（Gestetner、InfoPrint、Infotec、Lanier、NRG、理光、Savin）及三星的 PCL 和 PDF 打印机。

### 属性

- 一个提供基于 Ghostscript 的打印机驱动程序的打印机应用程序。输入数据转换为 PDF 或 PostScript（如果尚未以这些格式提供），因为这些是 Ghostscript 的输入数据格式，然后由 Ghostscript 转换为打印机的本地语言。在某些情况下，Ghostscript 生成的通用光栅输出会通过额外的过滤器转换为打印机的语言。

- PWG Raster、Apple Raster 或图像输入数据会被转换为 PostScript，而不是 PDF，因为 PostScript 是可流式传输的，这样大的作业需要更少的资源，或者理论上甚至可以打印无限的作业。

- 此打印机应用程序还包含一些独立的、旧的并且现在不再维护的打印机驱动程序，这些驱动程序的项目过于小，无法独立成一个打印机应用程序。它们还可以由 CUPS Raster 过滤器组成，如果输入是 PWG Raster、Apple Raster 或图像，则不需要 Ghostscript。

- 请注意，大多数驱动程序（无论是在 Ghostscript 内部还是单独的过滤器）都是旧版的、不再维护的代码，用于旧打印机，我们没有访问它们的权限进行测试。Snap 中的打包（以及使用 Debian 源的 Snap）是最小侵入性的，以确保先前正常工作的代码保持正常工作，但由于 GCC 和库的变化或 Snap 环境，无法保证。

- 此打印机应用程序支持数千款（通常是较旧的）打印机型号。所需的打印机能力信息和驱动程序使用信息主要来自 OpenPrinting 的 Foomatic 数据库，也来自个别驱动程序带来的信息。

- 从 Foomatic 数据中预构建、压缩和打包了 CUPS PPD 文件，并与 Snap 一起打包。此外，还包括 cups-filters 的 foomatic-rip 过滤器、Ghostscript 和额外的打印机驱动过滤器。通过这种方式，我们完成了使用 pappl-retrofit 库的 CUPS 驱动程序改造。这样我们就不需要修改或调整现在大多不再维护的打印机驱动程序代码，也不需要对 Foomatic 数据或 PPD 文件进行修改。这一点很重要，因为我们没有打印机进行测试。

- 我们使用打印机的 IEEE-1284 设备 ID 来识别制造商和打印机型号，并寻找此型号的显式驱动程序支持。如果找不到，则检查 ID 的 CMD: 字段，查看打印机是否支持任何通用数据格式，目前有 PostScript、PCL-6/XL、PCL 5c 和 PCL 5e，以选择通用驱动程序。

- 可用打印机设备通过 CUPS 的后端进行发现（和使用），而不是通过 PAPPL 的自身后端。通过这种方式，可以使用 USB 打印机的兼容性问题的变通方法（可编辑），任何驱动程序的输出都可以通过 IPP、IPPS（加密！）和 LPD 发送到打印机，另外还有套接字（通常是 9100 端口）。SNMP 后端可以配置（社区、地址范围）。

- 如果你有不寻常的系统配置或个人防火墙，你的打印机可能无法被发现。在这种情况下，将“网络打印机”条目与主机名/IP 字段结合使用可能会有所帮助。

- 标准作业 IPP 属性会映射到最佳适配的驱动程序选项设置，以便用户可以从任何类型的客户端（例如手机或物联网设备）进行打印，这些客户端只支持标准 IPP 属性，无法检索 PPD 选项。纸盘、介质大小、介质类型和双面可以轻松映射，但当涉及颜色和质量时就变得更加复杂，因为相关选项在 PPD 文件中差异很大。在这里，我们使用一种算法，自动（谁想要手动编辑 ~10000 个 PPD 文件进行分配）找到每种 `print-color-mode`（`color`/`monochrome`）、`print-quality`（`draft`/`normal`/`high`）和 `print-content-optimize`（`auto`/`photo`/`graphics`/`text`/`text-and-graphics`）组合在当前打印机的 PPD 中的正确选项设置。因此，你可以轻松访问打印机的全部质量或速度，而无需处理特定于打印机的选项设置（原始选项仍然可以通过网络管理界面访问）。

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
  - c2050 debian/0.3-7
  - cjet debian/0.8.9-11
  - min12xxw debian/0.0.9-11
  - pnm2ppa debian/1.13-13
  - c2esp debian/27-11
  - dymo-cups-drivers debian/1.4.0-12
  - foo2zjs debian/20200505dfsg0-3
  - fxlinuxprint debian/1.1.0+ds-4
  - m2300w debian/0.51-15
  - printer-driver-oki 1.0.2
  - pxljr debian/1.4+repack0-6
  - rastertosag-gdi debian/0.1-8
  - splix debian/2.0.1-1
  - brlaser v6
  - ptouch-driver debian/1.7-1
<!-- End Included Components -->

## 法律声明

Ghostscript 打印机应用程序版权所有 © 2020 Till Kamppeter。
 
它源于 HP PCL 打印机应用程序，这是一种基于 PAPPL 的光栅打印机应用程序的第一个工作模型。可在这里找到：

https://github.com/michaelrsweet/hp-printer-app

HP PCL 打印机应用程序版权所有 © 2019-2020 Michael R Sweet。

此软件根据 Apache 许可证第 2.0 版获得许可，并允许与 GPL2/LGPL2 软件（例如旧版本的 CUPS）链接。有关更多信息，请参见“LICENSE”和“NOTICE”文件。