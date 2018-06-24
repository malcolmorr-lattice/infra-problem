#!/bin/bash

var1="16.4"
var2=`lsb_release -r | awk '{print $2}'`
var3="1.18.0"
#check to see if this is the right version of ubunto
if [ "var2" != "$var1" ]
then
	echo "right version of ubuntu $var1 installing Docker Engine"
 	sudo apt-get update
	sudo apt-get install curl -y #install curl if not present
	/usr/bin/curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add - #add docker key
	sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" #add docker repo`
	apt-cache policy docker-ce
	sudo apt-get install -y docker-ce #add docker engine
	sudo usermod -aG docker ${USER} #set coker user to use docker 
	echo "installing Docker Compose version $var3" #download compose
	sudo /usr/bin/curl -L https://github.com/docker/compose/releases/download/$var3/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
        sudo chmod +x /usr/local/bin/docker-compose	
else
	echo "wrong version of ubuntu you need $var1"
fi
