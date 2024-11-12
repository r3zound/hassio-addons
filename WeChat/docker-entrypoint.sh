#!/usr/bin/env bash

# Ensure Bashio is available
if ! command -v bashio > /dev/null; then
  echo "Bashio is not installed. Please install Bashio before running this script."
  exit 1
fi

# Create the configuration directory if it doesn't exist
CONFIG_PATH="/config/addons_config/wechat-server"
mkdir -p "$CONFIG_PATH"

# Copy the Python script 
cp /Wechat_Robot.py "$CONFIG_PATH/Wechat_Robot.py"

# Read add-on options using Bashio and write them to the .env file
echo "Creating .env file with configuration options..."
{
  echo "DATA_PATH=$(bashio::config 'data_path')"
  echo "TOKEN=$(bashio::config 'TOKEN')"
  echo "HOST=$(bashio::config 'HOST')"
  echo "APP_ID=$(bashio::config 'APP_ID')"
  echo "ENCODING_AES_KEY=$(bashio::config 'ENCODING_AES_KEY')"
  echo "ZHIPUAI_KEY=$(bashio::config 'ZhipuAI')"
  echo "PORT=$(bashio::config 'PORT')"
} > "$CONFIG_PATH/.env"

# Load environment variables from the .env file
if [ -f "$CONFIG_PATH/.env" ]; then
  export $(grep -v '^#' "$CONFIG_PATH/.env" | xargs)
else
  echo "Failed to create or load .env file."
  exit 1
fi

# Run the Python script
echo "Starting WeChat Robot..."
python3 "$CONFIG_PATH/Wechat_Robot.py"
