# Setting up complete AWS EKS Cluster infra archotecture woth EFS provisioning and making of prometheus and grafana dashboards with dockerfiles integration

## 1 - Run a Production grade Wordpress app on Kubernetes with AWS EKS provisioned and EFS done with mysql as backend database.
### Objectives:
1. Create PersistentVolumeClaims and PersistentVolumes
2. ReadWriteMany volumes for deployment scaling
3. Create DockerFile for Wordpress, Mysql. All the request will proxy pass to wordpress.
4. write other required provisioners files for kubernetes


## 2 - Setup monitoring and alerting for wordpress app
### Objectives:
1. Deploy Prometheus / Grafana stack on kubernetes (Can use public helm charts)
2. Setup monitoring and alerting for your application deployed earlier such as I should get below container metrics 
    a. Pod CPU utilisation
    Monitoring such as:
    a. Total Request Count
    b. Total 5xx request 


## AWS CLI Configuration
```bash 
Configure AWS CLI

$ aws configure
AWS Access Key ID [None]: YOUR_ACCESS_KEY_ID
AWS Secret Access Key [None]: YOUR_SECRET_ACCESS_KEY
Default region name [None]: us-east-1
Default output format [None]:
```

# Amazon EKS Commands

## Help for AWS EKS Commands:
```bash 
aws eks help
```
## Help for AWS EKS Commands:
```bash 
aws eks create-cluster
```
## Check eksctl Version:
```bash 
eksctl version
```
## List EKS Clusters:
```bash 
aws eks list-clusters
```
## Get EKS Cluster Details:
```bash 
eksctl get cluster
```
## Create EKS Cluster Using Configuration File:
```bash 
eksctl create cluster -f cluster.yml
```

## Get Nodes in Kubernetes Cluster:
```bash 
kubectl get nodes
```
## Check Minikube Status:
```bash 
minikube status
```
## Start Minikube:
```bash 
minikube start
```
## Kubernetes Cluster Information
```bash 
kubectl cluster-info
```
## Update kubeconfig for EKS Cluster
```bash 
aws eks update-kubeconfig --name raghav-cluster
```

## Kubernetes Namespace Commands
```bash 
kubectl create namespace myros
```

## Set Current Namespace:
```bash 
kubectl config set-context --current --namespace=myros 
```


# Kubernetes Deployment Commands
## Create Deployment:
```bash 
kubectl create deployment name --image=raghavdiwakar/apache-webserver-php
```
## List Pods:
```bash 
kubectl get pods
```
## List Pods with Wide Output:
```bash 
kubectl get pods -o wide
```
## Scale Deployment:
```bash 
kubectl scale deployments name --replicas=3 
```
## Expose Deployment as a Service:
```bash 
kubectl expose deployment name --type=LoadBalancer --port=80 
```
## Get Services:
```bash 
kubectl get svc 
```



# Kubernetes Monitoring Setup with Amazon EFS, Helm, Prometheus, and Grafana


## Installation Steps

###  Install Amazon EFS Utils
```bash
sudo yum install amazon-efs-utils -y
```


###  Create Kubernetes Resources
```bash
kubectl create -k .
```

###  Verify Services and Resources
```bash
kubectl get services
kubectl get all
```

###  Initialize Helm  
```bash
kubectl -n kube-system create serviceaccount tiller
kubectl create clusterrolebinding tiller --clusterrole cluster-admin --serviceaccount=kube-system:tiller


helm init --service-account tiller --upgrade
```
###  Install Prometheus
```bash
helm install stable/prometheus --namespace prometheus --set alertmanager.persistentVolume.storageClass="gp2" --set server.persistentVolume.storageClass="gp2"
```


###  Access Prometheus
```bash
kubectl get svc -n prometheus
kubectl -n prometheus port-forward svc/intentional-arachnid-prometheus-server 8888:80
```
### Get Grafana Secret
```bash
kubectl get secret worn-bronco-grafana --namespace grafana -o yaml
```

###  Access Services
```bash
kubectl get all
```
###  Install Grafana

```bash
helm install stable/grafana --namespace grafana --set persistence.storageClassName="gp2" --set adminPassword='GrafanaAdm!n' --set datasources."datasources\.yaml".apiVersion=1 --set datasources."datasources\.yaml".datasources[0].name=Prometheus --set datasources."datasources\.yaml".datasources[0].type=prometheus --set datasources."datasources\.yaml".datasources[0].url=http://prometheus-server.prometheus.svc.cluster.local --set datasources."datasources\.yaml".datasources[0].access=proxy --set datasources."datasources\.yaml".datasources[0].isDefault=true --set service.type=LoadBalancer
```

###  Access Grafana


```bash
Username: admin
Password: GrafanaAdm!n
```