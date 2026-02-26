#! /bin/bash

xhost +

docker run -it -v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY=$DISPLAY questa_fe_ubuntu:25.3.1_20.04 
