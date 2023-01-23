#!/bin/bash

##
## dBrave Installation Script
##

## maintained by: hkdb <hkdb@3df.io>

echo -e "\n"
read -sp 'Enter a password for your container user: ' DBRAVE_PASS

echo -e "\n"
read -p 'Enter container name: ' CONTAINER_NAME

echo -e "\nLaunching container...\n"
docker run -d --name $CONTAINER_NAME --hostname dbrave --user $USER -v dbrave-home:/home/$USER -v $DBRAVE_DL:/home/$USER/Downloads -v /tmp/.X11-unix:/tmp/.X11-unix --security-opt seccomp=./brave.json -e DISPLAY=unix$DISPLAY --device /dev/dri -v /dev/shm:/dev/shm --device /dev/snd debian/dbrave:v0.01

echo -e "\nCompleted... If all went well, you should see a Brave browser popping up. To launch it again after you close it, simply type \"docker start dbrave\"...\n"

echo -e "\nDone... exiting...\n"
