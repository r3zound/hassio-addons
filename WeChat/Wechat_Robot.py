import werobot
import sys
import io
import os
from zhipuai import ZhipuAI

# Set the encoding to handle Unicode characters
sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding='utf-8')

# Fetch configuration from environment variables (Home Assistant injects them)
TOKEN = os.getenv('TOKEN', 'WeRobot')  # Default to 'WeRobot' if not set
HOST = os.getenv('HOST', '0.0.0.0')  # Default to '0.0.0.0' if not set
APP_ID = os.getenv('APP_ID')  
ENCODING_AES_KEY = os.getenv('ENCODING_AES_KEY')  
ZHIPUAI_KEY = os.getenv('ZHIPUAI_KEY') 
PORT = os.getenv('PORT', 8888)  
data_path = os.getenv('data_path')  # Path for addon data

# Initialize WeRoBot with the token from the config
robot = werobot.WeRoBot(token=TOKEN)
robot.config['HOST'] = HOST
robot.config['APP_ID'] = APP_ID
robot.config['ENCODING_AES_KEY'] = ENCODING_AES_KEY
robot.config['PORT'] = PORT

# Initialize ZhipuAI and set the API key
client = ZhipuAI(api_key=ZHIPUAI_KEY)

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

robot.run()
