FROM europe-west2-docker.pkg.dev/du-poc/du-images/du_poc_image_tot@sha256:753407bf8546a344c120d1aa231613d3fc4f060cb26bbf5c9f48612e97e92fc7

RUN apt-get -y update
RUN apt-get -y upgrade
COPY . /home/api_scripts
WORKDIR /home/api_scripts
RUN chmod 777 /home/api_scripts/start_pcap_process.sh
RUN /usr/bin/pip install -r requirements.txt
CMD python3 main.py  # PORT 8000
