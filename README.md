

[![Build and Deploy to GKE](https://github.com/cjetty/poc/actions/workflows/google.yml/badge.svg?branch=main)](https://github.com/cjetty/poc/actions/workflows/google.yml)
## Application Code





## GKE cluster infrastructure as Code
* 





## Kubernetes WorkLoad and Service deployment 
### Below are the commands to run in order to start workload and service in GKE
* gcloud container clusters get-credentials credentials du-cluster --zone=europe-west2-c
* kubect apply -k <directory where create_namespace, deployment,expose yml files and Kustomization.yml file are present >

### Below are the commands to delete the kubernetes workload and service in GKE
* gcloud container clusters get-credentials credentials du-cluster --zone=europe-west2-c
* kubect delete -k <directory where create_namespace, deployment,expose yml files and Kustomization.yml file are present >
