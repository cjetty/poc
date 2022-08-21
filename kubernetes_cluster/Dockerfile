FROM ubuntu:20.04

RUN apt-get update

RUN apt-get install -y python3.6

RUN apt-get install -y python3-pip

COPY . /home/api_scripts

WORKDIR /home/api_scripts

RUN python3-pip install -r requirements.txt

CMD uvicorn main:app --reload  # PORT 8000