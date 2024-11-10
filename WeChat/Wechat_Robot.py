import werobot
import sys
import io
import configparser
from zhipuai import ZhipuAI

# Set the encoding to handle Unicode characters
sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding='utf-8')

# Read configuration from config.ini
config = configparser.ConfigParser()
config.read('hassio-addons/WeChat/config.ini')  # Updated path to config.ini

# Ensure the required configuration keys are present
TOKEN = config['DEFAULT'].get('TOKEN')
robot = werobot.WeRoBot(token=TOKEN)
robot.config['HOST'] = config['DEFAULT'].get('HOST', '0.0.0.0')
robot.config["APP_ID"] = config['DEFAULT'].get("APP_ID")
robot.config['ENCODING_AES_KEY'] = config['DEFAULT'].get('ENCODING_AES_KEY')
api_key = config['DEFAULT'].get('ZhipuAI')

client = ZhipuAI(api_key=api_key)

@robot.text
def echo(message):
    response1 = client.chat.completions.create(
        model="glm-4-Flash",
        messages=[
            {"role": "user", "content": message.content},
        ],
    )
    
    return response1.choices[0].message.content

@robot.error_page
def make_error_page(url):
    return "<h1>喵喵喵 %s 不是给麻瓜访问的快走开</h1>" % url

robot.run()
