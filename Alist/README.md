# AList Addon for Home Assistant

AList is a file list program that supports multiple storage backends. This addon allows you to integrate AList with Home Assistant, providing a web interface to manage your files.

## Installation

1. Add the repository to your Home Assistant instance.
2. Find the "AList" addon in the addon store and click on it.
3. Click the "Install" button to install the addon.

## Configuration

The following options are available for configuration:

- `ssl` (bool): Enable or disable SSL. Default is `false`.
- `certfile` (str): Path to the SSL certificate file. Default is `fullchain.pem`.
- `keyfile` (str): Path to the SSL key file. Default is `privkey.pem`.

Example configuration:
