# Questa docker

**NB the Dockerfile accepts the EULA for Questa on your behalf.**

Questa wants ancient distributions of Linux which means it's easier to use in docker.  There are some bash scripts for beginners.

You can review the OS support for each tool [here](https://www.altera.com/design/guidance/software/os-support).

A license is required set `SALT_LICENSE_SERVER` to the location of your license before or as you start Questa.

## Ubuntu 20.04
The only version of Ubuntu supported by Questa FPGA edition, but already out of support from Cannonical.

 - Dockerfile a docker file that installs the dependencies to use Questa including GUI and then installs Questa from web installer
 - `source build_image.sh` builds a new image using Ubuntu 20.04 and Questa FPGA edition 25.3.1
 - `source run_new_container.sh` runs the image you build above in a new container 

## Rocky 9

Rocky is a downstream rebuild of Red Hat Enterprise Linux with Red Hat IP removed.  CentOS was similar before Red Hat moved CentOS to upstream of RHEL.

Coming soon

