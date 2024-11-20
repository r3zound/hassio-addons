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
APP_ID = config.get('wechat', 'app_id', fallback='aa')  
APP_SECRET = config.get('wechat', 'appsecret', fallback='aa')  # 获取appsecret配置
TOKEN = config.get('wechat', 'token', fallback='WeRobot')  # Default to 'WeRobot' if not set
ENCODING_AES_KEY = config.get('wechat', 'encoding_aes_key', fallback='aaa')  

ZHIPUAI_KEY = config.get('zhipuai', 'zhipuai_api_key', fallback='aa') 

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

def GLM(userid, content):
    response1 = client.chat.completions.create(
        model="glm-4-flash",
        messages=[
            {"role": "system", "content": "你是我微信公众号的智能助理，以纯文本的方式对话，简洁明了，不长篇大论。你的名字叫《老王杂谈说》。你尊重每个跟你对话的对象，并且多用礼貌用语"},
            {"role": "user", "content": "我是一位老王杂谈说的一个读者，喜欢看您这个公众号的文章"},
            {"role": "user", "content": content},
        ],
        user_id= userid
    )
    return response1.choices[0].message.content

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
    reply_msg = GLM(message.source, message.content)
    return reply_msg

@robot.voice
def handle_voice(message):
    # Get sender information
    if message.recognition:
        reply_msg = GLM(message.source, message.content)
        return reply_msg
    else:
        return "抱歉，我未能识别您的语音。是否可以发送文本信息。"

@robot.location
def handle_location(message):
    return message.label

@robot.link
def handle_link(message):
    return "不好意思，我还没有能力处理链接信息"

@robot.image
def handle_image(message):
    return "不好意思，我还没有能力处理图片信息"

@robot.video
def handle_video(message):
    return "不好意思，我还没有能力处理视频信息"

@robot.unknown
def handle_unknown(message):
    return "不好意思，我未能识别您此消息的内容"
    #recognized_text = message.recognition

    #reply_msg = GLM(message.source, recognized_text)
    #return reply_msg

# Set up the custom menu when the server starts
set_menu()

@robot.subscribe
def subscribe(message):
    return "感谢关注我们的公众号！我是<老王杂谈说>的机器助理，我将为您提供优质的内容和服务。"

@robot.unsubscribe
def unsubscribe(message):
    return "很遗憾您将离我们而去，希望下次还能见到您。"

robot.run()
