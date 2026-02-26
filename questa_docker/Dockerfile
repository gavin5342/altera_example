
#retrieve Ubuntu image.

FROM ubuntu:20.04

# Quartus version
ARG QVER="25.3.1"
ARG QBVER="100"

# set locale 
ENV DEBIAN_FRONTEND=noninteractive \
    LANG=C.UTF-8 \
    LC_ALL=C.UTF-8

#Update apt

RUN apt-get  update -y && apt-get  upgrade -y

# install x11 for GUI and i386 for 32b DPI libc
# vim because it's my favourite text editor
# wget and ca-certificates to download installer
RUN dpkg --add-architecture i386 && apt update -y

RUN apt-get install -y --no-install-recommends \
x11-apps libglibd-2.0-0 \
vim \
wget \
ca-certificates \
libc6:i386 libc6-dev:i386 libstdc++6:i386 \
gcc-multilib g++-multilib && \
update-ca-certificates

# Get installer
ARG QINST=qinst-linux-${QVER}-${QBVER}.run
RUN wget https://downloads.intel.com/akdlm/software/acdsinst/${QVER}/${QBVER}/qinst/${QINST} && \
chmod +x ${QINST}

## extract installer
ARG INST_LOC="/opt/altera_inst"
RUN ./${QINST} --target ${INST_LOC} --noexec

# install Questa FPGA version (combine with above step later)
RUN ${INST_LOC}/qinst.sh --cli --download-dir ./qdownload --delete-downloads --components questa_fe --auto-install --install-dir /opt/questa --accept-eula
