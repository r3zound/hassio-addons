# 麦克风考虑事项
关键因素是麦克风的质量：Boya By-lm 40 或 clippy EM272（具有非常好的 aux-usb 转换器）是提高检测质量的关键。 
这里是我进行的一些示例测试（整个讨论线程也非常有趣）： https://github.com/mcguirepr89/BirdNET-Pi/discussions/39#discussioncomment-9706951 
https://github.com/mcguirepr89/BirdNET-Pi/discussions/1092#discussioncomment-9706191

我的建议：
- 最佳入门系统（< 50€）：Boya By-lm40（30€）+ deadcat（10€）
- 最佳中端系统（< 150€）：Clippy EM272 TRS/TRRS（55€）+ Rode AI micro trs/trrs 转 USB（70€）+ Rycote deadcat（27€）
- 最佳高端系统（< 400€）：Clippy EM272 XLR（85€）或 LOM Ucho Pro（75€）+ Focusrite Scarlet 2i2 第四代（200€）+ Bubblebee Pro Extreme deadcat（45€）

在欧洲购买高端麦克风的来源：
- Clippy（EM272）： https://www.veldshop.nl/en/clippy-xlr-em272z1-mono-microphone.html
- LOM（EM272）： https://store.lom.audio/collections/basicucho-series
- 沉浸式声音（AOM5024）： https://immersivesoundscapes.com/earsight-standard-v2/

# 应用设置建议
我通过使用相同的 rtsp  feed 并行运行我的 HA birdnet-pi 插件的两个版本，测试了很多设置，并比较参数的影响。
我的结论并不普遍，因为它似乎与所使用的区域和麦克风类型高度相关。例如，旧型号在澳大利亚表现更好，而新型号在欧洲表现更好。

- 模型
    - 版本：6k_v2,4 _(在欧洲表现更好，6k 在澳大利亚表现更好)_
    - 物种范围模型：v1 _(取消选中 v2.4；在欧洲似乎更稳健)_
    - 物种出现阈值：0,001 _(使用 v2.4 时为 0,00015；使用物种列表测试器检查适合你的正确值)_
- 音频设置
    - 默认
    - 通道：1 _(实际上并不重要，因为分析是对单声道信号进行的；1 可以减少保存的音频大小，但根据我的经验会产生稍微混乱的声谱图)_
    - 记录长度：18 _(这是因为我使用了 0,5 的重叠；因此分析 0-3s；2,5-5,5s；5-8s；7,5-10,5；10-13；12,5-15,5；15-18)_
    - 提取长度：9s _(可以是 6，但我喜欢听我的鸟:-))_
    - 音频格式：mp3 _(为什么要使用其他格式)_
- Birdnet-lite 设置
    - 重叠：0,5s
    - 最小置信度：0,7
    - Sigmoid 灵敏度：1,25 _(我尝试过 1,00，但这给出了更多的误报；因为降低这个值会增加灵敏度)_

# 设置 RTSP 服务器

灵感来源： https://github.com/mcguirepr89/BirdNET-Pi/discussions/1006#discussioncomment-6747450

<details>
<summary>在你的桌面上</summary>

- 下载映像
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

# 查看音频设备参数。示例：
arecord -D hw:1,0 --dump-hw-params
```

### 添加启动脚本
sudo nano startmic.sh && chmod +x startmic.sh
```
#!/bin/bash
echo "Starting birdmic"

# 禁用千兆 Ethernet
sudo ethtool -s eth0 speed 100 duplex full autoneg on

# 检测 Scarlett 2i2 卡索引 - 仅在使用该卡时相关
SCARLETT_INDEX=$(arecord -l | grep -i "Scarlett" | awk '{print $2}' | sed 's/://')

if [ -z "$SCARLETT_INDEX" ]; then
    echo "错误：未找到 Scarlett 2i2！使用 0 作为默认值"
    SCARLETT_INDEX="0"
fi

# 首先启动 mediamtx 并稍等以初始化
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

# 如果存在，运行 focusrite 和 autogain 脚本
if [ -f "$HOME/focusrite.sh" ]; then
    sudo python3 -u "$HOME/focusrite.sh" >/tmp/log_focusrite 2>/tmp/log_focusrite_error &
fi

if [ -f "$HOME/autogain.py" ]; then
    sudo python3 -u "$HOME/autogain.py" >/tmp/log_autogain 2>/tmp/log_autogain_error &
fi
```

</details>

<details>
<summary>可选：使用 GStreamer 代替 FFmpeg</summary>

```
# 安装 GStreamer
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

创建一个名为 rtsp_audio_server.py 的脚本
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
    level=logging.DEBUG  # 设置为 DEBUG 以获取全面日志
)
logger = logging.getLogger(__name__)

class AudioFactory(GstRtspServer.RTSPMediaFactory):
    def __init__(self):
        super(AudioFactory, self).__init__()
        self.set_shared(True)          # 允许多个客户端访问流
        self.set_latency(500)          # 增加延迟到 500ms 以改善流稳定性
        self.set_suspend_mode(GstRtspServer.RTSPSuspendMode.NONE)  # 当没有连接客户端时，防止流的暂停
        logger.debug("AudioFactory initialized: shared=True, latency=500ms, suspend_mode=NONE.")

    def do_create_element(self, url):
        """
        创建并返回用于流式音频的 GStreamer 管道。
        """
        pipeline_str = (
            "alsasrc device=plughw:0,0 do-timestamp=true buffer-time=2000000 latency-time=1000000 ! "  # 增加缓冲区大小
            "queue max-size-buffers=0 max-size-bytes=0 max-size-time=0 ! "         # 添加队列以处理缓冲区管理
            "audioconvert ! "                                # 将音频转换为适当格式
            "audioresample ! "                               # 如有必要，对音频进行重采样
            "audio/x-raw,format=S16BE,channels=2,rate=48000 ! "  # 设置音频属性（速率 = 48kHz）
            "rtpL16pay name=pay0 pt=96"                     # RTP 的有效负载
        )
        logger.debug(f"Creating GStreamer pipeline: {pipeline_str}")
        try:
            pipeline = Gst.parse_launch(pipeline_str)
            if not pipeline:
                logger.error("Failed to parse GStreamer pipeline.")
                return None
            return pipeline
        except Exception as e:
            logger.error(f"Exception while creating pipeline: {e}")
            return None

class GstServer:
    def __init__(self):
        self.server = GstRtspServer.RTSPServer()
        self.server.set_service("8554")      # 设置 RTSP 服务器端口
        self.server.set_address("0.0.0.0")   # 监听所有网络接口
        logger.debug("RTSP server configured: address=0.0.0.0, port=8554.")

        factory = AudioFactory()
        mount_points = self.server.get_mount_points()
        mount_points.add_factory("/birdmic", factory)  # 挂载点
        logger.debug("Factory mounted at /birdmic.")

        self.server.attach(None)  # 将服务器附加到默认主上下文
        logger.info("RTSP server attached and running.")

def main():
    # 创建 GstServer 实例
    server = GstServer()
    print("RTSP server is running at rtsp://localhost:8554/birdmic")
    logger.info("RTSP server is running at rtsp://localhost:8554/birdmic")

    # 设置主循环并正确记录
    loop = GLib.MainLoop()

    # 处理终止信号以确保优雅地关闭
    def shutdown(signum, frame):
        logger.info(f"Shutting down RTSP server due to signal {signum}.")
        print("\nShutting down RTSP server.")
        loop.quit()

    # 注册信号处理程序以优雅地终止
    signal.signal(signal.SIGINT, shutdown)
    signal.signal(signal.SIGTERM, shutdown)

    try:
        loop.run()
    except Exception as e:
        logger.error(f"Main loop encountered an exception: {e}")
    finally:
        logger.info("RTSP server has been shut down.")

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
crontab -e # 选择 nano 作为你的编辑器
```
粘贴 `@reboot $HOME/startmic.sh` 然后保存并退出 nano。
重启 Pi 并使用 VLC 再次测试以确保 RTSP 流是实时的。

</details>

<details>
<summary>可选：禁用不必要的元素</summary>

- 优化 config.txt

sudo nano /boot/firmware/config.txt
```
# 启用音频和 USB 优化
dtparam=audio=off          # 禁用默认的板载音频以防止冲突
dtoverlay=disable-bt        # 禁用板载蓝牙以减少 USB 带宽使用
dtoverlay=disable-wifi      # 禁用板载 wifi
# 将以太网限制为 100 Mbps（禁用千兆以太网）
dtparam=eth_max_speed=100
# USB 优化
dwc_otg.fiq_fix_enable=1    # 启用 FIQ（快速中断）处理以改善 USB 性能
max_usb_current=1           # 增加可用的 USB 电流（如果 Scarlett 通过 USB 供电，则需要）
# 其他音频设置（用于低延迟操作）
avoid_pwm_pll=1             # 使用更稳定的 PLL 作为音频时钟
# 可选：如果不需要，可以关闭 HDMI 和其他设置
hdmi_blanking=1             # 禁用 HDMI（省电并减少干扰）
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

# 禁用树莓派上的视频（包括 V4L2）
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

# 防止树莓派进入省电模式
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

在 "$HOME/focusrite.sh" 中添加此内容 && chmod +x "$HOME/focusrite.sh"
```
#!/bin/bash

# 设置 PCM 控制以进行捕获
sudo amixer -c 0 cset numid=31 'Analogue 1'  # 'PCM 01' - 设置为 'Analogue 1'
sudo amixer -c 0 cset numid=32 'Analogue 1'  # 'PCM 02' - 设置为 'Analogue 1'
sudo amixer -c 0 cset numid=33 'Off'         # 'PCM 03' - 禁用
sudo amixer -c 0 cset numid=34 'Off'         # 'PCM 04' - 禁用

# 设置 DSP 输入控制（未使用，设置为关闭）
sudo amixer -c 0 cset numid=29 'Off'         # 'DSP Input 1'
sudo amixer -c 0 cset numid=30 'Off'         # 'DSP Input 2'

# 将线路输入 1 配置为单声道设置的主要输入
sudo amixer -c 0 cset numid=8 'Off'          # 'Line In 1 Air' - 保持 'Off'
sudo amixer -c 0 cset numid=14 off           # 'Line In 1 Autogain' - 禁用
sudo amixer -c 0 cset numid=6 'Line'         # 'Line In 1 Level' - 设置级别为 'Line'
sudo amixer -c 0 cset numid=21 on            # 'Line In 1 Safe' - 启用以避免削波/噪声影响？

# 禁用线路输入 2 以最小化干扰（如果未使用）
sudo amixer -c 0 cset numid=9 'Off'          # 'Line In 2 Air'
sudo amixer -c 0 cset numid=17 off           # 'Line In 2 Autogain' - 禁用
sudo amixer -c 0 cset numid=16 0             # 'Line In 2 Gain' - 设置增益为 0（静音）
sudo amixer -c 0 cset numid=7 'Line'         # 'Line In 2 Level' - 设置为 'Line'
sudo amixer -c 0 cset numid=22 off           # 'Line In 2 Safe' - 禁用

# 设置线路输入 1-2 控制
sudo amixer -c 0 cset numid=12 off           # 'Line In 1-2 Link' - 单声道无需链接
sudo amixer -c 0 cset numid=10 on            # 'Line In 1-2 Phantom Power' - 启用以供电电容麦克风

# 设置模拟输出以使用相同的混合信号（单声道设置）
sudo amixer -c 0 cset numid=23 'Mix A'       # 'Analogue Output 01' - 设置为 'Mix A'
sudo amixer -c 0 cset numid=24 'Mix A'       # 'Analogue Output 02' - 与输出 01 相同的混合

# 将直接监听设置为关闭以防止反馈
sudo amixer -c 0 cset numid=53 'Off'         # 'Direct Monitor'

# 设置输入选择为输入 1
sudo amixer -c 0 cset numid=11 'Input 1'     # 'Input Select'

# 优化监控混合设置以进行单声道输出
sudo amixer -c 0 cset numid=54 153           # 'Monitor 1 Mix A Input 01' - 设置为 153（大约 -3.50 dB）
sudo amixer -c 0 cset numid=55 153           # 'Monitor 1 Mix A Input 02' - 设置为 153 以获得平衡输出
sudo amixer -c 0 cset numid=56 0             # 'Monitor 1 Mix A Input 03' - 静音未使用的通道
sudo amixer -c 0 cset numid=57 0             # 'Monitor 1 Mix A Input 04'

# 设置同步状态为锁定
sudo amixer -c 0 cset numid=52 'Locked'      # 'Sync Status'

echo "应用单声道优化。仅使用主要输入和平衡输出。"
```
</details>

<details>
<summary>可选：麦克风的自动增益脚本</summary>

在 "$HOME/autogain.py" 中添加此内容 && chmod +x "$HOME/autogain.py"

```python
#!/usr/bin/env python3
"""
麦克风增益调整脚本，具有 THD 和过载检测

此脚本从 RTSP 流捕获音频，处理它以计算 2000-8000 Hz 频率带内的 RMS，
检测削波，计算全频范围内的总谐波失真（THD），并根据预定义的噪声阈值、趋势和失真指标调整麦克风增益。

依赖：
- numpy
- scipy
- ffmpeg（已安装并可在 PATH 中访问）
- amixer（用于麦克风增益控制）

作者：OpenAI ChatGPT
日期：2024-10-28（更新）

更新日志：
- 2024-10-27：将采样率增加到 48,000 Hz。
- 2024-10-27：扩展了全频范围的 THD 计算。
- 2024-10-27：增加了增益稳定性延迟以减少频繁调整。
- 2024-10-27：增强了 RTSP 流的弹性与重试逻辑。
- 2024-10-27：增强了调试输出并添加日志级别。
- 2024-10-28：添加摘要日志模式以简化输出。
- 2024-10-28：删除了增益稳定性延迟以实现即时增益调整。
"""

import subprocess
import numpy as np
from scipy.signal import butter, sosfilt, find_peaks
import time
import re

# ---------------------------- 配置 ----------------------------

# 麦克风设置
MICROPHONE_NAME = "Line In 1 Gain"
MIN_GAIN_DB = 20
MAX_GAIN_DB = 40
DECREASE_GAIN_STEP_DB = 1
INCREASE_GAIN_STEP_DB = 5
CLIPPING_REDUCTION_DB = 3

# 噪声阈值
NOISE_THRESHOLD_HIGH = 0.001
NOISE_THRESHOLD_LOW = 0.00035

# 趋势检测
TREND_COUNT_THRESHOLD = 3

# 采样率
SAMPLING_RATE = 44100

# RTSP 流 URL
RTSP_URL = "rtsp://192.168.178.124:8554/birdmic"

# 调试和摘要模式
DEBUG = 1            # 调试模式（1 为启用，0 为禁用）
SUMMARY_MODE = True  # 摘要模式（仅输出摘要）

# 麦克风特性
MIC_SENSITIVITY_DB = -28
MIC_CLIPPING_SPL = 120

# 校准常数
REFERENCE_PRESSURE = 20e-6

# THD 设置
THD_FUNDAMENTAL_THRESHOLD_DB = 60
MAX_THD_PERCENTAGE = 5.0

# -----------------------------------------------------------------------


def debug_print(msg, level="info"):
    """
    打印调试消息，如果启用了调试模式则带有日志级别。
    :param msg: 要打印的调试消息。
    :param level: 日志级别 - "info"，"warning"，"error"。
    """
    if DEBUG:
        current_time = time.strftime("%Y-%m-%d %H:%M:%S", time.localtime())
        print(f"[{current_time}] [{level.upper()}] {msg}")


def summary_log(current_gain, clipping, rms_amplitude, thd_percentage):
    """
    输出摘要日志，包含日期、时间、当前增益、削波状态、背景噪声和 THD。
    :param current_gain: 当前麦克风增益（dB）。
    :param clipping: 削波状态（是/否）。
    :param rms_amplitude: 背景噪声 RMS 幅度。
    :param thd_percentage: THD 百分比。
    """
    if SUMMARY_MODE:
        current_time = time.strftime("%Y-%m-%d %H:%M:%S", time.localtime())
        clipping_status = "Yes" if clipping else "No"
        print(f"[{current_time}] [SUMMARY] Gain: {current_gain:.1f} dB | Clipping: {clipping_status} | "
              f"Noise: {rms_amplitude:.5f} | THD: {thd_percentage:.2f}%")


def get_gain_db(mic_name):
    """
    使用 amixer 检索指定麦克风的当前增益设置。
    """
    cmd = ['amixer', 'sget', mic_name]
    try:
        output = subprocess.check_output(cmd, stderr=subprocess.STDOUT).decode()
        match = re.search(r'\[(-?\d+(\.\d+)?)dB\]', output)
        if match:
            gain_db = float(match.group(1))
            debug_print(f"Retrieved gain: {gain_db} dB", "info")
            return gain_db
        else:
            debug_print("No gain information found in amixer output.", "warning")
            return None
    except subprocess.CalledProcessError as e:
        debug_print(f"amixer sget failed: {e}", "error")
        return None


def set_gain_db(mic_name, gain_db):
    """
    使用 amixer 设置指定麦克风的增益。
    """
    gain_db_int = int(gain_db)
    if gain_db_int > MAX_GAIN_DB:
        debug_print(f"Requested gain {gain_db_int} dB exceeds MAX_GAIN_DB {MAX_GAIN_DB} dB. Skipping.", "warning")
        return False  # 不超过最大增益
    cmd = ['amixer', 'sset', mic_name, f'{gain_db}dB']
    try:
        subprocess.check_call(cmd, stdout=subprocess.DEVNULL, stderr=subprocess.STDOUT)
        debug_print(f"Set gain to: {gain_db} dB", "info")
        return True
    except subprocess.CalledProcessError as e:
        debug_print(f"amixer sset failed: {e}", "error")
        return False


def find_fundamental_frequency(fft_freqs, fft_magnitude, min_freq=2000, max_freq=8000):
    """
    动态查找指定范围内的基频。
    """
    idx_min = np.searchsorted(fft_freqs, min_freq)
    idx_max = np.searchsorted(fft_freqs, max_freq)
    if idx_max <= idx_min:
        return None, 0

    search_magnitude = fft_magnitude[idx_min:idx_max]
    search_freqs = fft_freqs[idx_min:idx_max]
    peaks, properties = find_peaks(search_magnitude, height=np.max(search_magnitude) * 0.1)
    if len(peaks) == 0:
        return None, 0

    max_peak_idx = np.argmax(properties['peak_heights'])
    fundamental_freq = search_freqs[peaks[max_peak_idx]]
    fundamental_amplitude = search_magnitude[peaks[max_peak_idx]]

    debug_print(f"Detected fundamental frequency: {fundamental_freq:.2f} Hz with amplitude {fundamental_amplitude:.4f}", "info")
    return fundamental_freq, fundamental_amplitude


def thd_calculation(audio, sampling_rate, num_harmonics=5):
    """
    计算音频信号的总谐波失真（THD）。
    """
    fft_vals = np.fft.rfft(audio)
    fft_freqs = np.fft.rfftfreq(len(audio), 1 / sampling_rate)
    fft_magnitude = np.abs(fft_vals)
    fundamental_freq, fundamental_amplitude = find_fundamental_frequency(fft_freqs, fft_magnitude)

    if fundamental_freq is None or fundamental_amplitude < 1e-6:
        debug_print("Fundamental frequency not detected or amplitude too low. Skipping THD calculation.", "warning")
        return 0.0

    harmonic_amplitudes = []
    for n in range(2, num_harmonics + 1):
        harmonic_freq = n * fundamental_freq
        if harmonic_freq > sampling_rate / 2:
            break
        harmonic_idx = np.argmin(np.abs(fft_freqs - harmonic_freq))
        harmonic_amp = fft_magnitude[harmonic_idx]
        harmonic_amplitudes.append(harmonic_amp)
        debug_print(f"Harmonic {n} frequency: {harmonic_freq:.2f} Hz, amplitude: {harmonic_amp:.4f}", "info")

    harmonic_sum = np.sqrt(np.sum(np.square(harmonic_amplitudes)))
    thd = (harmonic_sum / fundamental_amplitude) * 100 if fundamental_amplitude > 0 else 0.0
    debug_print(f"THD Calculation: {thd:.2f}%", "info")
    return thd


def calculate_spl(audio, mic_sensitivity_db):
    """
    根据音频信号计算声压级（SPL）。
    """
    rms_amplitude = np.sqrt(np.mean(audio ** 2))
    if rms_amplitude == 0:
        debug_print("RMS amplitude is zero. SPL cannot be calculated.", "warning")
        return -np.inf

    mic_sensitivity_linear = 10 ** (mic_sensitivity_db / 20)
    pressure = rms_amplitude / mic_sensitivity_linear
    spl = 20 * np.log10(pressure / REFERENCE_PRESSURE)
    debug_print(f"Calculated SPL: {spl:.2f} dB", "info")
    return spl


def detect_microphone_overload(spl, mic_clipping_spl):
    """
    检测计算出的 SPL 是否接近麦克风的削波 SPL。
    """
    if spl >= mic_clipping_spl - 3:
        debug_print("Microphone overload detected.", "warning")
        return True
    return False


def calculate_noise_rms_and_thd(rtsp_url, bandpass_sos, sampling_rate, num_bins=5):
    """
    从 RTSP 流捕获音频，计算 RMS、THD 和 SPL，并检测麦克风过载。
    """
    cmd = [
        'ffmpeg', '-loglevel', 'error', '-rtsp_transport', 'tcp', '-i', rtsp_url,
        '-vn', '-f', 's16le', '-acodec', 'pcm_s16le', '-ar', str(sampling_rate), '-ac', '1', '-t', '5', '-'
    ]

    retries = 3
    for attempt in range(retries):
        try:
            debug_print(f"Attempt {attempt + 1} to capture audio from {rtsp_url}", "info")
            process = subprocess.Popen(cmd, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
            stdout, stderr = process.communicate()

            if process.returncode != 0:
                debug_print(f"ffmpeg failed with error: {stderr.decode()}", "error")
                time.sleep(5)
                continue

            audio = np.frombuffer(stdout, dtype=np.int16).astype(np.float32) / 32768.0
            debug_print(f"Captured {len(audio)} samples from audio stream.", "info")
            if len(audio) == 0:
                debug_print("No audio data captured.", "warning")
                time.sleep(5)
                continue

            filtered_audio = sosfilt(bandpass_sos, audio)
            rms_amplitude = np.sqrt(np.mean(filtered_audio ** 2))
            thd_percentage = thd_calculation(filtered_audio, sampling_rate)
            spl = calculate_spl(filtered_audio, MIC_SENSITIVITY_DB)
            overload = detect_microphone_overload(spl, MIC_CLIPPING_SPL)

            return rms_amplitude, thd_percentage, spl, overload

        except Exception as e:
            debug_print(f"Exception during audio processing: {e}", "error")
            time.sleep(5)  # 小延迟后重试

    return None, None, None, False


def main():
    """
    主循环不断监控背景噪声，检测削波，计算 THD，
    并根据 RTSP 流的弹性调整麦克风增益并重试逻辑。
    """
    TREND_COUNT = 0
    PREVIOUS_TREND = 0

    # 预先计算带通滤波器系数，更新采样率
    LOWCUT = 2000
    HIGHCUT = 8000
    FILTER_ORDER = 5
    sos = butter(FILTER_ORDER, [LOWCUT, HIGHCUT], btype='band', fs=SAMPLING_RATE, output='sos')

    # 设置麦克风增益为最大增益
    success = set_gain_db(MICROPHONE_NAME, MAX_GAIN_DB)
    if success:
        print(f"Microphone gain set to {MAX_GAIN_DB} dB at start.")
    else:
        print("Failed to set microphone gain at start. Exiting.")
        return

    while True:
        rms, thd, spl, overload = calculate_noise_rms_and_thd(RTSP_URL, sos, SAMPLING_RATE)

        if rms is None:
            print("Failed to compute noise RMS. Retrying in 1 minute...")
            time.sleep(60)
            continue

        # 如果检测到过载则调整增益
        if overload:
            current_gain_db = get_gain_db(MICROPHONE_NAME)
            if current_gain_db is not None:
                NEW_GAIN_DB = max(current_gain_db - CLIPPING_REDUCTION_DB, MIN_GAIN_DB)
                if set_gain_db(MICROPHONE_NAME, NEW_GAIN_DB):
                    print(f"Clipping detected. Reduced gain to {NEW_GAIN_DB} dB")
                    debug_print(f"Gain reduced to {NEW_GAIN_DB} dB due to clipping.", "warning")
            # 无需稳定延迟；继续到下一个迭代
            # 在检测到削波的情况下跳过趋势调整
            summary_log(current_gain_db if current_gain_db else MIN_GAIN_DB, True, rms, thd)
            time.sleep(60)
            continue

        # 如果 SPL 超过阈值则处理 THD
        if spl >= THD_FUNDAMENTAL_THRESHOLD_DB:
            if thd > MAX_THD_PERCENTAGE:
                debug_print(f"高 THD 检测到: {thd:.2f}%", "warning")
                current_gain_db = get_gain_db(MICROPHONE_NAME)
                if current_gain_db is not None:
                    NEW_GAIN_DB = max(current_gain_db - DECREASE_GAIN_STEP_DB, MIN_GAIN_DB)
                    if set_gain_db(MICROPHONE_NAME, NEW_GAIN_DB):
                        print(f"高 THD 检测到。增益降低到 {NEW_GAIN_DB} dB")
                        debug_print(f"增益降低到 {NEW_GAIN_DB} dB 由于高 THD。", "info")
            else:
                debug_print("THD 在可接受范围内。", "info")
        else:
            debug_print("SPL 低于 THD 计算阈值。跳过 THD 检查。", "info")

        # 确定噪声趋势
        if rms > NOISE_THRESHOLD_HIGH:
            CURRENT_TREND = 1
        elif rms < NOISE_THRESHOLD_LOW:
            CURRENT_TREND = -1
        else:
            CURRENT_TREND = 0

        debug_print(f"当前趋势: {CURRENT_TREND}", "info")

        if CURRENT_TREND != 0:
            if CURRENT_TREND == PREVIOUS_TREND:
                TREND_COUNT += 1
            else:
                TREND_COUNT = 1
                PREVIOUS_TREND = CURRENT_TREND
        else:
            TREND_COUNT = 0

        debug_print(f"趋势计数: {TREND_COUNT}", "info")

        current_gain_db = get_gain_db(MICROPHONE_NAME)

        if current_gain_db is None:
            print("无法获取当前增益水平。将在 1 分钟后重试...")
            time.sleep(60)
            continue

        debug_print(f"当前增益: {current_gain_db} dB", "info")

        # 输出当前状态的摘要日志
        summary_log(current_gain_db, overload, rms, thd)

        # 如果达到阈值计数，则根据噪声趋势调整增益
        if TREND_COUNT >= TREND_COUNT_THRESHOLD:
            if CURRENT_TREND == 1 and int(current_gain_db) > MIN_GAIN_DB:
                # 将增益减少 DECREASE_GAIN_STEP_DB dB
                NEW_GAIN_DB = max(current_gain_db - DECREASE_GAIN_STEP_DB, MIN_GAIN_DB)
                if set_gain_db(MICROPHONE_NAME, NEW_GAIN_DB):
                    print(f"背景噪声高。增益降低到 {NEW_GAIN_DB} dB")
                    debug_print(f"增益由于高噪声降低到 {NEW_GAIN_DB} dB。", "info")
                TREND_COUNT = 0
            elif CURRENT_TREND == -1 and int(current_gain_db) < MAX_GAIN_DB:
                # 将增益增加 INCREASE_GAIN_STEP_DB dB
                NEW_GAIN_DB = min(current_gain_db + INCREASE_GAIN_STEP_DB, MAX_GAIN_DB)
                if set_gain_db(MICROPHONE_NAME, NEW_GAIN_DB):
                    print(f"背景噪声低。增益增加到 {NEW_GAIN_DB} dB")
                    debug_print(f"增益由于低噪声增加到 {NEW_GAIN_DB} dB。", "info")
                TREND_COUNT = 0
        else:
            debug_print("根据噪声趋势不需要调整增益。", "info")

        # 在下一次迭代之前休眠 1 分钟
        time.sleep(60)


if __name__ == "__main__":
    main()