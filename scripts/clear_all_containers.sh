#!/bin/bash

sudo docker rm -f $(sudo docker ps -a -q)
sudo docker image rm -f $(sudo docker images -a -q)
sudo docker volume rm $(sudo docker volume ls -q)
