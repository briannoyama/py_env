#!/bin/bash

xhost + # allow connections to X server
sudo docker run --privileged                            \
                -e "DISPLAY=unix:0.0"                   \
                -v "/tmp/.X11-unix:/tmp/.X11-unix:rw"   \
                -v "`pwd`/$1:/mnt/$1"                   \
                --ipc=host                              \
                -it --rm py_env                         \
                $1
