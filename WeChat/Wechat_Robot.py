import werobot
import sys
import io
from zhipuai import ZhipuAI
import os

# Set the encoding to handle Unicode characters
sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding='utf-8')

# Read configuration from environment variables
TOKEN = os.getenv('TOKEN', 'WeRobot')
HOST = os.getenv('HOST', '0.0.0.0')
APP_ID = os.getenv('APP_ID', 'random')
ENCODING_AES_KEY = os.getenv('ENCODING_AES_KEY', 'random')
ZhipuAI_key = os.getenv('ZhipuAI', 'random')
PORT = os.getenv('PORT', '8080')

# Initialize WeRoBot with the token from the config
robot = werobot.WeRoBot(token=TOKEN)
robot.config['HOST'] = HOST
robot.config['APP_ID'] = APP_ID
robot.config['ENCODING_AES_KEY'] = ENCODING_AES_KEY

# Initialize ZhipuAI with the API key
client = ZhipuAI(ZhipuAI_key)

@robot.text
def echo(message):
    response1 = client.chat.completions.create(
        model="glm-4-plus",
        messages=[
            {"role": "system", "content": "你是我微信公众号的智能助理，以纯文本的方式对话，简洁明了，不长篇大论。你的名字叫老王杂谈说。你尊重每个跟你对话的对象，并且多用礼貌用语"},
            {"role": "user", "content": "我是一位老王杂谈说的一个读者"},
            {"role": "user", "content": message.content},
        ],
    )
    return response1.choices[0].message.content

robot.run()
