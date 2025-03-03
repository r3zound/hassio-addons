# 轻量级通用DDNS更新程序

用于为多个DNS提供商保持DNS A和/或AAAA记录更新的程序
> 本项目基于 [qdm12/ddns-updater](https://github.com/qdm12/ddns-updater) 制作，所有功能说明及使用文档均直接引用原作者文档内容。



<img height="100" alt="DDNS Updater logo" src="https://raw.githubusercontent.com/qdm12/ddns-updater/master/readme/ddnsgopher.svg">

[![构建状态](https://github.com/qdm12/ddns-updater/actions/workflows/build.yml/badge.svg)](https://github.com/qdm12/ddns-updater/actions/workflows/build.yml)


![最新版本](https://img.shields.io/github/release/qdm12/ddns-updater?label=最新版本)
![最新Docker标签](https://img.shields.io/docker/v/qmcgaw/ddns-updater?sort=semver&label=最新Docker标签)
[![最新版本大小](https://img.shields.io/docker/image-size/qmcgaw/ddns-updater?sort=semver&label=最新发布镜像)](https://hub.docker.com/r/qmcgaw/ddns-updater/tags?page=1&ordering=last_updated)
![GitHub最新发布日期](https://img.shields.io/github/release-date/qdm12/ddns-updater?label=最新发布日期)
![发布后提交](https://img.shields.io/github/commits-since/qdm12/ddns-updater/latest?sort=semver)

[![最新大小](https://img.shields.io/docker/image-size/qmcgaw/ddns-updater/latest?label=最新镜像)](https://hub.docker.com/r/qmcgaw/ddns-updater/tags)

[![GitHub最后提交](https://img.shields.io/github/last-commit/qdm12/ddns-updater.svg)](https://github.com/qdm12/ddns-updater/commits/main)
[![GitHub提交活动](https://img.shields.io/github/commit-activity/y/qdm12/ddns-updater.svg)](https://github.com/qdm12/ddns-updater/graphs/contributors)
[![GitHub已关闭PR](https://img.shields.io/github/issues-pr-closed/qdm12/ddns-updater.svg)](https://github.com/qdm12/ddns-updater/pulls?q=is%3Apr+is%3Aclosed)
[![GitHub问题](https://img.shields.io/github/issues/qdm12/ddns-updater.svg)](https://github.com/qdm12/ddns-updater/issues)
[![GitHub已关闭问题](https://img.shields.io/github/issues-closed/qdm12/ddns-updater.svg)](https://github.com/qdm12/ddns-updater/issues?q=is%3Aissue+is%3Aclosed)

[![代码行数](https://img.shields.io/tokei/lines/github/qdm12/ddns-updater)](https://github.com/qdm12/ddns-updater)
![代码大小](https://img.shields.io/github/languages/code-size/qdm12/ddns-updater)
![GitHub仓库大小](https://img.shields.io/github/repo-size/qdm12/ddns-updater)
![Go版本](https://img.shields.io/github/go-mod/go-version/qdm12/ddns-updater)

[![MIT](https://img.shields.io/github/license/qdm12/ddns-updater)](LICENSE)
![访问者计数](https://visitor-badge.laobi.icu/badge?page_id=ddns-updater.readme)



## 功能


- 支持以下DNS提供商的A记录：


- [Aliyun](https://github.com/qdm12/ddns-updater/blob/master/docs/aliyun.md)
- [Allinkl](https://github.com/qdm12/ddns-updater/blob/master/docs/allinkl.md)
- [ChangeIP](https://github.com/qdm12/ddns-updater/blob/master/docs/changeip.md)
- [Cloudflare](https://github.com/qdm12/ddns-updater/blob/master/docs/cloudflare.md)
- [Custom](https://github.com/qdm12/ddns-updater/blob/master/docs/custom.md)
- [DDNSS.de](https://github.com/qdm12/ddns-updater/blob/master/docs/ddnss.de.md)
- [deSEC](https://github.com/qdm12/ddns-updater/blob/master/ocs/desec.md)
- [DigitalOcean](https://github.com/qdm12/ddns-updater/blob/master/docs/digitalocean.md)
- [DD24](https://github.com/qdm12/ddns-updater/blob/master/docs/dd24.md)
- [Domeneshop](https://github.com/qdm12/ddns-updater/blob/master/docs/domeneshop.md)
- [DonDominio](https://github.com/qdm12/ddns-updater/blob/master/docs/dondominio.md)
- [DNSOMatic](https://github.com/qdm12/ddns-updater/blob/master/docs/dnsomatic.md)
- [DNSPod](https://github.com/qdm12/ddns-updater/blob/master/docs/dnspod.md)
- [Dreamhost](https://github.com/qdm12/ddns-updater/blob/master/docs/dreamhost.md)
- [DuckDNS](https://github.com/qdm12/ddns-updater/blob/master/docs/duckdns.md)
- [DynDNS](https://github.com/qdm12/ddns-updater/blob/master/docs/dyndns.md)
- [Dynu](https://github.com/qdm12/ddns-updater/blob/master/docs/dynu.md)
- [DynV6](https://github.com/qdm12/ddns-updater/blob/master/docs/dynv6.md)
- [EasyDNS](https://github.com/qdm12/ddns-updater/blob/master/docs/easydns.md)
- [FreeDNS](https://github.com/qdm12/ddns-updater/blob/master/docs/freedns.md)
- [Gandi](https://github.com/qdm12/ddns-updater/blob/master/docs/gandi.md)
- [GCP](https://github.com/qdm12/ddns-updater/blob/master/docs/gcp.md)
- [GoDaddy](https://github.com/qdm12/ddns-updater/blob/master/docs/godaddy.md)
- [GoIP.de](https://github.com/qdm12/ddns-updater/blob/master/docs/goip.md)
- [He.net](https://github.com/qdm12/ddns-updater/blob/master/docs/he.net.md)
- [Infomaniak](https://github.com/qdm12/ddns-updater/blob/master/docs/infomaniak.md)
- [INWX](https://github.com/qdm12/ddns-updater/blob/master/docs/inwx.md)
- [Ionos](https://github.com/qdm12/ddns-updater/blob/master/docs/ionos.md)
- [Linode](https://github.com/qdm12/ddns-updater/blob/master/docs/linode.md)
- [Loopia](https://github.com/qdm12/ddns-updater/blob/master/docs/loopia.md)
- [LuaDNS](https://github.com/qdm12/ddns-updater/blob/master/docs/luadns.md)
- [Myaddr](https://github.com/qdm12/ddns-updater/blob/master/docs/myaddr.md)
- [Name.com](https://github.com/qdm12/ddns-updater/blob/master/docs/name.com.md)
- [Namecheap](https://github.com/qdm12/ddns-updater/blob/master/docs/namecheap.md)
- [NameSilo](https://github.com/qdm12/ddns-updater/blob/master/docs/namesilo.md)
- [Netcup](https://github.com/qdm12/ddns-updater/blob/master/docs/netcup.md)
- [NoIP](https://github.com/qdm12/ddns-updater/blob/master/docs/noip.md)
- [Now-DNS](https://github.com/qdm12/ddns-updater/blob/master/docs/nowdns.md)
- [Njalla](https://github.com/qdm12/ddns-updater/blob/master/docs/njalla.md)
- [OpenDNS](https://github.com/qdm12/ddns-updater/blob/master/docs/opendns.md)
- [OVH](https://github.com/qdm12/ddns-updater/blob/master/docs/ovh.md)
- [Porkbun](https://github.com/qdm12/ddns-updater/blob/master/docs/porkbun.md)
- [Selfhost.de](https://github.com/qdm12/ddns-updater/blob/master/docs/selfhost.de.md)
- [Servercow.de](https://github.com/qdm12/ddns-updater/blob/master/docs/servercow.md)
- [Spdyn](https://github.com/qdm12/ddns-updater/blob/master/docs/spdyn.md)
- [Strato.de](https://github.com/qdm12/ddns-updater/blob/master/docs/strato.md)
- [Variomedia.de](https://github.com/qdm12/ddns-updater/blob/master/docs/variomedia.md)
- [Vultr](https://github.com/qdm12/ddns-updater/blob/master/docs/vultr.md)
- [Zoneedit](https://github.com/qdm12/ddns-updater/blob/master/docs/zoneedit.md)

