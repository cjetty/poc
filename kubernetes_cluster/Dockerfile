FROM europe-west2-docker.pkg.dev/du-poc/du-images/du_poc_image@sha256:ddbf56d73eeefe00a07c4cdc55c3598672df6eee5d7ef3c709388195457ef25d

RUN apt-get -y update
RUN apt-get -y upgrade
COPY . /app
WORKDIR /app
RUN pip3 install -r requirements.txt
COPY ./replay.sh /app/replay.sh
RUN chmod 777 /app/replay.sh
CMD python3 main.py  # PORT 8000