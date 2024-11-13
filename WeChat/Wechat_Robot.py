import werobot
import sys
import io
import os
import json
from zhipuai import ZhipuAI
import configparser

# Set the encoding to handle Unicode characters
sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding='utf-8')

# Load configuration from the config.ini file
config = configparser.ConfigParser()
config.read('/config/addons_config/wechat-server/config.ini')

HOST = config.get('server', 'host', fallback='0.0.0.0')  # Default to '0.0.0.0' if not set
PORT = config.getint('server', 'port', fallback=8888)  # Default to 8888 if not set
APP_ID = config.get('wechat', 'app_id', fallback='test')  
APP_SECRET = config.get('wechat', 'appsecret', fallback='your_appsecret')  # 获取appsecret配置
TOKEN = config.get('wechat', 'token', fallback='WeRobot')  # Default to 'WeRobot' if not set
ENCODING_AES_KEY = config.get('wechat', 'encoding_aes_key', fallback='test')  

ZHIPUAI_KEY = config.get('zhipuai', 'zhipuai_api_key', fallback='test') 

# Initialize WeRoBot with the token from the config
robot = werobot.WeRoBot(token=TOKEN)
robot.config.update({
    'HOST': HOST,
    'APP_ID': APP_ID,
    'APP_SECRET': APP_SECRET,  # 新增 appsecret 配置
    'ENCODING_AES_KEY': ENCODING_AES_KEY,
    'PORT': PORT
})


# Initialize ZhipuAI and set the API key
client = ZhipuAI(api_key=ZHIPUAI_KEY)

# Load custom menu from JSON file
def load_menu():
    if os.path.exists('/config/addons_config/wechat-server/menu.json'):
        with open('/config/addons_config/wechat-server/menu.json', 'r', encoding='utf-8') as f:
            return json.load(f)
    return None

# Set the custom menu for the WeChat bot
def set_menu():
    menu_data = load_menu()
    if menu_data:
        robot.client.create_menu(menu_data)

@robot.text
def echo(message):
    response1 = client.chat.completions.create(
        model="glm-4-flash",
        messages=[
            {"role": "system", "content": "你是我微信公众号的智能助理，以纯文本的方式对话，简洁明了，不长篇大论。你的名字叫老王杂谈说。你尊重每个跟你对话的对象，并且多用礼貌用语"},
            {"role": "user", "content": "我是一位老王杂谈说的一个读者"},
            {"role": "user", "content": message.content},
        ],
    )
    return response1.choices[0].message.content

# Set up the custom menu when the server starts
set_menu()

robot.run()
