FROM europe-west2-docker.pkg.dev/du-poc/du-images/du_poc_image@sha256:ddbf56d73eeefe00a07c4cdc55c3598672df6eee5d7ef3c709388195457ef25d

RUN apt-get -y update
RUN apt-get -y upgrade
COPY . /home/api_scripts
WORKDIR /home/api_scripts
RUN chmod 777 /app/replay.sh
RUN /usr/bin/pip install -r requirements.txt
CMD python3 main.py  # PORT 8000
