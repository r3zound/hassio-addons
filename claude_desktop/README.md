# Home Assistant 插件：Claude 桌面版

![支持 aarch64 架构][aarch64-shield]
![支持 amd64 架构][amd64-shield]
![项目维护][maintenance-shield]

在 LinuxServer.io Selkies 插件中运行 Claude 桌面版，并启用 Headroom 上下文压缩、RTK Bash 输出加速和默认启用的 TokenSave 语义代码智能。

## 安装

1. 将此存储库添加到 Home Assistant 插件商店。
2. 安装 **Claude 桌面版**。
3. 启动插件并从侧边栏打开 Web UI。
4. 使用桌面应用程序通过 Claude 账户登录。

Claude 桌面版登录需要 claude.ai 计划支持桌面应用程序，API 密钥不被桌面应用程序接受。Anthropic 的 Linux 测试版目前不包括计算机使用或语音输入。

## 架构

一切都是围绕 Claude 桌面应用程序构建的。Claude Code 在同一镜像中安装，但不是作为独立服务公开：Claude 桌面版的协同和调度会话在内部运行它，并使用共享的 Claude Code 配置（`~/.claude`）、钩子、MCP 服务器、权限和 PATH 工具。

- **Claude 桌面版**通过 MCP 工具使用 Headroom。
- **桌面版内部的 Claude Code 会话**通过共享的 Claude Code 配置获得相同的 MCP 服务器、权限模式和 RTK/TokenSave 钩子。
- 当 `headroom_wrap_claude_code` 启用时，基于 PATH 的 Claude Code 启动将通过监督的 Headroom 代理路由。如果桌面版版本直接调用 `/usr/bin/claude`，会话仍然有效，并且仍然具有共享的权限模式和 Headroom MCP 工具，但无法注入透明代理压缩。
- 共享的 `abc` 桌面账户在配置的 `PUID`/`PGID`（默认 `1000:1000`）下运行。当选择 `permission_mode: bypass` 并将 `PUID` 设置为 `0` 时，由于 Claude Code 在有效根 UID 下拒绝绕过模式，插件在 Selkies 和 Claude 桌面版启动之前自动回退到 UID `1000`，同时保留配置的组。`gnome-keyring` 为 Electron 提供了 Secret Service 后端，以在重启之间持久化登录和调度权限授权。

## 优化层

三个捆绑的优化工具是互补的：

- **RTK** 重写受支持的 Bash 命令，以便 Claude 接收紧凑的输出。
- **TokenSave** 为显式选择的代码仓库构建本地语义图，并引导 Claude 避免重复的 Explore/Grep/Read 扩散。
- **Headroom** 透明地压缩代理的 Claude Code 流量，并还向 Claude 桌面版公开按需压缩/检索/统计 MCP 工具。

TokenSave 的完整 Claude 集成在启动时安装：MCP 服务器、权限、PreToolUse/UserPromptSubmit/Stop 钩子、全局提示规则和 Git 同步钩子。只有当仓库在 `tokensave_project_paths` 中列出时，才会对其进行索引；不会执行自动文件系统扫描。

## 功能

- Claude 桌面版在单应用 Selkies 模式下，具有 Home Assistant 入口。
- 官方的 Claude Code 稳定包为桌面协同/调度会话提供动力。
- 在配置的 `data_location`（默认 `/data/data`）中持久化 `$HOME`，在重启之间保留桌面和 Claude Code 状态。
- 通过捆绑的、自动解锁的 gnome-keyring 持久登录。
- 可配置的 Claude Code 权限：严格的提示、自动安全操作批准或为受信任安装显式完全绕过。
- 自动非 root 运行时强制执行绕过模式，包括根控制台包装启动。
- 在每次启动时尽力从 Anthropic 的 apt 存储库更新 Claude 桌面版（离线时静默跳过）。
- 可选的 apt 和 pip 软件包安装（pip 安装使用 `uv`）。
- 预装 `git`、GitHub CLI (`gh`)、`ripgrep`、`jq`、`shellcheck`、`yamllint`、`hadolint` 和 `actionlint`。
- 通过存储库标准 `claude_desktop.sh` 支持自定义脚本。
- 捆绑的优化工具：Headroom、RTK 和 TokenSave；Caveman 仍然作为可选插件可用。
- 可选的 OpenAI Codex CLI，仅通过 ChatGPT 订阅进行认证，并通过原生的 Codex MCP 服务器从 Claude 访问。
- 可选的 Home Assistant MCP 代理，以便 Claude 可以查询和控制 Home Assistant。
- Headroom、RTK 和 TokenSave 的独立每小时节省报告。
- `claude-tools-doctor.sh` 诊断程序，用于检查二进制文件、路由、钩子、MCP 注册、项目索引、代理健康、权限、运行时身份和收益。
- GPU 映射、Selkies 帧率和易失性缓存的低功耗默认设置。

## 选项

| 选项 | 默认值 | 描述 |
| ---- | ------ | ---- |
| `PUID` / `PGID` | `1000` / `1000` | 共享 `abc` 桌面账户的数字用户和组，该账户拥有数据位置并运行 Claude 桌面版。在绕过模式下，当 `PUID` 为 `0` 时，根 `PUID` 在 Selkies 和 Claude 桌面版启动之前自动替换为 UID `
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
