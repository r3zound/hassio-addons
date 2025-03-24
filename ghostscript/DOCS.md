# Ghostscript 打印机应用程序

## 介绍

该库包含一个打印机应用程序，适用于 Ghostscript 内置打印机驱动程序支持的打印机以及一些额外的过滤器。

它使用 [PAPPL](https://www.msweet.org/pappl) 来支持来自多种操作系统的 IPP 打印。此外，它还使用 [cups-filters 2.x](https://github.com/OpenPrinting/cups-filters) 的资源（libcupsfilters、libppd 中的过滤功能）和 [pappl-retrofit](https://github.com/OpenPrinting/pappl-retrofit)（将经典 CUPS 驱动程序封装在打印机应用程序中）。该工作（或现在的 pappl-retrofit 代码）源于 [hp-printer-app](https://github.com/michaelrsweet/hp-printer-app)。

有关打印机能力和驱动程序使用信息，使用了 OpenPrinting 的 Foomatic 数据库（在线访问 [按打印机](http://www.openprinting.org/printers/)、[按驱动程序](http://www.openprinting.org/drivers/)、[下载](http://github.com/OpenPrinting/foomatic-db)）。

欢迎您的贡献。请发布 [问题和拉取请求](https://github.com/OpenPrinting/ghostscript-printer-app)。

### 包含的打印机驱动程序

- **Ghostscript 内置**：
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

  这提供了对许多老旧打印机的支持，但也支持 PCL 激光打印机（特别是 PCL 6/XL）和针式打印机。

  包含的 Ghostscript 可能有更多驱动程序，但这些是我们从 Foomatic 获得 PPD 支持且未被其他驱动程序视为过时的驱动程序。

- **HPLIP 的 `hpijs`**：用于非 HP 的 PCL 打印机（针对 HP 打印机使用 [HPLIP 打印机应用程序](https://snapcraft.io/hplip-printer-app)）。打印质量优于 Ghostscript 的内置驱动程序。

- **`pnm2ppa`**：用于某些老式 HP 打印机的驱动程序，采用专有协议，可能是唯一一个 **不被 HPLIP 支持** 的 HP 打印机，甚至不能通过 HP 的专有插件支持。Snap 中的配置文件可由用户编辑，详见下文。

- **`pxljr`**：适用于 HP Color LaserJet 3500/3550/3600，应该能提供比 HPLIP 更好的输出质量。

- **`foo2zjs`**：用于带有专有语言的激光打印机的驱动程序，支持 Dell、Epson、富士（Fuji）、HP、京瓷、Lexmark、（柯尼卡）美能达、Oki、奥利维etti、理光（Ricoh）、三星、施乐（Xerox）。注意，HP 的固件加载功能在此打印机应用程序中未包含，请使用 [HPLIP 打印机应用程序](https://snapcraft.io/hplip-printer-app)（在应用内下载专有插件，通过网络界面）来支持这些打印机，固件本身就是专有的。在 Snap 中，用户可以添加颜色配置文件，请见下文。

- **`SpliX`**：用于带有专有语言的激光打印机的驱动程序，支持 Dell、Lexmark、三星、东芝、施乐。

- **`brlaser`**：用于不支持 PostScript 或 PCL 的 Brother HL、DCP 和 MFC 激光打印机的驱动程序。

- **`fxlinuxprint`**：来自富士施乐的驱动程序，用于他们在无驱动 IPP 时代之前的 PDF 打印机。

- **`c2esp`**：用于 Kodak EasyShare 打印机的驱动程序。

- **`rastertosag-gdi`**：适用于不支持 PostScript 或 PCL 的少数理光模型：理光 Aficio SP 1000S/1100S。

- **`dymo`**：用于 Dymo 标签打印机的驱动程序。

- **`ptouch`**：用于 Brother 的 P-Touch 标签打印机的驱动程序。

- **`c2050`, `cjet`, `min12xxw`, `m2300w`**：用于较老的 Lexmark、Canon 和美能达打印机的驱动程序。对于 Snap 中的 `m2300w`，用户可以添加颜色配置文件，请见下文。

- **`CUPS`, `cups-filters`**：包含 PCL、针式打印机（Oki、Epson）、标签打印机（Dymo、Intellitech、Zebra）和一些旧版 HP DesignJet 大幅面打印机的驱动程序。

- **制造商提供的 PPD 文件**：适用于理光（Ricoh）和 OEM（Gestetner、InfoPrint、Infotec、Lanier、NRG、理光、Savin）以及三星的 PCL 和 PDF 打印机。

### 属性

- 一个提供基于 Ghostscript 的打印机驱动程序的打印机应用程序。输入数据被转换为 PDF 或 PostScript（如果未以这些格式中的一种提供），因为这些是 Ghostscript 的输入数据格式，输入到 Ghostscript 中，并由 Ghostscript 转换为打印机的原生语言。在某些情况下，Ghostscript 产生通用的光栅输出，由额外的过滤器转换为打印机语言。

- PWG Raster、Apple Raster 或图像输入数据被转换为 PostScript，而不是 PDF，因为 PostScript 是可流式传输的，这样大作业需要的资源较少，理论上甚至可以打印无限作业。

- 此打印机应用程序还包含一些独立的、旧的且现在不再维护的打印机驱动程序，这些是规模太小，无法单独形成自己的打印机应用程序。这些也可以由 CUPS Raster 过滤器组成，若输入为 PWG Raster、Apple Raster 或图像，则无需 Ghostscript。

- 请注意，大多数驱动程序（无论是 Ghostscript 内部还是独立过滤器）都是旧的、未维护的代码，面向我们无法获取进行测试的旧打印机。Snap 中的打包（在 Debian 中，Snap 使用 Debian 源）是最低限度的干预，以确保原本正常运行的代码保持运行，但由于 GCC 和库的更改或 Snap 环境的变化，这并不保证。

- 此打印机应用程序支持成千上万种（通常是较旧的）打印机型号。所需的打印机能力信息和驱动程序使用信息主要来自 OpenPrinting 的 Foomatic 数据库，但也来源于随各个驱动程序提供的信息。

- 从 Foomatic 数据中预构建 CUPS PPD 文件，压缩并与 Snap 一起打包。此外，cups-filters 的 foomatic-rip 过滤器、Ghostscript 和额外的打印机驱动程序过滤器也包含在内。这样就可以利用 pappl-retrofit 库进行 CUPS 驱动程序的再利用。因此，我们无需修改或调整现在大部分无人维护的打印机驱动程序代码、Foomatic 数据或 PPD 文件。这一点很重要，因为我们没有打印机进行测试。

- 我们使用打印机的 IEEE-1284 设备 ID 来识别打印机的制造商和型号，并寻找该型号的明确驱动程序支持。如果未找到明确支持，我们会检查 ID 的 CMD: 字段，以查看打印机是否支持任何常用的数据格式，目前为 PostScript、PCL-6/XL、PCL 5c 和 PCL 5e，以便选择通用驱动程序。

- 可用打印设备是通过 CUPS 的后端发现（并使用），而不是通过 PAPPL 自身的后端。这样，就能使用 USB 打印机的兼容性问题的变通解决方案（且是可编辑的），并且任何驱动程序的输出可以通过 IPP、IPPS（加密）、LPD，以及套接字（通常为 9100 端口）发送到打印机。SNMP 后端可以配置（社区、地址范围）。

- 如果您有不寻常的系统配置或个人防火墙，您的打印机可能无法被发现。在这种情况下，全手动的“网络打印机”条目与主机名/IP 字段一起使用可能会有帮助。

- 标准作业 IPP 属性映射到与之最匹配的驱动程序选项设置，以便用户可以从任何类型的客户端（例如电话或 IoT 设备）打印，这些客户端仅支持标准 IPP 属性，无法检索 PPD 选项。托盘、媒体尺寸、媒体类型和双面打印可以轻松映射，但在处理颜色和质量时会变得更复杂，因为相关选项在 PPD 文件中差异很大。在这里，我们使用一种算法，自动（谁会想手动编辑 ~10000 个 PPD 文件进行赋值）为每个“打印颜色模式”（`color`/`monochrome`）、“打印质量”（`draft`/`normal`/`high`）以及“打印内容优化”（`auto`/`photo`/`graphics`/`text`/`text-and-graphics`）的组合找到合适的选项设置。因此，您可以轻松访问打印机的全部质量或速度，而无需处理特定于打印机的选项设置（原始选项仍然可以通过 Web 管理界面访问）。

<!-- Begin Included Components -->
## 包含组件
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

Ghostscript 打印机应用程序 © 2020 版权归 Till Kamppeter 所有。

它源于 HP PCL 打印机应用程序，这是使用 PAPPL 的光栅打印机应用程序的第一个工作模型。可在以下链接找到：

https://github.com/michaelrsweet/hp-printer-app

HP PCL 打印机应用程序 © 2019-2020 版权归 Michael R Sweet 所有。

本软件遵循 Apache 许可证第 2.0 版本，附带允许与 GPL2/LGPL2 软件（如旧版本 CUPS）链接的例外。有关更多信息，请参见文件“LICENSE”和“NOTICE”。