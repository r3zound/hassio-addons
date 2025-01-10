name: 提交问题
description: 当Addon不能工作时，请提交问题以帮助我们解决问题。
title: "[issue]: "
labels: ["issue"]
body:
  - type: input
    attributes:
      label: 请告诉你用的设备是什么
      value: |
        请告诉你用的设备是什么
    - type: dropdown
    attributes:
      label: 请描述你的设备属于哪个分支
      options:
        - amd64
        - i386
        - aarch64
        - armv7
        - armhf
  - type: textarea
    attributes:
      label: 错误日志是什么
      description: 请把对应的错误日志发上来
      placeholder: |
        1. ...
        2. ...
        3. ...
    validations:
      required: true
  - type: textarea
    attributes:
      label: 请告诉我官方软件是否支持你使用的设备
      description: 请告诉我官方软件是否支持你使用的设备
    validations:
      required: true
  - type: textarea
    attributes:
      label: 截图或视频
      description: 如果可以的话，上传任何关于 bug 的截图。
      value: |
        [在这里上传图片]
    validations:
      required: true