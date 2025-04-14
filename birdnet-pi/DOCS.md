# 麦克风考虑事项
关键要素是麦克风的质量：Boya By-lm 40 或 clippy EM272（配有非常好的 aux-usb 转换器）对提高检测质量至关重要。 
以下是我进行的一些示例测试（整个线程真的很有趣）： https://github.com/mcguirepr89/BirdNET-Pi/discussions/39#discussioncomment-9706951 
https://github.com/mcguirepr89/BirdNET-Pi/discussions/1092#discussioncomment-9706191

我的推荐：
- 最佳入门系统（< 50€）：Boya By-lm40（30€）+ deadcat（10€）
- 最佳中端系统（< 150 €）：Clippy EM272 TRS/TRRS（55€）+ Rode AI micro trs/trrs 转 usb（70€）+ Rycote deadcat（27€）
- 最佳高端系统（<400 €）：Clippy EM272 XLR（85€）或 LOM Ucho Pro（75€）+ Focusrite Scarlet 2i2 第四代（200€）+ Bubblebee Pro Extreme deadcat（45€）

欧洲高端麦克风的来源：
- Clippy（EM272）：https://www.veldshop.nl/en/clippy-xlr-em272z1-mono-microphone.html
- LOM（EM272）：https://store.lom.audio/collections/basicucho-series
- Immersive sound（AOM5024）：https://immersivesoundscapes.com/earsight-standard-v2/

# 应用设置建议
我通过并行运行我的 HA birdnet-pi 附加组件的两个版本，使用相同的 rtsp 源，测试了许多设置，并比较参数的影响。 
我的结论并不普遍，因为它似乎高度依赖于所用的地区和麦克风类型。例如，旧型号在澳大利亚似乎表现更好，而新型号在欧洲表现更好。

- 模型
    - 版本：6k_v2,4 _(在欧洲至少表现更好，6k 在澳大利亚表现更好)_
    - 物种范围模型：v1 _(取消勾选 v2.4；在欧洲似乎更稳健)_
    - 物种出现阈值：0.001 _(在使用 v2.4 时为 0.00015；使用物种列表测试器检查适合您的正确值)_
- 音频设置
    - 默认
    - 通道：1 _(并不是特别重要，因为分析是基于单声道信号；1 允许减小保存音频的大小，但在我的经验中似乎会导致光谱图轻微混乱)_
    - 录音长度：18 _(这因为我使用了 0.5 的重叠；所以它分析 0-3s；2.5-5.5s；5-8s；7.5-10.5；10-13；12.5-15.5；15-18)_
    - 提取长度：9s _(可以是 6，但我喜欢听鸟 :-))_
    - 音频格式：mp3 _(为什么要麻烦使用其他格式)_
- Birdnet-lite 设置
    - 重叠：0.5s
    - 最小置信度：0.7
    - Sigmoid 灵敏度：1.25 _(我尝试过 1.00，但它产生了更多的误报；因为降低这个值会增加灵敏度)_

# 设置 RTSP 服务器

灵感来自：https://github.com/mcguirepr89/BirdNET-Pi/discussions/1006#discussioncomment-6747450

<details>
<summary>在您的桌面上</summary>
   
- 下载映像工具
- 安装 Raspbian Lite 64
</details>

<details>
<summary>通过 SSH 安装所需软件</summary>

### 
```
# 更新

sudo apt-get update -y
sudo apt-get dist-upgrade -y

# 安装 RTSP 服务器
sudo apt-get install -y micro ffmpeg lsof
sudo -s cd /root && wget -c https://github.com/bluenviron/mediamtx/releases/download/v1.9.1/mediamtx_v1.9.1_linux_arm64v8.tar.gz -O - | sudo tar -xz
```

</details>


<details>
<summary>配置音频</summary>

### 找到正确的设备
```
# 列出音频设备
arecord -l

# 检查音频设备参数。示例：
arecord -D hw:1,0 --dump-hw-params
```

### 添加启动脚本
sudo nano startmic.sh && chmod +x startmic.sh
```
#!/bin/bash
echo "启动 birdmic"

# 禁用千兆以太网
sudo ethtool -s eth0 speed 100 duplex full autoneg on

# 检测 Scarlett 2i2 卡的索引 - 仅在使用该卡时相关
SCARLETT_INDEX=$(arecord -l | grep -i "Scarlett" | awk '{print $2}' | sed 's/://')

if [ -z "$SCARLETT_INDEX" ]; then
    echo "错误：未找到 Scarlett 2i2！使用 0 作为默认值"
    SCARLETT_INDEX="0"
fi

# 首先启动 mediamtx 并给它一点时间进行初始化
./mediamtx & 
sleep 5
    
# 运行 ffmpeg
ffmpeg -nostdin -use_wallclock_as_timestamps 1 -fflags +genpts -f alsa -acodec pcm_s16be -ac 2 -ar 96000 \
-i plughw:$SCARLETT_INDEX,0 -ac 2 -f rtsp -acodec pcm_s16be rtsp://localhost:8554/birdmic -rtsp_transport tcp \
-buffer_size 512k 2>/tmp/rtsp_error &

# 设置麦克风音量
sleep 5
MICROPHONE_NAME="Line In 1 Gain" # 对于 Focusrite Scarlett 2i2
sudo amixer -c 0 sset "$MICROPHONE_NAME" 40

sleep 60

# 运行 focusrite 和 autogain 脚本（如果存在）
if [ -f "$HOME/focusrite.sh" ]; then
    sudo python3 -u "$HOME/focusrite.sh" >/tmp/log_focusrite 2>/tmp/log_focusrite_error &
fi

if [ -f "$HOME/autogain.py" ]; then
    sudo python3 -u "$HOME/autogain.py" >/tmp/log_autogain 2>/tmp/log_autogain_error &
fi
```

</details>

<details>
<summary>可选：使用 gstreamer 而不是 ffmpeg</summary>

```
# 安装 gstreamer
sudo apt-get update
#sudo apt-get install -y \
#  gstreamer1.0-rtsp \
#  gstreamer1.0-tools \
#  gstreamer1.0-alsa \
#  gstreamer1.0-plugins-base \
#  gstreamer1.0-plugins-good \
#  gstreamer1.0-plugins-bad \
#  gstreamer1.0-plugins-ugly \
#  gstreamer1.0-libav
apt-get install libgstreamer1.0-dev libgstreamer-plugins-base1.0-dev libgstreamer-plugins-bad1.0-dev gstreamer1.0-plugins-base gstreamer1.0-plugins-good gstreamer1.0-plugins-bad gstreamer1.0-plugins-ugly gstreamer1.0-libav gstreamer1.0-tools gstreamer1.0-x gstreamer1.0-alsa gstreamer1.0-gl gstreamer1.0-gtk3 gstreamer1.0-qt5 gstreamer1.0-pulseaudio -y
```

创建名为 rtsp_audio_server.py 的脚本
```
#!/usr/bin/env python3

import gi
import sys
import logging
import os
import signal

gi.require_version('Gst', '1.0')
gi.require_version('GstRtspServer', '1.0')

from gi.repository import Gst, GstRtspServer, GLib

# 初始化 GStreamer
Gst.init(None)

# 配置日志记录
LOG_FILE = "gst_rtsp_server.log"
logging.basicConfig(
    filename=LOG_FILE,
    filemode='a',
    format='%(asctime)s %(levelname)s: %(message)s',
    level=logging.DEBUG  # 设置为 DEBUG 以获取全面的日志记录
)
logger = logging.getLogger(__name__)

class AudioFactory(GstRtspServer.RTSPMediaFactory):
    def __init__(self):
        super(AudioFactory, self).__init__()
        self.set_shared(True)          # 允许多个客户端访问流
        self.set_latency(500)          # 增加延迟到 500 毫秒以改善流的稳定性
        self.set_suspend_mode(GstRtspServer.RTSPSuspendMode.NONE)  # 防止没有客户端连接时流的暂停
        logger.debug("AudioFactory 初始化：shared=True, latency=500ms, suspend_mode=NONE.")

    def do_create_element(self, url):
        """
        创建并返回用于流式传输音频的 GStreamer 流水线。
        """
        pipeline_str = (
            "alsasrc device=plughw:0,0 do-timestamp=true buffer-time=2000000 latency-time=1000000 ! "  # 增加缓冲区大小
            "queue max-size-buffers=0 max-size-bytes=0 max-size-time=0 ! "         # 添加队列以处理缓冲区管理
            "audioconvert ! "                                # 将音频转换为适合的格式
            "audioresample ! "                               # 如果必要，重新采样音频
            "audio/x-raw,format=S16BE,channels=2,rate=48000 ! "  # 设置音频属性（速率 = 48kHz）
            "rtpL16pay name=pay0 pt=96"                     # RTP 的有效载荷
        )
        logger.debug(f"创建 GStreamer 流水线：{pipeline_str}")
        try:
            pipeline = Gst.parse_launch(pipeline_str)
            if not pipeline:
                logger.error("解析 GStreamer 流水线失败。")
                return None
            return pipeline
        except Exception as e:
            logger.error(f"创建流水线时发生异常：{e}")
            return None

class GstServer:
    def __init__(self):
        self.server = GstRtspServer.RTSPServer()
        self.server.set_service("8554")      # 设置 RTSP 服务器端口
        self.server.set_address("0.0.0.0")   # 监听所有网络接口
        logger.debug("RTSP 服务器配置：address=0.0.0.0, port=8554.")

        factory = AudioFactory()
        mount_points = self.server.get_mount_points()
        mount_points.add_factory("/birdmic", factory)  # 挂载点
        logger.debug("工厂挂载在 /birdmic.")

        self.server.attach(None)  # 将服务器附加到默认主要上下文
        logger.info("RTSP 服务器已附加并正在运行。")

def main():
    # 创建 GstServer 实例
    server = GstServer()
    print("RTSP 服务器正在运行，地址为 rtsp://localhost:8554/birdmic")
    logger.info("RTSP 服务器正在运行，地址为 rtsp://localhost:8554/birdmic")

    # 设置主循环并进行适当的日志记录
    loop = GLib.MainLoop()

    # 处理终止信号以确保优雅关闭
    def shutdown(signum, frame):
        logger.info(f"由于信号 {signum} 正在关闭 RTSP 服务器。")
        print("\n正在关闭 RTSP 服务器。")
        loop.quit()

    # 注册信号处理程序以实现优雅终止
    signal.signal(signal.SIGINT, shutdown)
    signal.signal(signal.SIGTERM, shutdown)

    try:
        loop.run()
    except Exception as e:
        logger.error(f"主循环遇到异常：{e}")
    finally:
        logger.info("RTSP 服务器已关闭。")

if __name__ == "__main__":
    # 确保日志文件存在
    if not os.path.exists(LOG_FILE):
        open(LOG_FILE, 'w').close()

    main()
```

</details>

<details>
<summary>可选：自动启动</summary>

```
chmod +x startmic.sh
crontab -e # 选择 nano 作为您的编辑器
```
在 `@reboot $HOME/startmic.sh` 中粘贴，然后保存并退出 nano。
重启 Pi，并使用 VLC 测试以确保 RTSP 流是实时的。

</details>

<details>
<summary>可选：禁用不必要的元素</summary>

- 优化 config.txt

sudo nano /boot/firmware/config.txt
```
# 启用音频和 USB 优化
dtparam=audio=off          # 禁用默认的板载音频以防止冲突
dtoverlay=disable-bt        # 禁用板载蓝牙以减少 USB 带宽使用
dtoverlay=disable-wifi      # 禁用板载 WiFi
# 将以太网限制为 100 Mbps（禁用千兆以太网）
dtparam=eth_max_speed=100
# USB 优化
dwc_otg.fiq_fix_enable=1    # 启用 FIQ（快速中断）处理以改善 USB 性能
max_usb_current=1           # 增加可用 USB 电流（如果 Scarlett 通过 USB 供电则需要）
# 附加音频设置（用于低延迟操作）
avoid_pwm_pll=1             # 使用更稳定的 PLL 作为音频时钟
# 可选：如果不需要，可以关闭 HDMI 和其他设置
hdmi_blanking=1             # 禁用 HDMI（节省电源并减少干扰）
```

- 禁用无用服务

```

# 禁用无用服务
sudo systemctl disable hciuart
sudo systemctl disable bluetooth
sudo systemctl disable triggerhappy
sudo systemctl disable avahi-daemon
sudo systemctl disable dphys-swapfile
sudo systemctl disable hciuart.service

# 禁用蓝牙
for element in bluetooth btbcm hci_uart btintel btrtl btusb; do
    sudo sed -i "/$element/d" /etc/modprobe.d/raspi-blacklist.conf
    echo "blacklist $element" | sudo tee -a /etc/modprobe.d/raspi-blacklist.conf
done

# 在 Raspberry Pi 上禁用视频（包括 V4L2）
for element in bcm2835_v4l2 bcm2835_codec bcm2835_isp videobuf2_vmalloc videobuf2_memops videobuf2_v4l2 videobuf2_common videodev; do
    sudo sed -i "/$element/d" /etc/modprobe.d/raspi-blacklist.conf
    echo "blacklist $element" | sudo tee -a /etc/modprobe.d/raspi-blacklist.conf
done

# 禁用 WiFi 电源管理
sudo iw dev wlan0 set power_save off
for element in brcmfmac brcmutil; do
    sudo sed -i "/$element/d" /etc/modprobe.d/raspi-blacklist.conf
    echo "blacklist $element" | sudo tee -a /etc/modprobe.d/raspi-blacklist.conf
done

# 禁用 USB 电源管理
echo 'on' | sudo tee /sys/bus/usb/devices/usb*/power/control

# 防止 Raspberry Pi 进入省电模式
sudo apt update
sudo apt install -y cpufrequtils
echo 'GOVERNOR="performance"' | sudo tee /etc/default/cpufrequtils
sudo systemctl disable ondemand
sudo systemctl stop ondemand

```

</details>

<details>
<summary>可选：安装 Focusrite 驱动程序</summary>
    
```
sudo apt-get install make linux-headers-$(uname -r)
curl -LO https://github.com/geoffreybennett/scarlett-gen2/releases/download/v6.9-v1.3/snd-usb-audio-kmod-6.6-v1.3.tar.gz
tar -xzf snd-usb-audio-kmod-6.6-v1.3.tar.gz
cd snd-usb-audio-kmod-6.6-v1.3
KSRCDIR=/lib/modules/$(uname -r)/build
make -j4 -C $KSRCDIR M=$(pwd) clean
make -j4 -C $KSRCDIR M=$(pwd)
sudo make -j4 -C $KSRCDIR M=$(pwd) INSTALL_MOD_DIR=updates/snd-usb-audio modules_install
sudo depmod
sudo reboot
dmesg | grep -A 5 -B 5 -i focusrite
```

</details>

<details>
<summary>可选：添加 RAM 磁盘</summary>
    
```
sudo cp /usr/share/systemd/tmp.mount /etc/systemd/system/tmp.mount
sudo systemctl enable tmp.mount
sudo systemctl start tmp.mount
```

</details>

<details>
<summary>可选：Focusrite Scarlett 2i2 的配置</summary>

将以下内容添加到 "$HOME/focusrite.sh" && chmod +x "$HOME/focusrite.sh"
```
#!/bin/bash

# 设置 PCM 控件以进行捕获
sudo amixer -c 0 cset numid=31 'Analogue 1'  # 'PCM 01' - 设置为 'Analogue 1'
sudo amixer -c 0 cset numid=32 'Analogue 1'  # 'PCM 02' - 设置为 'Analogue 1'
sudo amixer -c 0 cset numid=33 'Off'         # 'PCM 03' - 禁用
sudo amixer -c 0 cset numid=34 'Off'         # 'PCM 04' - 禁用

# 设置 DSP 输入控件（未使用，设置为关闭）
sudo amixer -c 0 cset numid=29 'Off'         # 'DSP Input 1'
sudo amixer -c 0 cset numid=30 'Off'         # 'DSP Input 2'

# 将 Line In 1 配置为单声道设置的主要输入
sudo amixer -c 0 cset numid=8 'Off'          # 'Line In 1 Air' - 保持为 'Off'
sudo amixer -c 0 cset numid=14 off           # 'Line In 1 Autogain' - 禁用
sudo amixer -c 0 cset numid=6 'Line'         # 'Line In 1 Level' - 设置级别为 'Line'
sudo amixer -c 0 cset numid=21 on           # 'Line In 1 Safe' - 启用以避免削波/噪音影响？

# 禁用 Line In 2 以最小化干扰（如果未使用）
sudo amixer -c 0 cset numid=9 'Off'          # 'Line In 2 Air'
sudo amixer -c 0 cset numid=17 off           # 'Line In 2 Autogain' - 禁用
sudo amixer -c 0 cset numid=16 0             # 'Line In 2 Gain' - 设置增益为 0（静音）
sudo amixer -c 0 cset numid=7 'Line'         # 'Line In 2 Level' - 设置为 'Line'
sudo amixer -c 0 cset numid=22 off           # 'Line In 2 Safe' - 禁用

# 设置 Line In 1-2 控件
sudo amixer -c 0 cset numid=12 off           # 'Line In 1-2 Link' - 单声道不需要连接
sudo amixer -c 0 cset numid=10 on            # 'Line In 1-2 Phantom Power' - 启用以供冷凝麦克风使用

# 将模拟输出设置为使用相同的混音作为两个通道（单声道设置）
sudo amixer -c 0 cset numid=23 'Mix A'       # 'Analogue Output 01' - 设置为 'Mix A'
sudo amixer -c 0 cset numid=24 'Mix A'       # 'Analogue Output 02' - 与输出 01 相同

# 将直接监控关闭以防止回声
sudo amixer -c 0 cset numid=53 'Off'         # 'Direct Monitor'

# 将输入选择设置为输入 1
sudo amixer -c 0 cset numid=11 'Input 1'     # 'Input Select'

# 优化监控混音设置以用于单声道输出
sudo amixer -c 0 cset numid=54 153           # 'Monitor 1 Mix A Input 01' - 设置为 153（约 -3.50 dB）
sudo amixer -c 0 cset numid=55 153           # 'Monitor 1 Mix A Input 02' - 设置为 153，以实现平衡输出
sudo amixer -c 0 cset numid=56 0             # 'Monitor 1 Mix A Input 03' - 静音未使用的通道
sudo amixer -c 0 cset numid=57 0             # 'Monitor 1 Mix A Input 04'

# 将同步状态设置为锁定
sudo amixer -c 0 cset numid=52 'Locked'      # 'Sync Status'

echo "单声道优化已应用。仅使用主输入和平衡输出。"
```
</details>

<details>
<summary>可选：麦克风的自动增益脚本</summary>

将以下内容添加到 "$HOME/autogain.py" && chmod +x "$HOME/autogain.py"

```python
#!/usr/bin/env python3
"""
动态麦克风增益调整脚本，具有交互式校准、
自我修改，以及实时 RMS 图的测试模式，使用 plotext

用法：
  正常操作（增益控制循环，使用默认值）：
      ./autogain.py
  交互校准（提示输入麦克风规格，然后询问是否保存值）：
      ./autogain.py --calibrate
  测试模式（带有色彩编码的实时 RMS 演变图）：
      ./autogain.py --test

作者：您的名字
日期：2025-04-08
"""

import argparse
import subprocess
import numpy as np
from scipy.signal import butter, sosfilt
import time
import re
import sys
import os

# ---------------------- 默认配置 ----------------------

MICROPHONE_NAME = "Line In 1 Gain"
MIN_GAIN_DB = 20
MAX_GAIN_DB = 40
GAIN_STEP_DB = 3

# 默认 RMS 阈值（在正常操作中使用）
NOISE_THRESHOLD_HIGH = 0.0012589
NOISE_THRESHOLD_LOW  = 0.00035

SAMPLING_RATE = 48000  # 48 kHz
LOWCUT        = 2000
HIGHCUT       = 8000
FILTER_ORDER  = 4
RTSP_URL      = "rtsp://192.168.178.124:8554/birdmic"
SLEEP_SECONDS = 10

REFERENCE_PRESSURE = 20e-6  # 20 µPa

# 默认麦克风规格（用于校准参考）
DEFAULT_SNR         = 80.0    # dB
DEFAULT_SELF_NOISE  = 14.0    # dB-A
DEFAULT_CLIPPING    = 120.0   # dB SPL
DEFAULT_SENSITIVITY = -28.0   # dB re 1 V/Pa

# 计算默认的全尺度幅度（用于推导默认分数）
def_full_scale = (REFERENCE_PRESSURE *
                  10 ** (DEFAULT_CLIPPING / 20) *
                  10 ** (DEFAULT_SENSITIVITY / 20))
# ---------------------- 参数解析 ----------------------

def parse_args():
    parser = argparse.ArgumentParser(
        description="动态麦克风增益调整，具有校准、测试模式和自我修改。"
    )
    parser.add_argument("--calibrate", action="store_true", help="运行交互校准模式")
    parser.add_argument("--test", action="store_true", help="运行测试模式，以使用 plotext 显示实时 RMS 图")
    return parser.parse_args()

# ---------------------- 音频和增益助手 ----------------------

def debug_print(msg, level="info"):
    current_time = time.strftime("%Y-%m-%d %H:%M:%S", time.localtime())
    print(f"[{current_time}] [{level.upper()}] {msg}")

def get_gain_db(mic_name):
    try:
        output = subprocess.check_output(['amixer', 'sget', mic_name],
                                           stderr=subprocess.STDOUT).decode()
        match = re.search(r'\[(-?\d+(\.\d+)?)dB\]', output)
        if match:
            return float(match.group(1))
        else:
            debug_print("未找到增益信息。", "warning")
    except subprocess.CalledProcessError as e:
        debug_print(f"amixer sget 失败：{e}", "error")
    return None

def set_gain_db(mic_name, gain_db):
    gain_db = max(min(gain_db, MAX_GAIN_DB), MIN_GAIN_DB)
    try:
        subprocess.check_call(['amixer', 'sset', mic_name, f'{int(gain_db)}dB'],
                              stdout=subprocess.DEVNULL, stderr=subprocess.STDOUT)
        debug_print(f"增益设置为：{gain_db} dB", "info")
        return True
    except subprocess.CalledProcessError as e:
        debug_print(f"设置增益失败：{e}", "error")
    return False

def capture_audio(rtsp_url, duration=5):
    cmd = ['ffmpeg', '-loglevel', 'error', '-rtsp_transport', 'tcp',
           '-i', rtsp_url, '-vn', '-f', 's16le', '-acodec', 'pcm_s16le',
           '-ar', str(SAMPLING_RATE), '-ac', '1', '-t', str(duration), '-']
    try:
        process = subprocess.Popen(cmd, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
        stdout, stderr = process.communicate()
        if process.returncode != 0:
            debug_print(f"ffmpeg 失败：{stderr.decode().strip()}", "error")
            return None
        return np.frombuffer(stdout, dtype=np.int16).astype(np.float32) / 32768.0
    except Exception as e:
        debug_print(f"音频捕获异常：{e}", "error")
        return None

def bandpass_filter(audio, lowcut, highcut, fs, order=4):
    sos = butter(order, [lowcut, highcut], btype='band', fs=fs, output='sos')
    return sosfilt(sos, audio)

def measure_rms(audio):
    return float(np.sqrt(np.mean(audio**2))) if len(audio) > 0 else 0.0

# ---------------------- 交互式校准 ----------------------

def prompt_float(prompt_str, default_val):
    while True:
        user_input = input(f"{prompt_str} [{default_val}]: ").strip()
        if user_input == "":
            return default_val
        try:
            return float(user_input)
        except ValueError:
            print("无效输入；请输入数值。")

def interactive_calibration():
    print("\n-- 交互式校准 --")
    print("输入麦克风特性（按 Enter 以接受默认值）：\n")
    snr = prompt_float("1) 信噪比 (dB)", DEFAULT_SNR)
    self_noise = prompt_float("2) 自噪声 (dB-A)", DEFAULT_SELF_NOISE)
    clipping = prompt_float("3) 剪切 SPL (dB)", DEFAULT_CLIPPING)
    sensitivity = prompt_float("4) 灵敏度 (dB re 1 V/Pa)", DEFAULT_SENSITIVITY)
    return {
        "snr": snr,
        "self_noise": self_noise,
        "clipping": clipping,
        "sensitivity": sensitivity,
    }

def calibrate_and_propose(mic_params):
    user_snr = mic_params["snr"]
    # 自噪声被收集但不直接用于这些计算。
    clipping = mic_params["clipping"]
    sensitivity = mic_params["sensitivity"]

    # 根据剪切和灵敏度计算用户的全尺度幅度：
    user_full_scale = (REFERENCE_PRESSURE *
                       10 ** (clipping / 20) *
                       10 ** (sensitivity / 20))
    
    # 从默认阈值推导默认分数：
    fraction_high_default = NOISE_THRESHOLD_HIGH / def_full_scale
    fraction_low_default  = NOISE_THRESHOLD_LOW  / def_full_scale

    # 使用用户 SNR 与默认 SNR 的比例调整阈值：
    snr_ratio = user_snr / DEFAULT_SNR

    proposed_high = fraction_high_default * user_full_scale * snr_ratio
    proposed_low  = fraction_low_default  * user_full_scale * snr_ratio

    # 对于增益范围，根据灵敏度的差异进行调整：
    gain_offset = (DEFAULT_SENSITIVITY - sensitivity)
    proposed_min_gain = MIN_GAIN_DB + gain_offset
    proposed_max_gain = MAX_GAIN_DB + gain_offset

    # 显示当前值和建议值：
    print("\n===============================================================")
    print("当前值：")
    print("---------------------------------------------------------------")
    print(f"  NOISE_THRESHOLD_HIGH: {NOISE_THRESHOLD_HIGH:.7f}")
    print(f"  NOISE_THRESHOLD_LOW:  {NOISE_THRESHOLD_LOW:.7f}")
    print(f"  MIN_GAIN_DB:          {MIN_GAIN_DB}")
    print(f"  MAX_GAIN_DB:          {MAX_GAIN_DB}")
    print("---------------------------------------------------------------\n")
    print("建议值：")
    print("---------------------------------------------------------------")
    print(f"  建议 NOISE_THRESHOLD_HIGH: {proposed_high:.7f}")
    print(f"  建议 NOISE_THRESHOLD_LOW:  {proposed_low:.7f}\n")
    print("  建议增益范围 (dB)：")
    print(f"    MIN_GAIN_DB: {proposed_min_gain:.2f}")
    print(f"    MAX_GAIN_DB: {proposed_max_gain:.2f}")
    print("---------------------------------------------------------------\n")

    return {
        "noise_threshold_high": proposed_high,
        "noise_threshold_low": proposed_low,
        "min_gain_db": proposed_min_gain,
        "max_gain_db": proposed_max_gain,
    }

def persist_calibration_to_script(script_path, proposal):
    subs = {
        "NOISE_THRESHOLD_HIGH": f"{proposal['noise_threshold_high']:.7f}",
        "NOISE_THRESHOLD_LOW":  f"{proposal['noise_threshold_low']:.7f}",
        "MIN_GAIN_DB":          f"{int(round(proposal['min_gain_db']))}",
        "MAX_GAIN_DB":          f"{int(round(proposal['max_gain_db']))}"
    }
    for var, val in subs.items():
        cmd = f"sed -i 's|^{var} = .*|{var} = {val}|' \"{script_path}\""
        os.system(cmd)
    print("✅ 脚本已使用新校准值更新。\n")

# ---------------------- 测试模式：使用 plotext 实时 RMS 图 ----------------------

def test_mode():
    try:
        import plotext as plt
    except ImportError:
        print("plotext 是测试模式所需的。请使用：pip install plotext 安装它")
        sys.exit(1)

    print("\n-- 测试模式：实时 RMS 线图（plotext）--")
    print("循环录制 5 秒样本。按 Ctrl+C 退出。\n")

    rms_history = []
    iterations = []
    max_points = 20  # 窗口中显示的样本数
    i = 0

    while True:
        audio = capture_audio(RTSP_URL, duration=5)
        if audio is None or len(audio) == 0:
            print("未捕获到音频，重试...")
            time.sleep(5)
            continue

        filtered_audio = bandpass_filter(audio, LOWCUT, HIGHCUT, SAMPLING_RATE, FILTER_ORDER)
        rms = measure_rms(filtered_audio)

        rms_history.append(rms)
        iterations.append(i)
        i += 1

        # 仅保留最后 `max_points` 条目
        if len(rms_history) > max_points:
            rms_history = rms_history[-max_points:]
            iterations = iterations[-max_points:]

        # 确定文本输出的状态
        if rms > NOISE_THRESHOLD_HIGH:
            status = "🔴 超过"
        elif rms < NOISE_THRESHOLD_LOW:
            status = "🔵 低于"
        else:
            status = "🟢 正常"

        # 绘制图形
        plt.clf()
        plt.plot(iterations, rms_history, marker="dot", color="cyan")
        plt.horizontal_line(NOISE_THRESHOLD_HIGH, color="red")
        plt.horizontal_line(NOISE_THRESHOLD_LOW, color="blue")
        plt.title("实时 RMS（线图）")
        plt.xlabel("迭代")
        plt.ylabel("RMS")
        plt.ylim(0, max(0.001, max(rms_history) * 1.2))
        plt.show()

        print(f"当前 RMS: {rms:.6f} — {status}")
        time.sleep(0.5)

# ---------------------- 动态增益控制循环 ----------------------

def dynamic_gain_control():
    debug_print("启动动态增益控制器...")
    set_gain_db(MICROPHONE_NAME, (MIN_GAIN_DB + MAX_GAIN_DB) // 2)
    while True:
        audio = capture_audio(RTSP_URL)
        if audio is None or len(audio) == 0:
            debug_print("未捕获到音频；重试...", "warning")
            time.sleep(SLEEP_SECONDS)
            continue
        filtered_audio = bandpass_filter(audio, LOWCUT, HIGHCUT, SAMPLING_RATE, FILTER_ORDER)
        rms = measure_rms(filtered_audio)
        debug_print(f"测得 RMS: {rms:.6f}", "info")
        current_gain = get_gain_db(MICROPHONE_NAME)
        if current_gain is None:
            debug_print("读取当前增益失败；跳过循环。", "warning")
            time.sleep(SLEEP_SECONDS)
            continue
        if rms > NOISE_THRESHOLD_HIGH:
            debug_print(f"信号过高：{rms:.6f} > {NOISE_THRESHOLD_HIGH:.7f}。正在降低增益...", "info")
            set_gain_db(MICROPHONE_NAME, current_gain - GAIN_STEP_DB)
        elif rms < NOISE_THRESHOLD_LOW:
            debug_print(f"信号过低：{rms:.6f} < {NOISE_THRESHOLD_LOW:.7f}。正在增加增益...", "info")
            set_gain_db(MICROPHONE_NAME, current_gain + GAIN_STEP_DB)
        else:
            debug_print("RMS 在可接受范围内；没有增益变化。", "info")
        time.sleep(SLEEP_SECONDS)

# ---------------------- 主 ----------------------

def main():
    args = parse_args()

    if args.calibrate:
        mic_params = interactive_calibration()
        proposal = calibrate_and_propose(mic_params)
        save = input("是否将这些值永久保存到脚本中？[y/N]: ").strip().lower()
        if save in ["y", "yes"]:
            script_path = os.path.abspath(__file__)
            persist_calibration_to_script(script_path, proposal)
            print("👍 校准值已保存。现在退出。\n")
        else:
            print("❌ 不保存值。退出。\n")
        sys.exit(0)

    if args.test:
        test_mode()
        sys.exit(0)

    # 正常操作：运行动态增益控制。
    dynamic_gain_control()

if __name__ == "__main__":
    main()