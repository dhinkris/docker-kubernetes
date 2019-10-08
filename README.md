# Step to create and deploy docker image using kubernetes.
## 1) Docker
###
### i) create a DockerFile and include the parameters as per the project requirement
```
docker image build -t react-app .
```
### Optional: To Run the image on a specific port
```
docker run -p 3000:3000 -d react-app
```
### ii) Move the image to the docker hub using dockerhub account
```
docker login
docker tag react-app <username>/repo-name:v1
docker push <username>/repo-name:v1
```

## 2) Install Minikube
To deploy on Kubernetes, we need to create a local cluster for that supports all the features needed to run Kubernetes. Minikube is the best solution for it. minikube implements a local Kubernetes cluster on macOS, Linux, and Windows. minikube's primary goals are to be the best tool for local Kubernetes application development and to support all Kubernetes features that fit.
```
brew cask install minikube
minikube start
minikube dashboard

DOCKER_REGISTRY_SERVER=docker.io
DOCKER_USER=dhinkris
DOCKER_PASSWORD=
DOCKER_EMAIL=
kubectl create secret docker-registry regcred   --docker-server=$DOCKER_REGISTRY_SERVER   --docker-username=$DOCKER_USER   --docker-password=$DOCKER_PASSWORD   --docker-email=$DOCKER_EMAIL
kubectl get secret regcred --output=yaml
```
### Prior to installing minikube, 1) Make sure you have kubectl installed. 2) Install VirtualBox

## 3) Deploy docker image to kubernetes
### i) create deployment.yaml file that contains the deployment specific configurations that includes the name of the application, number of replicas/pods.
```
kubectl apply -f deployment.yaml
```
### ii) Define a service on services.yaml. Here mention the port/protocal where the application has to run. Again run,
```
kubectl apply -f deployment.yaml
```
