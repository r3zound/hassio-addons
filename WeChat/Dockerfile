# Start of Selection
FROM alpine:latest

RUN apk add --no-cache python3 py3-pip \
    && apk add --no-cache gcc libffi-dev musl-dev openssl-dev

RUN pip3 install --no-cache-dir werobot zhipuai cryptography bottle requests xmltodict



COPY Wechat_Robot.py /Wechat_Robot.py
COPY config.ini /config.ini
RUN chmod a+x /Wechat_Robot.py



# Install pip and required packages

CMD [ "python3 /Wechat_Robot.py" ]