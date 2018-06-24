#!/bin/bash
echo "building application server"
cd app-srv
docker build -t myappserver .
cd ../web-srv
docker build -t mywebserver .
docker image ls
