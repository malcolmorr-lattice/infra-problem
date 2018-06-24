# Infrastructure project 

This project deploys a sample 2 Tier web applciation using NGINX to serv static content and tomcat to host the dynamic content  

## Getting Started


### Prerequisites

- Ubuntu 16.04
- Docker
- Docker Compose


### Installing

Please follow  these instaructions to get  a copy of the project up and running on your (ubuntu) local machine for development and testing purposes. See deployment for notes on how to deploy the project on a live system.

Say what the step will be
First, add the GPG key for the official Docker repository to the system:
	curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
Add the Docker repository to APT sources:
	sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
Next, update the package database with the Docker packages from the newly added repo:
	sudo apt-get update
Make sure you are about to install from the Docker repo instead of the default Ubuntu 16.04 repo:
	apt-cache policy docker-ce
Finally, install Docker:
	sudo apt-get install -y docker-ce
If you want to avoid typing sudo whenever you run the docker command, add your username to the docker group:
	sudo usermod -aG docker ${USER}
	
Netx Install Docker Compose
	sudo curl -L https://github.com/docker/compose/releases/download/1.18.0/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
Next set the permissions:
	sudo chmod +x /usr/local/bin/docker-compose
Then we'll verify that the installation was successful by checking the version:
	docker-compose --version
```
Give the example
```

And repeat

```
until finished
```

End with an example of getting some data out of the system or using it for a little demo

## Running the tests

Explain how to run the automated tests for this system

### Break down into end to end tests

Explain what these tests test and why

```
Give an example
```

### And coding style tests

Explain what these tests test and why

```
Give an example
```

## Deployment

Add additional notes about how to deploy this on a live system

## Built With

* [Dropwizard](http://www.dropwizard.io/1.0.2/docs/) - The web framework used
* [Maven](https://maven.apache.org/) - Dependency Management
* [ROME](https://rometools.github.io/rome/) - Used to generate RSS Feeds

## Contributing

Please read [CONTRIBUTING.md](https://gist.github.com/PurpleBooth/b24679402957c63ec426) for details on our code of conduct, and the process for submitting pull requests to us.

## Versioning

We use [SemVer](http://semver.org/) for versioning. For the versions available, see the [tags on this repository](https://github.com/your/project/tags). 

## Authors

* **malcolm Orr** - *Initial work* - )
