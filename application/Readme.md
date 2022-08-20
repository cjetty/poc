## Below are the list of packages need to be installed in the VM
* sudo apt-get install vim
* sudo apt-get install docker.io
* sudo apt-get install curl
* curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
* sudo install minikube-linux-amd64 /usr/local/bin/minikube 
* sudo usermod -aG docker $USER && newgrp docker # Need to add user to the group to start minikube service
### These two will go in .profile
* eval $(minikube docker-env)
* alias kubectl="minikube kubectl --"  