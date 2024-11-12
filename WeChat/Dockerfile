# Start of Selection
FROM alpine:3.12

RUN apk add --no-cache python3 py3-pip && \
pip3 install zhipuai && \
pip3 install werobot


COPY Wechat_Robot.py /Wechat_Robot.py
COPY config.ini /config.ini
RUN chmod a+x /Wechat_Robot.py



COPY Wechat_Robot.py ~/Wechat_Robot.py
# Install pip and required packages

CMD [ "python3 /Wechat_Robot.py" ]