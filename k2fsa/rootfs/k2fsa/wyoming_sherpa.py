import asyncio
import websockets
from wyoming.asr import AsrRequest, AsrResponse
from wyoming.server import AsyncServer
from wyoming.discovery import send_discovery

SHERPA_URL = "ws://localhost:6006"  # Sherpa-ONNX WebSocket
WYOMING_PORT = 10300  # 设置为 10300 端口

async def process_audio(audio_data: bytes) -> str:
    """发送音频数据到 Sherpa-ONNX 并返回 ASR 结果"""
    async with websockets.connect(SHERPA_URL) as ws:
        await ws.send(audio_data)
        response = await ws.recv()
        return response

async def handle_request(request: AsrRequest) -> AsrResponse:
    """处理 Wyoming ASR 请求"""
    audio_data = b"".join(chunk.audio for chunk in request.audio)
    text = await process_audio(audio_data)
    return AsrResponse(text=text, success=True)

async def asr_server():
    """启动 Wyoming ASR 服务器"""
    server = AsyncServer(f"tcp://localhost:{WYOMING_PORT}")  # 使用 10300 端口
    await send_discovery(
        name="Sherpa-ONNX ASR",
        description="Offline ASR using Sherpa-ONNX",
        address=f"tcp://localhost:{WYOMING_PORT}",
        stt=True,
        tts=False
    )

    async for client in server:
        async for message in client:
            if isinstance(message, AsrRequest):
                response = await handle_request(message)
                await client.send(response)

if __name__ == "__main__":
    asyncio.run(asr_server())
