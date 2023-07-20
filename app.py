from fastapi import FastAPI
from pydantic import BaseModel
import subprocess

class PingRequest(BaseModel):
    target: str

app = FastAPI()

@app.post("/ping")
async def ping_server(request: PingRequest):
    response = subprocess.run(['ping', '-c', '4', request.target], stdout=subprocess.PIPE)
    return {'response': response.stdout.decode()}
