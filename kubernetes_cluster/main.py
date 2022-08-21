from ipaddress import ip_address
from typing import Union
import os
import subprocess
from fastapi import FastAPI, HTTPException
import uvicorn
from pydantic import BaseModel
app = FastAPI()

class ReplayInput(BaseModel):
    loop: int = 5
    dest_ip_address: str = None
    dest_mac_address: str = None
    action: str = "stop"


    
@app.get("/")
def home():
    pod_id = os.getenv('HOSTNAME', 'NotKnown')
    return f"Controller Pod has been started Successfully on pod {pod_id}"
    
@app.post("/action/")
def pcap_trigger(input: ReplayInput):
    if input.action == "start":
        print("starting PCAP application..")
        print(f"Given Parameters loop: {input.loop}, dest_ip_address: {input.dest_ip_address}, dest_mac_address={input.dest_mac_address}")
        p = subprocess.Popen(''.join(["/app/replay.sh", ' ',
                                    str(input.loop), ' ', 
                                    input.dest_ip_address, ' ',
                                    input.dest_mac_address]), 
                            stdout=subprocess.PIPE, shell=True)
        print(p.communicate())
        return f"Started replay script with parameters loop: {input.loop}, dest_ip_address: {input.dest_ip_address}, dest_mac_address={input.dest_mac_address} from pod {os.getenv('HOSTNAME', None)}"
    elif ReplayInput.action == "stop":
        p = subprocess.Popen("pkill -9 replay.sh", stdout=subprocess.PIPE, shell=True)
        print("Stopping PCAP application..")
        return "Stopped replay script"
    else:
        print("Unknown action called.. ")
        raise HTTPException(status_code=404, detail="Item not found")


if __name__ == "__main__":
    uvicorn.run(app, host="0.0.0.0", port=80)