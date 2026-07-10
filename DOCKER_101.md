# Docker FAQ for FPGA people

I like to use Docker in for FPGA compilation.  There are a lot of advantages.  There are also some misconceptions that I have heard.

There is more documentation at: 
 - [dockerdocs get started](https://docs.docker.com/get-started/)
 - [docker 101 tutorial](https://www.docker.com/101-tutorial/)

I have created some Dockerfiles to make a Questa+Quartus image in various Linux distributions [here](./questa_docker)

## Why docker for FPGA development?

The reasons for docker for FPGA tools are the same as other use cases, but FPGA tools can be particuarly sensitive to:
 - Environmment variables
 - Locale
 - library version
 - active directory

Using docker means everybody has all of those set correctly _and_ the right tool version.

Docker also means that you can run your ci/cd on any service with runners/agents that support docker.  These can be your own machines or services provided by github, gitlab etc...

## Docker myths

Overheard misconcetptions vs reality:
 - docker is like a virtual machine: A bit, but it's the same kernel as your host.  No extra processing overhead, just extra disk space for your images.
 - docker is a cloud service.  You can run docker images using cloud services, but you can keep everything on your own machines

## Run docker for development

When you're developing, you probably need these things

- The x11 display on your host machine exported so you can use the GUI
- share a working directory with your host machine
- access to a floating license server (since you can't see your host machine NIC ID)

Use `-e` to share environment variables and `-v` to share directories.  To run a docker container interactively with the requirements above:

```
xhost +
docker run -it -e DISPLAY=$DISPLAY \
-v /tmp/.X11-unix:/tmp/.X11-unix \
questa_fe_rocky:25.3.1_9
export SALT_LICENSE_SERVER=<your license server>

```

Information on setting up a floating license server for your host PC [here](./eda_license_install.md)
