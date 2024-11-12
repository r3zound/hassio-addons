# WeChat Server Add-on for Home Assistant

## About

This add-on allows you to run a WeChat server within your Home Assistant environment. WeChat Server is an open-source, self-hosted chat platform that provides a secure and customizable communication solution.

## Features

- 微信公众号后台
- 支持多种架构: amd64, armhf, armv7, aarch64, i386
- 提供简单的配置选项

## Installation

1. Navigate to the Home Assistant Add-on Store
2. Click on the three dots in the top right corner and select "Repositories"
3. Add the following URL: `https://github.com/djhui/hassio-addons`
4. Find the "WeChat Server" add-on in the list and click "Install"

## Configuration

The add-on doesn't require any manual configuration. However, you can adjust the following options if needed:

The add-on can be configured using the following options in the `config.ini` file located at `/config/addons_config/wechat-server/config.ini`:

After changing the configuration file, you need to restart the add-on for the changes to take effect.

- `TOKEN`: your_wechat_token
- `HOST`: 0.0.0.0
- `APP_ID`: your_app_id
- `ENCODING_AES_KEY`: your_encoding_aes_key
- `ZhipuAI`: your_zhipuai_api_key

## Follow Us

Stay updated with our latest developments:
如果需要即时沟通,请扫码关注

![QR Code](https://github.com/user-attachments/assets/5c74897a-e32a-4fcc-b41c-1fc0d76a2494)

Scan the QR code above to follow us on social media.
