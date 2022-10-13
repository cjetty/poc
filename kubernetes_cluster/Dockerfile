#FROM europe-west2-docker.pkg.dev/du-poc/du-images/du_poc_image_tot@sha256:753407bf8546a344c120d1aa231613d3fc4f060cb26bbf5c9f48612e97e92fc7
FROM europe-west2-docker.pkg.dev/du-poc/du-images/du_poc_image@sha256:fa9249d571961b8356b43fb6f29d4bb3a3f58bb5bae7da33863e80f15af36d3b
RUN apt-get -y update
RUN apt-get -y upgrade
COPY . /home/api_scripts
WORKDIR /home/api_scripts
RUN chmod 777 /home/api_scripts/start_pcap_process.sh
RUN chmod 777 /home/api_scripts/tcp_capture.sh
RUN /usr/bin/pip install -r requirements.txt
ENTRYPOINT ["/usr/bin/python3", "/home/api_scripts/main.py"]  # PORT 80
