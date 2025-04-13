# Ghostscript 打印机应用程序

## 介绍

这个代码库包含一个打印机应用程序，适用于 Ghostscript 内置的打印机驱动程序支持的打印机以及一些额外的过滤器。

它使用 [PAPPL](https://www.msweet.org/pappl) 来支持来自多个操作系统的 IPP 打印。此外，它使用 [cups-filters 2.x](https://github.com/OpenPrinting/cups-filters) 的资源（libcupsfilters、libppd 中的过滤功能）和 [pappl-retrofit](https://github.com/OpenPrinting/pappl-retrofit)（在打印机应用中封装经典 CUPS 驱动程序）。本工作（或现在的 pappl-retrofit 代码）源自 [hp-printer-app](https://github.com/michaelrsweet/hp-printer-app)。

关于打印机能力和驱动程序使用的信息使用了 OpenPrinting 的 Foomatic 数据库（在线访问 [按打印机](http://www.openprinting.org/printers/)，[按驱动程序](http://www.openprinting.org/drivers/)，[下载](http://github.com/OpenPrinting/foomatic-db)）。

欢迎您的贡献。请发布 [问题和拉取请求](https://github.com/OpenPrinting/ghostscript-printer-app)。

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

  这为许多老旧和古老的打印机提供了支持，还支持 PCL 激光打印机（尤其是 PCL 6/XL）和针式打印机。

  随附的 Ghostscript 可能包含更多驱动程序，但这些是我们从 Foomatic 获得 PPD 支持且不被其他驱动程序视为过时的驱动程序。

- **HPLIP 的 `hpijs`**: 针对非 HP 的 PCL 打印机（对于 HP 打印机，请使用 [HPLIP 打印机应用程序](https://snapcraft.io/hplip-printer-app)）。打印质量优于 Ghostscript 的内置驱动程序。

- **`pnm2ppa`**: 适用于某些具有专有协议的旧 HP 打印机，可能是唯一不受 HPLIP 支持的 HP 打印机，甚至不适用于 HP 的专有插件。Snap 中的配置文件可供用户编辑，见下文。

- **`pxljr`**: 适用于 HP Color LaserJet 3500/3550/3600，应该提供比 HPLIP 更好的输出质量。

- **`foo2zjs`**: 适用于具有专有语言的激光打印机，来自 Dell、Epson、富士、HP、京瓷、Lexmark、(Konica) 美能达、Oki、Olivetti、理光、三星、施乐。请注意，HP 的固件加载功能未包含在此打印机应用程序中，请使用 [HPLIP 打印机应用程序](https://snapcraft.io/hplip-printer-app)（在应用内下载专有插件，通过 Web 界面）用于这些打印机，因为固件本身就是专有的。在 Snap 中，用户可以添加颜色配置文件，见下文。

- **`SpliX`**: 适用于具有专有语言的激光打印机，来自 Dell、Lexmark、三星、东芝、施乐。

- **`brlaser`**: 适用于不理解 PostScript 或 PCL 的 Brother HL、DCP 和 MFC 激光打印机。

- **`fxlinuxprint`**: 富士施乐为其 PDF 打印机提供的驱动程序，在无驱动 IPP 时代之前。

- **`c2esp`**: 适用于 Kodak EasyShare 打印机的驱动程序。

- **`rastertosag-gdi`**: 适用于少数不支持 PostScript 或 PCL 的 Ricoh 型号：Ricoh Aficio SP 1000S/1100S。

- **`dymo`**: 适用于 Dymo 标签打印机的驱动程序。

- **`ptouch`**: 适用于 Brother P-Touch 标签打印机的驱动程序。

- **`c2050`、`cjet`、`min12xxw`、`m2300w`**: 适用于较旧的 Lexmark、Canon 和美能达打印机的驱动程序。对于 Snap 中的 `m2300w`，用户可以添加颜色配置文件，见下文。

- **`CUPS`、`cups-filters`**: 包含用于 PCL、点阵打印机（Oki、Epson）、标签打印机（Dymo、Intellitech、Zebra）和某些旧 HP DesignJet 大幅面打印机的驱动程序。

- **制造商提供的 PPD 文件**: 适用于 Ricoh 和 OEM（Gestetner、InfoPrint、Infotec、Lanier、NRG、Ricoh、Savin）及三星的 PCL 和 PDF 打印机。

### 属性

- 一个提供基于 Ghostscript 的打印机驱动程序的打印机应用程序。输入数据被转换为 PDF 或 PostScript（如果尚未以这些格式提供），因为这些是 Ghostscript 的输入数据格式，输入到 Ghostscript 中，并由 Ghostscript 转换为打印机的原生语言。在某些情况下，Ghostscript 生成通用的光栅输出，该输出通过其他过滤器转换为打印机的语言。

- PWG 光栅、Apple 光栅或图像输入数据被转换为 PostScript 而不是 PDF，因为 PostScript 是可流式传输的，这样可以减少大型作业所需的资源，或者理论上甚至可以打印无限作业。

- 此打印机应用程序还包括一些独立的、旧的且现在不再维护的打印机驱动程序，这些小型项目不适合单独成为自己的打印机应用程序。这些也可以是一个 CUPS 光栅过滤器，如果输入是 PWG 光栅、Apple 光栅或图像，就不需要 Ghostscript。

- 请注意，大多数驱动程序（包括 Ghostscript 内部和单独的过滤器）都是旧的、不再维护的代码，针对我们无法获取进行测试的旧打印机。Snap 中的打包（以及在 Debian 中，Snap 使用 Debian 源）是最低侵入性的，以确保曾经正常工作的代码保持有效，但由于 GCC 和库的更改或 Snap 环境的变化，这并不能得到保证。

- 此打印机应用程序支持数千种（通常是更旧的）打印机型号。所需的打印机能力信息和驱动程序使用信息主要来自 OpenPrinting 的 Foomatic 数据库，但也来自各个驱动程序随带的信息。

- 从 Foomatic 数据中，CUPS PPD 文件被预构建、压缩并打包到 Snap 中。此外，cups-filters 的 foomatic-rip 过滤器、Ghostscript，以及额外的打印机驱动程序过滤器也包含在内。通过这种方式，我们使用 pappl-retrofit 库进行 CUPS 驱动程序的改进。这样我们就不需要修改或调整现在大多不再维护的打印机驱动程序代码，以及 Foomatic 数据或 PPD 文件。这一点很重要，因为我们没有进行测试的打印机。

- 我们使用打印机的 IEEE-1284 设备 ID 来识别制造商和打印机型号，并寻找该型号的明确驱动程序支持。如果没有找到，我们会检查 ID 的 CMD: 字段，以查看打印机是否支持任何常见的数据格式，目前为 PostScript、PCL-6/XL、PCL 5c 和 PCL 5e，以选择通用驱动程序。

- 可用的打印机设备通过 CUPS 的后端进行发现（和使用），而不是通过 PAPPL 自身的后端。通过这种方式，可以使用（和可编辑的）USB 打印机的兼容性问题的解决方案，并且任何驱动程序的输出都可以通过 IPP、IPPS（加密！）和 LPD 发送到打印机，而不仅仅是通过套接字（通常端口 9100）。SNMP 后端可以进行配置（社区、地址范围）。

- 如果您具有不寻常的系统配置或个人防火墙，您的打印机可能无法被发现。在这种情况下，完全手动的“网络打印机”条目与主机名/IP 字段的组合可能会有所帮助。

- 标准作业 IPP 属性被映射到驱动程序选项设置，以最佳符合这些属性，从而使用户能够从任何类型的客户机（例如手机或物联网设备）进行打印，这些客户机仅支持标准 IPP 属性且无法获取 PPD 选项。纸盘、介质大小、介质类型和双面打印可以很容易地映射，但当涉及到颜色和质量时则更加复杂，因为相关选项在 PPD 文件中的差异很大。在这里，我们使用一个算法，自动找到每个 `print-color-mode`（`color`/`monochrome`）、`print-quality`（`draft`/`normal`/`high`）和 `print-content-optimize`（`auto`/`photo`/`graphics`/`text`/`text-and-graphics`）组合的正确选项设置（谁愿意手动编辑 ~10000 个 PPD 文件以进行分配）。因此，您可以轻松访问打印机的全部质量或速度，而无需处理特定于打印机的选项设置（原始选项仍可通过网页管理员界面访问）。

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

## 法律信息

Ghostscript 打印机应用程序版权所有 © 2020 Till Kamppeter。

它源自 HP PCL 打印机应用程序，这是一个使用 PAPPL 的光栅打印机应用程序的第一个工作模型。可在此处获取：

https://github.com/michaelrsweet/hp-printer-app

HP PCL 打印机应用程序版权所有 © 2019-2020 Michael R Sweet。

该软件根据 Apache 许可证第 2.0 版授权，并附带例外条款，允许链接到 GPL2/LGPL2 软件（如早期版本的 CUPS）。有关更多信息，请参阅“LICENSE”和“NOTICE”文件。