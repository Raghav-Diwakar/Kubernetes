# Setting up complete AWS EKS Cluster infra archotecture woth EFS provisioning and making of prometheus and grafana dashboards with dockerfiles integration

#1 - Run a Production grade Wordpress app on Kubernetes with AWS EKS provisioned and EFS done with mysql as backend database.
Objectives:
1. Create PersistentVolumeClaims and PersistentVolumes
2. ReadWriteMany volumes for deployment scaling
3. Create DockerFile for Wordpress, Mysql. All the request will proxy pass to wordpress.
4. write other required provisioners files for kubernetes


#2 - Setup monitoring and alerting for wordpress app
Objectives:
1. Deploy Prometheus / Grafana stack on kubernetes (Can use public helm charts)
2. Setup monitoring and alerting for your application deployed earlier such as I should get below container metrics 
    a. Pod CPU utilisation
    Monitoring such as:
    a. Total Request Count
    b. Total 5xx request

![image](https://user-images.githubusercontent.com/64471180/199957970-7036a9c5-9e03-406e-9032-f837fce310d7.png)

the deployments are deployed via the kustomization click file..



![image](https://user-images.githubusercontent.com/64471180/199958140-ee171369-6f52-4030-b810-5922c0b6ad22.png)

all service details and deployments



used tiller with backend of helm

![image](https://user-images.githubusercontent.com/64471180/199958924-e993572a-008e-4599-8375-871497943ba5.png)




![image](https://user-images.githubusercontent.com/64471180/199958980-44dee12b-ebdb-4da1-b0dc-9dc68c142f98.png)

prometheus launching with helm



![image](https://user-images.githubusercontent.com/64471180/199959107-46bd1ddf-12bc-4ab0-bab8-a6b3441d39cb.png)

wordpress and mysql running services




wordpress live 

![image](https://user-images.githubusercontent.com/64471180/199959284-124f75df-6014-4297-adbd-201207e6bfb2.png)

![image](https://user-images.githubusercontent.com/64471180/199959371-3334c147-0795-444b-9acd-ef8c48f387b7.png)

![image](https://user-images.githubusercontent.com/64471180/199959442-45ff91bd-c80d-41d3-b6e5-533c6d818705.png)




prometheus

![image](https://user-images.githubusercontent.com/64471180/199959580-7d0d901a-621d-4be9-bb52-44ee0a4b1121.png)


![image](https://user-images.githubusercontent.com/64471180/199959686-1cdcc4d2-a54b-4e38-896f-0ef022ef7f41.png)


grafana via aws external routing and helm

![image](https://user-images.githubusercontent.com/64471180/199959839-90446d61-5604-431a-b71b-db316122b1e2.png)


![image](https://user-images.githubusercontent.com/64471180/200020331-e231210a-b780-451b-96d7-0277658ed8ff.png)

