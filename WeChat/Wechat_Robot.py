

import werobot
import sys
import io
import configparser
from zhipuai import ZhipuAI

# Set the encoding to handle Unicode characters
sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding='utf-8')

# Read configuration from config.ini
config = configparser.ConfigParser()
config.read('config.ini')  # Updated path to config.ini

# Ensure the required configuration keys are present
TOKEN = config['DEFAULT'].get('TOKEN','WeRobot')
robot = werobot.WeRoBot(token=TOKEN)
robot.config['HOST'] = config['DEFAULT'].get('HOST', '0.0.0.0')
robot.config["APP_ID"] = config['DEFAULT'].get("APP_ID",'random')
robot.config['ENCODING_AES_KEY'] = config['DEFAULT'].get('ENCODING_AES_KEY',"random")
api_key = config['DEFAULT'].get('ZhipuAI',"random")

client = ZhipuAI(api_key=api_key)
#print (TOKEN, api_key)


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
    #return "hello"
    return response1.choices[0].message.content

#@robot.error_page
#def make_error_page(url):
#    return "<h1>喵喵喵 %s 不是给麻瓜访问的快走开</h1>" % url

robot.run()
