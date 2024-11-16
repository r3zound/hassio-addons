# WeChat Server Add-on for Home Assistant

## About

This add-on enables you to host a WeChat server within your Home Assistant setup. It is an open-source, self-hosted chat platform offering a secure and customizable communication solution.

## Features

- WeChat public account backend
- Supports multiple architectures: amd64, armhf, armv7, aarch64, i386
- Provides simple configuration options

## Installation

1. Go to the Home Assistant Add-on Store
2. Click on the three dots in the top right corner and select "Repositories"
3. Add this URL: `https://github.com/djhui/hassio-addons`
4. Locate the "WeChat Server" add-on in the list and click "Install"

## Configuration

While the add-on doesn't require manual configuration, you can modify the following options if necessary:

Configure the add-on using the options in the `config.ini` file located at `/config/addons_config/wechat-server/config.ini`:

After editing the configuration file, restart the add-on for the changes to take effect.

- `TOKEN`: your_wechat_token
- `HOST`: 0.0.0.0
- `APP_ID`: your_app_id
- `ENCODING_AES_KEY`: your_encoding_aes_key
- `ZhipuAI`: your_zhipuai_api_key

## Follow Us

Stay informed with our latest updates:
For instant communication, please scan the QR code to follow us
扫描二维码关注我吧

![QR Code](https://gitee.com/desmond_GT/hassio-addons/raw/main/WeChat_QRcode.png)

Scan the QR code above to connect with us on social media.
