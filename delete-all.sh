#!/bin/bash

echo "CONTAINER NAME:"
docker container ls --all --format "{{.Names}}"

echo -e "\n"
read -p 'Enter  container name (eg: dbrave-spring ): ' CONTAINER_NAME
##### find image id
IMAGE_NAME= $(docker container ls --all | grep "dbrave-spring" | awk '{print $2}')


docker rm $CONTAINER_NAME

#####  docker rmi $IMAGE
## docker container ls --all | grep "dbrave-spring" | awk '{print $2}'
docker rmi $IMAGE_NAME

rm -rf $HOME/.local/bin/$CONTAINER_NAME

rm -rf  $HOME/.local/share/applications/$CONTAINER_NAME.desktop

rm -rf ~/.local/share/applications/$CONTAINER_NAME.desktop

rm -rf  ~/.local/bin/$CONTAINER_NAME


rm -rf /home/ubbe/.local/share/applications/$CONTAINER_NAME.desktop

rm -rf  /home/ubbe/.local/bin/$CONTAINER_NAME


