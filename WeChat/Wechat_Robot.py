import werobot
import sys
import io
import configparser
from bottle import Bottle, run, template, request, redirect
from zhipuai import ZhipuAI

# Set the encoding to handle Unicode characters
sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding='utf-8')

# Read configuration from /config/addons_config/wechat-server/config.ini
config = configparser.ConfigParser()
config.read('/config/addons_config/wechat-server/config.ini')  # Updated path to config.ini

# Ensure the required configuration keys are present
TOKEN = config['DEFAULT'].get('TOKEN', 'WeRobot')
robot = werobot.WeRoBot(token=TOKEN)
robot.config['HOST'] = config['DEFAULT'].get('HOST', '0.0.0.0')
robot.config["APP_ID"] = config['DEFAULT'].get("APP_ID", 'random')
robot.config['ENCODING_AES_KEY'] = config['DEFAULT'].get('ENCODING_AES_KEY', "random")
api_key = config['DEFAULT'].get('ZhipuAI', "random")

client = ZhipuAI(api_key=api_key)

# Flask or Bottle Web Application for Config Editing
app = Bottle()

@app.route('/config', method=['GET', 'POST'])
def config_page():
    if request.method == 'POST':
        # Get the updated values from the form
        TOKEN = request.forms.get('TOKEN')
        HOST = request.forms.get('HOST')
        APP_ID = request.forms.get('APP_ID')
        ENCODING_AES_KEY = request.forms.get('ENCODING_AES_KEY')
        ZhipuAI_key = request.forms.get('ZhipuAI')

        # Save the new values into the config file
        config.set('DEFAULT', 'TOKEN', TOKEN)
        config.set('DEFAULT', 'HOST', HOST)
        config.set('DEFAULT', 'APP_ID', APP_ID)
        config.set('DEFAULT', 'ENCODING_AES_KEY', ENCODING_AES_KEY)
        config.set('DEFAULT', 'ZhipuAI', ZhipuAI_key)

        with open('/config/addons_config/wechat-server/config.ini', 'w') as configfile:
            config.write(configfile)

        return redirect('/config')

    # Render the current config in a form
    return template('config_template', TOKEN=config['DEFAULT'].get('TOKEN', ''),
                    HOST=config['DEFAULT'].get('HOST', ''),
                    APP_ID=config['DEFAULT'].get('APP_ID', ''),
                    ENCODING_AES_KEY=config['DEFAULT'].get('ENCODING_AES_KEY', ''),
                    ZhipuAI=config['DEFAULT'].get('ZhipuAI', ''))


@robot.text
def echo(message):
    # Use the AI model for response
    response1 = client.chat.completions.create(
        model="glm-4-plus",
        messages=[
            {"role": "system", "content": "你是我微信公众号的智能助理，以纯文本的方式对话，简洁明了，不长篇大论。你的名字叫老王杂谈说。你尊重每个跟你对话的对象，并且多用礼貌用语"},
            {"role": "user", "content": "我是一位老王杂谈说的一个读者"},
            {"role": "user", "content": message.content},
        ],
    )
    return response1.choices[0].message.content

# Start the Bottle web server in a separate thread
import threading

def run_server():
    run(app, host='0.0.0.0', port=8080)

# Run the web server in a background thread
server_thread = threading.Thread(target=run_server)
server_thread.daemon = True
server_thread.start()

robot.run()
