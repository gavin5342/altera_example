#! /bin/bash

# check docker setup
if ! command -v docker &>/dev/null; then
	echo "docker not executeable.  Install docker"
	exit 1
fi

docker build -t questa_fe_ubuntu:25.3.1_20.04 .
