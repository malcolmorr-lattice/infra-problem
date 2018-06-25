# Infrastructure project 

This project deploys a sample 2 Tier web application using NGINX to serve static content and tomcat to host the dynamic content. NGINX and tomcat are hosted in separate containers and connected through a private network. The NGINX container exposes port 80 on the host and is therefore accessible from other hosts.
![Screenshot](https://github.com/malcolmorr-lattice/infra-problem/blob/master/images/intro-image.JPG?raw=true)

The diagram above illustrates the scaling options using either multiple application containers using NGINX load balancing or using multiple hosts (with multiple containers) and an external load balancer. However as the persistence tier is file based this will cause issues as each app container will currently see its own posts only and when the container is stopped the post will disappear.

A simple solution is to use Container volumes and a remote file system such as NFS/EFS but a more suitable solution would be to consider a database solution

## Getting Started


### Prerequisites

- Ubuntu 16.04
- Docker
- Docker Compose


### Installing

Please follow  these instructions to get  a copy of the project up and running on your (ubuntu) local machine for development and testing purposes. See deployment for notes on how to deploy the project on a live system.

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
4.  ./build-docker-images.sh  
you will see the 4 images when you run the docker image ls command
REPOSITORY          TAG                 IMAGE ID            CREATED                  SIZE
mywebserver         latest              xx       	    Less than a second ago   18MB
myappserver         latest              xx                  2 seconds ago            110MB
nginx               alpine              xx                  2 weeks ago              18MB
tomcat              9.0.7-jre8-alpine   xx                  2 months ago             106MB
```
Finally start the applications service by running the docker-compose command
```
5. docker-compose up -d 
use the docker ps comamnd to verify the two servies are up
CONTAINER ID        IMAGE               COMMAND                  CREATED             STATUS              PORTS                
94a2d771e50f        myappserver         "catalina.sh run"        2 minutes ago       Up 20 seconds       8080/tcp             
0d75b1981666        mywebserver         "nginx -g 'daemon of…"   2 minutes ago       Up 20 seconds       0.0.0.0:80->80/tcp   
 ```  
## Running the tests

Testing can be achieved by browsing to the http endpoint on port 80 which will connect to the tomcat server or the /health.html to verify the static content is being served correctly, examples are shown below:-

```
1. http://100.100.100.99
2. http://100.100.100.99/health.html
```
## Deployment

This solution would work easily on any public cloud platform and this was a conscious decision as no there are no functional or non-functional requirements which indicate which platform would make most sense. An illustration of how this solution would be deployed on AWS is included below: -

The 1st step is to provide a docker platform to run the container on, ECS could be used however a more flexible IaaS solution is proposed initially to support the development of the solution. ECS or Fargate should be reviewed when worldwide releases are being considered and the overall solution is understood.  There are two options for building the EC2 instances: -
```
1.	Use the same build-dev.sh script and incorporate into the EC2 user (cloud-init) data, this has been tested and results in the same build environment across dev and production
2.	Use the same build-dev.sh script but use packer to build a custom AMI based on the ubuntu ami (ami-a4dc46db)
3.	Use cloudFormation to build the EC2 instances using user data or custom AMI’s
```
Building the containers and deploying the code could be as simple as running the build-docker-images.sh and the docker-compose command manually again giving you parity with the development environment but a more effective approach would be to integrate it into a CI pipeline using AWS CodeBuild and AWS ECR (repository) to  build and host the containers and then AWS CodePipeline to deploy the code onto the ECS clusters or Cloudformation stack depending on the platform choices made closer to worldwide deployment and whether or not an existing CI/CD toolset exists.

The final step is to sort out the persistence backend, leveraging services such as DynamoDB 

## Problem Approach
What principles did you apply?

1. Simplicity - make it easy for the developer to use and understand
2. Immutable - don’t make changes to the code on the fly, encapsulate it in a container and build new containers
3. monitor – include some capability to validate which components are healthy  
4. portability – don’t make too many choices at this point that would tie you into a platform such as AWS

Explanation of the decisions you made and why?

You can overthink these solutions and without understanding a bit more about how the client (company news) works and is trying to achieve I didn’t want to do too much based on incorrect assumptions. Using container and scripts was the simplest way to get something (MVP) working that we could work together on to refine.
I also wanted to highlight the issues (as is see it) with the persistence tier as I see this as main issue that needs to be addressed to support a more scalable solution

Why were certain tools selected?

Containers seemed a simple way to address the immutability and portability principles that I think are key and the shell scripts could be used in a variety of ways from manual to automated deployment.

What is your recommendation for future work if time allows?
```
Focus on a getting a scalable and distributed persistence tier 
Focus on which container platform (ECS, Kubernetes, Swarm ..) makes most sense for worldwide deployment
Focus on how the release process will tie into the container build process  
```

## Author

* **malcolm Orr** - *Initial work* - )
