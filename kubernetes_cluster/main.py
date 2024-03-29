from ipaddress import ip_address
from typing import Union
import os
import subprocess
from fastapi import FastAPI, HTTPException
import uvicorn
from pydantic import BaseModel
from getmac import get_mac_address as gma

app = FastAPI()

class ReplayInput(BaseModel):
    loop: int = 5
    pod_role: str = "du"
    action: str = "stop"

class CaptureInput(BaseModel):
    action: str = "start"

    
@app.get("/")
def home():
    pod_id = os.getenv('HOSTNAME', 'NotKnown')
    return f"DU Simulator Initialization completed, Ready to take commands ! "
    
@app.post("/action/")
def pcap_trigger(input: ReplayInput):
    if input.action == "start":
        print("starting to push packets..")
        print(f"Given Parameters loop: {input.loop}")
        p = subprocess.Popen(''.join(["/home/api_scripts/start_pcap_process.sh", ' ',
                                    str(input.loop), ' ',
                                    str(input.pod_role)]), 
                            stdout=subprocess.PIPE, shell=True)
        print(p.communicate())
        return f"Finished one cycle script with parameters loop: {input.loop} from pod {os.getenv('HOSTNAME', None)}"
    elif input.action == "stop":
        p = subprocess.Popen("pkill -9 tcpreplay", stdout=subprocess.PIPE, shell=True)
        print("Stopping PCAP application..")
        return "Stopped replay script"
    else:
        print("Unknown action called.. ")
        raise HTTPException(status_code=404, detail="Item not found")

@app.get("/mac/")
def get_mac_address():
    mac = gma()
    return mac


@app.post("/tcp_capture/")
def pcap_trigger(input: CaptureInput):
    if input.action == "start":
        print("starting TCP DUMP capture..")
        command = ''.join(["nohup ", "/home/api_scripts/tcp_capture.sh ", ">> ", "./out ", "2>& ",  "1<&- ", "&"])
        print("command is %s" %command )
        p2 = subprocess.Popen(''.join(["nohup ", "/home/api_scripts/tcp_capture.sh ", ">> ", "./out ", "2>& ",  "1<&- ", "&"]), 
                              shell=True)
        print(p2.communicate())
        print("Process ID is %s" %p2.pid)
        return f"Started TCP DUMP capture in pod {os.getenv('HOSTNAME', None)}"
    elif input.action == "stop":
        print("Stopping tcpdump process..")
        _ = subprocess.Popen(''.join(["pkill", " ", "-9", " ",  "tcpdump"]), stdout=subprocess.PIPE, shell=True)
        print("Stopped tcpdump process..")
        return "Stopped tcpdump capture"
    else:
        print("Unknown action called.. ")
        raise HTTPException(status_code=404, detail="Item not found")

if __name__ == "__main__":
    uvicorn.run(app, host="0.0.0.0", port=80)
