FROM ubuntu:20.04

RUN apt-get update

RUN apt-get install -y python3.6

RUN apt-get install -y python3-pip

RUN apt-get install -y tcpreplay 

RUN apt-get install -y tcpdump 

RUN apt-get install -y net-tools 

RUN apt-get install -y inetutils-ping 

RUN apt-get install -y vim 

COPY . /home/api_scripts

WORKDIR /home/api_scripts

RUN /usr/bin/pip install -r requirements.txt

CMD python3 main.py  # PORT 8000