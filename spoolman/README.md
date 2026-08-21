# Spoolman HA 扩展
![版本][version]
![Spoolman 更新盾牌]

![支持 amd64 架构][amd64-shield]
![支持 aarch64 架构][aarch64-shield]
![支持 armv7 架构][Spoolman-armv7-shield]

## 关于
此扩展基于 [Spoolman](https://github.com/Donkie/Spoolman)。

有关 haos 入口版本，请参阅 [Spoolman-Ingress 扩展](https://github.com/bytenoodle/hassioaddon/tree/main/spoolman-ingress)。

## 注意事项
1. **时区**
   - 扩展自动使用 Home Assistant 系统时区。
   - 无需手动配置时区。
   - 默认回退：`Europe/Stockholm`。

2. **端口**
   - 固定为 `7912`。在扩展配置中更改端口不会产生影响。
   - 确保没有其他扩展使用此主机端口。

3. **数据目录**
   - `addon_config/<slug>/` → 主要扩展数据、日志和备份。
     - `<slug>` 是 Home Assistant 自动创建的扩展文件夹名称，例如，`20c49e40_spoolman`。
   - 扩展会自动在此文件夹内创建以下子目录：
     - `backups/` → 备份存储
     - `logs/` → 日志文件
     - `cache/` → 临时缓存文件
   - 所有目录都具有 Spoolman 进程的正确权限。
   - **注意**：`/config` 指的是容器内主 Home Assistant 配置路径，但所有扩展文件都位于 `addon_config/<slug>/` 下。
4. **版本编号**
   - 使用 **x.x.x-x** 格式。
   - 前三个数字与官方 Spoolman 版本匹配（例如，`0.22.1`）。
   - 横线后的数字（例如，`-X`）是针对此 Home Assistant 扩展的特定更改（例如，`0.22.1-0`）。
5. **外部数据库同步与备份**
   - 扩展会自动从外部 SpoolmanDB 同步丝材和材料。
   - 自动数据库备份计划在午夜进行。
   - 无需配置；所有操作都在后台运行。

## 已知问题
- 目前没有。

## 安装
1. [将存储库添加到您的 Home Assistant 扩展][repository]。
2. 安装 **Spoolman** 扩展。
3. 启动扩展。
4. 在 `http://<HOME_ASSISTANT_HOST>:7912` 访问 WebUI。


## 故障排除

| 问题 | 可能原因 | 解决方案 |
|---------|----------------|----------|
| **扩展无法启动** | 端口 7912 已被占用 | 确保没有其他扩展使用端口 7912，或更改冲突扩展的端口。 |
| **日志中的时间不正确** | 主机时区配置错误 | 确保在 **设置 → 系统 → 时间与日期** 中 Home Assistant 系统时区正确。 |
| **数据库未更新** | SQLite 数据库损坏 | 备份并删除 `/config/spoolman.db`，然后重新启动扩展以重新创建数据库。 |

## 支持
- 如果您遇到任何问题，请在 [Bytenoodle/hassioaddon GitHub 存储库](https://github.com/bytenoodle/hassioaddon/issues) 上提交问题。
- 请包含您的扩展日志（`addon_config/<slug>/addon_log/spoolman.log` 和 `扩展页面日志`）以及问题的简要描述。
- 这有助于更快地诊断和解决问题。

## 截图

![预览][preview]

<!-- 资产 -->
[aarch64-shield]: https://img.shields.io/badge/aarch64-yes-green.svg
[amd64-shield]: https://img.shields.io/badge/amd64-yes-green.svg
[Spoolman-armv7-shield]: https://img.shields.io/badge/armv7-yes-green.svg
[version]: https://img.shields.io/badge/version-v0.24.0--0-blue.svg
[Spoolman-update-shield]: https://img.shields.io/badge/Updated%20on-2026--07--21-blue.svg
[repository]: https://my.home-assistant.io/redirect/supervisor_add_addon_repository/?repository_url=https://github.com/bytenoodle/hassioaddon
[preview]: https://raw.githubusercontent.com/bytenoodle/hassioaddon/refs/heads/main/spoolman/preview.png
---

**⚠️ This resource is intended to help Chinese Home Assistant users more easily install excellent add-ons. If you are not a Chinese user, please read repository readme first**

**⚠️ 这个资源用来帮助中国Home Assistant用户更容易地安装优秀的插件。如果您不是中国用户，请先阅读仓库的README，以下为收集者（汉化，加速）信息，非原作者信息**

---

## 📱 关注我

扫描下面二维码，关注我。有需要可以随时给我留言：

<img src="https://gitee.com/desmond_GT/hassio-addons/raw/main/WeChat_QRCode.png" width="50%" /> 📲

## ☕ 赞助支持

如果您觉得我花费大量时间维护这个库对您有帮助，欢迎请我喝杯奶茶，您的支持将是我持续改进的动力！

<div style="display: flex; justify-content: space-between;">
  <img src="https://gitee.com/desmond_GT/hassio-addons/raw/main/1_readme/Ali_Pay.jpg" height="350px" />
  <img src="https://gitee.com/desmond_GT/hassio-addons/raw/main/1_readme/WeChat_Pay.jpg" height="350px" />
</div> 💖

感谢您的支持与鼓励！
