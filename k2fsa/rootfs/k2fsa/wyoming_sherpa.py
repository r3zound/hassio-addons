import asyncio
import websockets
import json
from wyoming.asr import Transcript
from wyoming.asr import Transcript
from wyoming.server import AsyncServer
from wyoming.discovery import send_discovery


SHERPA_URL = "ws://localhost:6006/ws"
WYOMING_PORT = 10300

async def get_transcription() -> str:
    """连接 Sherpa websocket 并等待识别结果"""
    async with websockets.connect(SHERPA_URL) as ws:
        print("[Bridge] Connected to Sherpa.")
        while True:
            message = await ws.recv()
            try:
                data = json.loads(message)
                if text := data.get("text"):
                    return text
            except Exception as e:
                print(f"[Bridge] JSON decode error: {e}")

async def handle_request(request):
    """处理 Wyoming 语音请求"""
    print("[Bridge] Received ASR request, waiting for Sherpa result...")
    text = await get_transcription()

    # 返回 Transcript 对象封装为 Message
    return Message(
        type="text",
        payload=Transcript(text=text, is_final=True).to_dict()
    )

async def asr_server():
    server = AsyncServer(f"tcp://0.0.0.0:{WYOMING_PORT}")
    await send_discovery(
        name="Sherpa-ONNX ASR Bridge",
        description="Bridge to Sherpa-ONNX websocket",
        address=f"tcp://localhost:{WYOMING_PORT}",
        stt=True,
        tts=False
    )

    async for client in server:
        async for message in client:
            if isinstance(message, Message):
                response = await handle_request(message)
                await client.send(response)

if __name__ == "__main__":
    asyncio.run(asr_server())
