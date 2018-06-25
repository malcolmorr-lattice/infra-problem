# Infrastructure project 

This project deploys a sample 2 Tier web application using NGINX to serve static content and tomcat to host the dynamic content. NGINX and tomcat are hosted in separate containers and connected through a private network. The NGINX container exposes port 80 on the host and is therefore accessible from other hosts.
![Screenshot](https://github.com/malcolmorr-lattice/infra-problem/blob/master/images/intro-image.JPG?raw=true)

The diagram above illustrates the scaling options using either multiple application containers using NGINX load balancing or using multiple hosts (with multiple containers) and an external load balancer as the persistence tier is file based this will cause issues as each app container will currently see its own posts only and when the container is stopped the post will disappear.

A simple solution is to use Container volumes and a remote file system such as NFS/EFS but a more suitable solution would be to consider a database solution

## Getting Started


### Prerequisites

- Ubuntu 16.04
- Docker
- Docker Compose


### Installing

Please follow  these instaructions to get  a copy of the project up and running on your (ubuntu) local machine for development and testing purposes. See deployment for notes on how to deploy the project on a live system.

Clone the following project https://github.com/malcolmorr-lattice/infra-problem.git and the CD into the directory
 ```
1. git clone https://github.com/malcolmorr-lattice/infra-problem.git
2. cd infra-problem/
```
Run the development enviornment build script to install the docker engine and docker compose binaries
```
3. ./build-dev.sh
```
Run the container build script to build the base containers
```
4.  ./build-docker-images.sh and you will see the 4 images when you run the docker image ls command
REPOSITORY          TAG                 IMAGE ID            CREATED                  SIZE
mywebserver         latest              xx       	    Less than a second ago   18MB
myappserver         latest              xx                  2 seconds ago            110MB
nginx               alpine              xx                  2 weeks ago              18MB
tomcat              9.0.7-jre8-alpine   xx                  2 months ago             106MB
```
Finally start the applications service by running the docker-compose command
```
5. docker-compose up -d and then using the docker ps comamnd to verify the two servies are up
CONTAINER ID        IMAGE               COMMAND                  CREATED             STATUS              PORTS                
94a2d771e50f        myappserver         "catalina.sh run"        2 minutes ago       Up 20 seconds       8080/tcp             
0d75b1981666        mywebserver         "nginx -g 'daemon of…"   2 minutes ago       Up 20 seconds       0.0.0.0:80->80/tcp   

## Running the tests

Explain how to run the automated tests for this system

### Break down into end to end tests

Explain what these tests test and why

```
Give an example
```

### And coding style tests

Testing can be achieved by browsing to the http endpoint on port 80 which will connect to the tomcat server or the /health.html to verify the static content is being served correctly

```
1. http://100.100.100.99
2. http://100.100.100.99/health.html
```

## Deployment

Add additional notes about how to deploy this on a live system



## Authors

* **malcolm Orr** - *Initial work* - )
