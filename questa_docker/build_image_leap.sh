#! /bin/bash

# check docker setup
if ! command -v docker &>/dev/null; then
	echo "docker not executeable.  Install docker"
	exit 1
fi

docker build -f Dockerfile_leap15 -t questa_fe_leap:25.3.1_15 .
