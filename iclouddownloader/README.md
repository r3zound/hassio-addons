# Home assistant 插件: iCloud 下载器

1. 安装插件
1. 运行插件，它会失败，但会创建我们需要的目录以进行下一步
1. 从这个代码库中复制 iclouddownloader.sh 到 /addon_configs/2effc9b9_iclouddownloader
1. 编辑命令，输入你的用户名、密码，以及你想下载文件的位置
1. 你应该能够通过复制账户块来添加多个账户，但首先要让一个账户正常工作！除了最后一个账户外，所有账户的行末应有一个 &，否则插件将在 1 小时后退出
1. 查看这里所有可能的命令，并根据需要设置: https://pypi.org/project/icloudpd/1.12.0/
1. 你可以在 Home Assistant 设置 -> 系统 -> 存储中挂载一个 smb/nfs 共享到媒体目录并指向该位置。位置将是 /media/ShareName/，并可以在下面添加你想要的任何目录结构，shareName 是你在 homeassistant 中命名的共享名
1. 运行/重启插件，它会再次失败。（不要在插件上点击停止）
1. 选项 1: 转到你的 homeassistantIP:8080（或你配置的其他端口）并输入 2FA 代码。Ingress 不工作
1. 选项 1: 现在应该开始下载你的照片
1. 选项 2: 在接下来的一个小时内，通过 SSH 登录到 home assistant（你必须在 ssh 插件中将保护模式设置为 false）
1. 选项 2: 运行 'docker exec -it addon_2effc9b9_iclouddownloader /config/iclouddownloader.sh authorize'
1. 选项 2: 输入在你的 iPhone 上显示的 2fa 代码（你需要每两个月重复这个重新认证步骤）
1. 选项 2: 按 Control-C 或退出终端
1. 选项 2: 最后一次重启插件，它应该开始下载照片。





[repository]: https://github.com/jdeath/homeassistant-addons